var aliases = [
  [ /^tube/, 'cylinder' ],
  [ /^stencil/, 'lovr.conf' ],
  [ /^stream/, 'lovr.data.newSound' ],
  [ /^(microp|captu)/, 'AudioType' ],
  [ /^controller/, 'lovr.headset' ],
  [ /^reload/, 'restart' ],
  [ /^exi/, 'quit' ],
  [ /^(love|unity|unreal)/, 'lovr' ],
  [ /matr/, 'Mat4' ],
  [ /recta/, 'Pass:plane' ],
  [ /arc/, 'Pass:circle' ],
  [ /clear/, 'Pass:fill' ],
  [ /print/, 'Pass:text' ],
  [ /msaa|multis|antia/, 'lovr.conf' ],
  [ /^video/, { type: 'unsupported', feature: 'Video playback' } ],
  [ /^icos/, { type: 'library', name: 'lovr-icosphere', link: 'https://github.com/bjornbytes/lovr-icosphere' } ],
  [ /^(enet|udp|multipla)/, { type: 'plugin', name: 'enet', link: 'https://github.com/bjornbytes/lua-enet' } ],
  [ /(socket|tcp)/, { type: 'plugin', name: 'luasocket', link: 'https://github.com/brainrom/lovr-luasocket' } ],
  [ /^(http)/, { type: 'plugin', name: 'lua-https', link: 'https://github.com/love2d/lua-https' } ],
  [ /^json/, { type: 'plugin', name: 'cjson', link: 'https://github.com/bjornbytes/lua-cjson' } ],
  [ /^hi$/, { type: 'hi' } ]
];

var main = document.querySelector('main');
var sidebar = document.querySelector('.sidebar');
var sidebarSections = Array.prototype.slice.call(sidebar.querySelectorAll('section'));
var sidebarGroups = Array.prototype.slice.call(sidebar.querySelectorAll('li.group'));
var sidebarGroupLinks = Array.prototype.slice.call(sidebar.querySelectorAll('li.group > a'));
var sidebarLinks = Array.prototype.slice.call(sidebar.querySelectorAll('a[data-key]'));
var searchBox = sidebar.querySelector('.search');
var versions = sidebar.querySelector('.versions');
var message = sidebar.querySelector('.message');
var transitionTimeout;
var data = {};

function getUrl(key) {
  return window.location.pathname.match(/\/docs(?:\/v[\d\.]+|\/master|\/dev)?/) + '/' + key;
}

function pushPage(key) {
  if (history.state) {
    var scroll = window.scrollY;
    history.replaceState({ key: history.state.key, scroll: scroll }, '', getUrl(history.state.key) + window.location.hash);
  }

  history.pushState({ key: key, scroll: 0 }, '', getUrl(key));
}

function showPage(key, scroll) {

  // Unhighlight all selected links
  var selectedLinks = Array.prototype.slice.call(sidebar.querySelectorAll('a[data-key].selected'));
  selectedLinks.forEach(function(link) {
    link.classList.remove('selected');
  });

  // Highlight selected link
  var link = sidebar.querySelector('a[data-key="' + key + '"]');
  link && link.classList.add('selected');

  // Destroy any existing content elements
  var contents = Array.prototype.slice.call(main.querySelectorAll('.content'));
  contents.forEach(function(content) {
    content.remove();
  });

  // Uh
  if (!key) {
    return;
  }

  // Create element for new content
  var content = document.createElement('div');
  content.classList.add('content');
  content.innerHTML = data[key];
  content.dataset.key = key;
  enhance(content);

  // Add the new content to the DOM (animation plays automatically)
  main.appendChild(content);
  window.scrollTo(0, scroll);

  // Set window title
  document.title = key.replace(/(.+\/)/, ' ').replace(/_/g, ' ');
}

// Syntax highlighting and autolinking
function enhance(node) {
  var pres = Array.prototype.slice.call(node.querySelectorAll('pre code'));
  pres.forEach(function(pre) {
    hljs.highlightBlock(pre);
  });

  var tds = Array.prototype.slice.call(node.querySelectorAll('td'));
  tds.forEach(function(td) {
    var tokenPattern = /(an? (?:new )?(?:temporary )?)([a-zA-Z0-9]+)/gm;
    td.innerHTML = td.innerHTML.replace(tokenPattern, function(_, prefix, token) {
      if (token !== node.dataset.key && document.querySelector('[data-key="' + token + '"]')) {
        return prefix + '<a href="' + getUrl(token) + '" data-key="' + token + '">' + token + '</a>';
      }

      return prefix + token;
    });
  });

  var codes = Array.prototype.slice.call(node.querySelectorAll('code'));
  var tokenPattern = /(^|[^\/\-])(lovr[a-zA-Z0-9\.]*|[a-zA-Z0-9:]+)([^\/\-]|$)/gm;
  codes.forEach(function(code) {
    if (!code.classList.contains('hljs') || code.classList.contains('lua')) {
      code.innerHTML = code.innerHTML.replace(tokenPattern, function(_, a, token, b) {
        if (token !== node.dataset.key && document.querySelector('[data-key="' + token + '"]')) {
          return a + '<a href="' + getUrl(token) + '" data-key="' + token + '">' + token + '</a>' + b;
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
      event.preventDefault();
    };
  });

  var hs = Array.prototype.slice.call(node.querySelectorAll('h1, h2, h3, h4, h5, h6'));
  hs.forEach(function(h) {
    h.id = h.id || h.textContent.toLowerCase().replace(/[^\w]+/g, '');
  });
}

// Stream documentation
oboe('/api' + (window.location.pathname.match(/\/docs(?:\/v[\d\.]+|\/master|\/dev)?/)))
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

// Bootstrap initial content
var initialContent = document.querySelector('.content');
if (initialContent) {
  var key = initialContent.dataset.key;
  if (key.length > 0 && (!history.state || history.state.key !== key)) {
    history.replaceState({ key: key }, '', getUrl(key) + window.location.hash);
  }

  enhance(initialContent);
  var link = sidebar.querySelector('[data-key="' + key + '"]');

  if (link) {
    var linkGeometry = link.getBoundingClientRect();
    sidebar.scrollTop = linkGeometry.top - linkGeometry.height / 2 -  sidebar.offsetHeight / 2;
  }
}

sidebarGroupLinks.forEach(function(group) {
  group.addEventListener('click', function(event) {
    event.target.parentElement.classList.toggle('open');
  });
  group.addEventListener('keypress', function(event) {
    if (event.keyCode === 13 || event.keyCode === 32) {
      event.preventDefault();
      group.click();
    }
  });
});

// Searching

function toggleSearch() {
  if (searchBox.style.display == 'block') {
    searchBox.value = '';
    searchBox.style.display = 'none';
    searchBox.blur();
    updateResults();
    document.activeElement.blur();
  } else {
    searchBox.style.display = 'block';
    searchBox.focus();
    updateResults();
  }
}

var searchIcon = document.querySelector('.search-icon');
searchIcon.addEventListener('click', toggleSearch);
searchIcon.addEventListener('keydown', function(event) { if (event.keyCode === 13) toggleSearch(); });

window.addEventListener('keydown', function(event) {
  var visibleLinks = sidebarLinks.filter(function(link) { return link.style.display === 'block'; });
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
  } else if (event.key === '/' && searchBox.style.display !== 'block') {
    searchBox.style.display = 'block';
    searchBox.focus();
    updateResults();
    event.preventDefault();
  }
});

searchBox.onkeyup = function(event) {
  if (searchBox.value === '' && event.key === 'Backspace') {
    console.log(event.keyCode);
    searchBox.style.display = '';
    searchBox.blur();
  } else {
    searchBox.style.display = 'block';
  }

  updateResults();
};

function updateResults() {
  if (/[\[\]\{\}\/\.\+\*]/.test(searchBox.value)) {
    try { var regex = new RegExp(searchBox.value); } catch (e) { regex = null; }
  }

  var query = searchBox.value.toLowerCase().replace(/ /g, '_');
  var replacements = [];
  var msg = null;
  var baseVisibility = (query === '' ? '' : 'block');

  aliases.forEach(function(alias) {
    if (!alias[0].test(query)) {
      return;
    }

    if (typeof alias[1] === 'string') {
      replacements.push(alias);
    } else {
      msg = alias[1];
    }
  });

  sidebarSections.forEach(function(section) {
    section.style.display = 'none';
  });

  sidebarGroups.forEach(function(group) {
    group.style.display = 'none';
  });

  var shownSections = {};
  var shownGroups = {};

  sidebarLinks.forEach(function(link) {
    var key = link.dataset.key.toLowerCase();
    var lazyKey = key.replace(/[:.]/g, '');
    var section = link.closest('section');
    var group = link.closest('li.group');
    var visible = key.indexOf(query) >= 0 || lazyKey.indexOf(query) >= 0 || (regex && regex.test(link.dataset.key));

    visible = visible || replacements.find(function(alias) {
      return key.indexOf(alias[1].toLowerCase()) >= 0;
    });

    if (visible && !shownSections[section.className]) {
      shownSections[section.className] = true;
      section.style.display = baseVisibility;
    }

    if (visible && group && !shownGroups[group.firstChild.textContent]) {
      shownGroups[group.firstChild.textContent] = true;
      group.style.display = baseVisibility;
      group.firstChild.style.display = baseVisibility;
      if (query === '') {
        group.classList.remove('open');
      } else {
        group.classList.add('open');
      }
    }

    link.style.display = visible ? baseVisibility : 'none';
  });

  if (msg) {
    var html = null;

    if (msg.type === 'unsupported') {
      html = msg.feature + ' ' + (/s$/.test(msg.feature) ? 'are' : 'is') + ' not supported yet.  ';
      html += 'Head over to the <a href="https://github.com/bjornbytes/lovr/issues" target="_blank">issues page</a> ';
      html += 'for up-to-date status and discussion about new features.';
    } else if (msg.type === 'library') {
      html = 'Psst!  Check out the <a href="' + msg.link + '" target="_blank">' + msg.name + '</a> library.';
    } else if (msg.type === 'plugin') {
      html = 'Psst!  Check out the <a href="' + msg.link + '" target="_blank">' + msg.name + '</a> plugin.';
    } else if (msg.type === 'hi') {
      html = 'Hey.';
    }

    message.innerHTML = html;
    message.style.display = 'block';
  } else {
    message.style.display = '';
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
