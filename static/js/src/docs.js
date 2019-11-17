import oboe from 'oboe';

var aliases = [
  [ /^imag/, 'Texture' ],
  [ /^(fbo|frameb|render\\s*tex|rtt)/, 'Canvas' ],
  [ /^(love|unity|unreal)/, 'lovr' ],
  [ /^rng/, 'random' ],
  [ /matr/, 'Transform' ],
  [ /netw|multip|sock|udp/, 'enet' ],
  [ /glsl/, 'Shader' ],
  [ /batc.*/, 'instance' ],
  [ /msaa|multis|antia/, 'lovr.conf' ],
  [ /^partic/, { type: 'unsupported', feature: 'Particles' } ],
  [ /^overla/, { type: 'unsupported', feature: 'Overlays' } ],
  [ /^http/, { type: 'unsupported', feature: 'HTTP' } ],
  [ /^video/, { type: 'unsupported', feature: 'Video playback' } ],
  [ /^(ar\\s*kit|ar\\s*core|augm.*)$/, { type: 'unsupported', feature: 'AR' } ],
  [ /^hi$/, { type: 'hi' } ]
];

require('../highlight.js');
var main = document.querySelector('main');
var embed = document.querySelector('.embed');
var sidebar = document.querySelector('.sidebar');
var iframe = embed.querySelector('iframe');
var sidebarSections = Array.prototype.slice.call(sidebar.querySelectorAll('section'));
var sidebarLinks = Array.prototype.slice.call(sidebar.querySelectorAll('a[data-key]'));
var searchBox = sidebar.querySelector('.search');
var versions = sidebar.querySelector('.versions');
var aliasMessage = sidebar.querySelector('.alias-message');
var transitionTimeout;
var data = {};
var hasWebGL2 = !!document.createElement('canvas').getContext('webgl2');

function getUrl(key) {
  return window.location.pathname.match(/\/docs(?:\/v[\d\.]+|\/master)?/) + '/' + key;
}

function pushPage(key) {
  if (history.state) {
    var scroll = window.scrollY;
    history.replaceState({ key: history.state.key, scroll: scroll }, '', getUrl(history.state.key));
  }

  history.pushState({ key: key, scroll: 0 }, '', getUrl(key));
}

function showPage(key, scroll) {

  // Unhighlight all active links
  var activeLinks = Array.prototype.slice.call(sidebar.querySelectorAll('a[data-key].active'));
  activeLinks.forEach(function(link) {
    link.classList.remove('active');
  });

  // Highlight active link
  var link = sidebar.querySelector('a[data-key="' + key + '"]');
  link && link.classList.add('active');

  // Destroy any existing content elements
  var contents = Array.prototype.slice.call(main.querySelectorAll('.content'));
  contents.forEach(function(content) {
    content.remove();
  });

  setEmbed(link && link.dataset.embed);

  // Uh
  if (!key) {
    return;
  }

  // Create element for new content
  var content = document.createElement('div');
  content.classList.add('content', link && !link.dataset.embed && 'intro');
  content.innerHTML = data[key];
  content.dataset.key = key;
  enhance(content);

  // Add the new content to the DOM (animation plays automatically)
  main.appendChild(content);
  window.scrollTo(0, scroll);

  // Set window title
  document.title = (key === 'index' ? '' : (key.replace(/_/g, ' ') + ' - ')) + 'LOVR';
}

// Syntax highlighting and autolinking
function enhance(node) {
  var pres = Array.prototype.slice.call(node.querySelectorAll('pre code'));
  pres.forEach(function(pre) {
    hljs.highlightBlock(pre);
  });

  var tds = Array.prototype.slice.call(node.querySelectorAll('td'));
  tds.forEach(function(td) {
    if (td.classList.contains('pre')) {
      if (td.textContent !== node.dataset.key && document.querySelector('[data-key="' + td.textContent + '"]')) {
        td.innerHTML = '<a data-key="' + td.textContent + '">' + td.textContent + '</a>';
      }
    } else {
      var tokenPattern = /(an? (?:new )?)([a-zA-Z0-9]+)/gm;
      td.innerHTML = td.innerHTML.replace(tokenPattern, function(_, prefix, token) {
        if (token !== node.dataset.key && document.querySelector('[data-key="' + token + '"]')) {
          return prefix + '<a data-key="' + token + '">' + token + '</a>';
        }

        return prefix + token;
      });
    }
  });

  var codes = Array.prototype.slice.call(node.querySelectorAll('code'));
  var tokenPattern = /(^|[^\/\-])(lovr[a-zA-Z0-9\.]*|[a-zA-Z0-9:]+)([^\/\-]|$)/gm;
  codes.forEach(function(code) {
    if (!code.classList.contains('hljs') || code.classList.contains('lua')) {
      code.innerHTML = code.innerHTML.replace(tokenPattern, function(_, a, token, b) {
        if (token !== node.dataset.key && document.querySelector('[data-key="' + token + '"]')) {
          return a + '<a data-key="' + token + '">' + token + '</a>' + b;
        }

        return _;
      });
    }
  });

  var links = Array.prototype.slice.call(node.querySelectorAll('a[data-key]'));
  links.forEach(function(link) {
    link.style.cursor = 'pointer';
    link.onclick = function(event) {
      var key = link.dataset.key;
      pushPage(key);
      showPage(key, 0);
    };
  });

  var hs = Array.prototype.slice.call(node.querySelectorAll('h1, h2, h3, h4, h5, h6'));
  hs.forEach(function(h) {
    h.id = h.id || h.textContent.toLowerCase().replace(/[^\w]+/g, '');
  });
}

// Stream documentation
oboe('/api' + (window.location.pathname.match(/\/docs(?:\/v[\d\.]+|\/master)?/)))
  .node('!.*', function(node, path) {
    var key = path[0];
    data[key] = node;

    var a = sidebar.querySelector('a[data-key="' + key + '"]');
    if (a) {
      var onclick = function(event) {
        event.preventDefault();
        var content = document.querySelector('.content');
        if (content && content.dataset.key === key) { return; }
        pushPage(key);
        showPage(key, 0);
      };

      a.classList.remove('disabled');
      a.tabIndex = 0;
      a.addEventListener('click', onclick);
      a.addEventListener('keypress', function(event) {
        if (event.keyCode === 13 || event.keyCode === 32) {
          event.preventDefault();
          onclick(event);
        }
      });
    }

    return oboe.drop;
  });

// Render pages when history is updated
window.addEventListener('popstate', function(event) {
  var content = main.querySelector('.content');

  if (!event.state && content) {
    history.replaceState({ key: content.dataset.key, scroll: window.scrollY }, '', window.location.pathname + window.location.hash);
  }

  if (event.state && event.state.key && (!content || content.dataset.key !== event.state.key)) {
    showPage(event.state.key, event.state.scroll);
  }
});

// Embed
function resizeIframe() {
  if (iframe.style.display === 'block') {
    var canvas = iframe.contentWindow.document.querySelector('#canvas');
    if (canvas && iframe.offsetHeight !== canvas.offsetHeight) {
      iframe.style.height = canvas.offsetHeight + 'px';
    }
  }
}

function setEmbed(key) {
  if (!iframe) {
    return;
  } else if (!iframe.src && key) {
    iframe.src = '/embed';
    iframe.addEventListener('load', function() {
      setEmbed(key);
    });
    return;
  }

  if (hasWebGL2 && key) {
    embed.style.display = 'block';
    iframe.style.display = 'block';
    iframe.contentWindow.runProject(key);
    resizeIframe();
  } else {
    embed.style.display = 'none';
    iframe.style.display = 'none';
  }
}

if (iframe) {
  window.addEventListener('focus', function() {
    if (document.activeElement !== iframe) {
      iframe.classList.remove('focus');
    }
  });

  window.addEventListener('blur', function() {
    if (document.activeElement === iframe) {
      iframe.classList.add('focus');
    }
  });

  var resizeTimeout;
  function debouncedResize() {
    if (resizeTimeout) { clearTimeout(resizeTimeout); }
    resizeTimeout = setTimeout(resizeIframe, 150);
  }

  window.addEventListener('resize', debouncedResize);
}

// Bootstrap initial content
var initialContent = document.querySelector('.content');
if (initialContent) {
  var key = initialContent.dataset.key;
  if (key.length > 0 && (!history.state || history.state.key !== key)) {
    history.replaceState({ key: key }, '', getUrl(key));
  }

  enhance(initialContent);
  var link = sidebar.querySelector('[data-key="' + key + '"]');

  if (link) {
    var linkGeometry = link.getBoundingClientRect();
    sidebar.scrollTop = linkGeometry.top - linkGeometry.height / 2 -  sidebar.offsetHeight / 2;
    setEmbed(link.dataset.embed);
  }
}

// Searching

window.addEventListener('keydown', function(event) {
  var visibleLinks = sidebarLinks.filter(function(link) { return link.style.display === ''; });
  var firstVisibleLink = visibleLinks[0];

  switch (event.keyCode) {
    case 27:
      searchBox.value = '';
      searchBox.style.display = 'none';
      searchBox.blur();
      updateResults();
      break;

    case 8:
      searchBox.focus();
      break;

    case 13:
      firstVisibleLink && firstVisibleLink.click();
      searchBox.blur();
      break;

    case 40:
      if (document.activeElement === searchBox) {
        firstVisibleLink && firstVisibleLink.focus();
        event.preventDefault();
      } else if (document.activeElement && document.activeElement.dataset.key) {
        var idx = visibleLinks.indexOf(document.activeElement);
        var next = idx >= 0 && visibleLinks[idx + 1];
        if (next) {
          next.focus();
          event.preventDefault();
        }
      }
      break;

    case 38:
      if (document.activeElement && document.activeElement.dataset.key) {
        var idx = visibleLinks.indexOf(document.activeElement);
        var prev = idx >= 0 && visibleLinks[idx - 1];
        if (prev) {
          prev.focus();
          event.preventDefault();
        } else if (idx === 0) {
          searchBox.focus();
          event.preventDefault();
        }
      }
      break;
  }
});

window.addEventListener('keypress', function(event) {
  if (event.ctrlKey || event.altKey || event.metaKey) {
    return;
  }

  if (document.activeElement !== searchBox && event.key.length === 1 && /[a-zA-Z\.:\[\]]/.test(event.key)) {
    event.preventDefault();
    searchBox.style.display = 'block';
    searchBox.focus();
    searchBox.value = event.key;
    updateResults();
  }
});

searchBox.onkeyup = function() {
  setTimeout(function() {
    if (searchBox.value === '') {
      searchBox.style.display = '';
      searchBox.blur();
    } else {
      searchBox.style.display = 'block';
    }

    updateResults();
  }, 0);
};

function updateResults() {
  if (/[\[\]\{\}\/\.\+\*]/.test(searchBox.value)) {
    try { var regex = new RegExp(searchBox.value); } catch (e) { regex = null; }
  }

  var query = searchBox.value.toLowerCase();
  var replacements = [];
  var message = null;

  aliases.forEach(function(alias) {
    if (!alias[0].test(query)) {
      return;
    }

    if (typeof alias[1] === 'string') {
      replacements.push(alias);
    } else {
      message = alias[1];
    }
  });

  sidebarSections.forEach(function(section) {
    section.style.display = 'none';
  });

  var shownSections = {};

  sidebarLinks.forEach(function(link) {
    var key = link.dataset.key.toLowerCase();
    var lazyKey = key.replace(/[:.]/g, '');
    var section = link.parentElement.parentElement.parentElement;
    var visible = key.indexOf(query) >= 0 || lazyKey.indexOf(query) >= 0 || (regex && regex.test(link.dataset.key));

    visible = visible || replacements.find(function(alias) {
      return key.indexOf(alias[1].toLowerCase()) >= 0;
    });

    if (visible && !shownSections[section.className]) {
      shownSections[section.className] = true;
      section.style.display = query === '' ? '' : 'block';
    }

    link.style.display = visible ? '' : 'none';
  });

  if (message) {
    var html = null;

    if (message.type === 'unsupported') {
      html = message.feature + ' ' + (/s$/.test(message.feature) ? 'are' : 'is') + ' not supported yet.  ';
      html += 'Head over to the <a href="https://github.com/bjornbytes/lovr/issues" target="_blank">issues page</a> ';
      html += 'for up-to-date status and discussion about new features.';
    } else if (message.type === 'hi') {
      html = 'Hey.';
    } else if (message.type === 'no') {
      html = 'No.';
    }

    aliasMessage.innerHTML = html;
    aliasMessage.style.display = 'block';
  } else if (replacements.length > 0) {
    aliasMessage.textContent = 'Showing results for ' + replacements.map(function(alias) {
      return "'" + alias[1] + "'";
    }).join(', ');
    aliasMessage.style.display = 'block';
  } else {
    aliasMessage.style.display = '';
  }

  versions.style.display = searchBox.style.display == 'block' ? 'none' : 'block';
}

var sidebarToggle = document.querySelector('.sidebar-toggle');
if (sidebarToggle) {
  sidebarToggle.addEventListener('click', function() {
    sidebar.classList.toggle('open');
  });

  main.addEventListener('click', function() {
    sidebar.classList.remove('open');
  });
}
