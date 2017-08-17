import oboe from 'oboe';

require('../highlight.js');
var main = document.querySelector('main');
var embed = document.querySelector('.embed');
var iframe = embed.querySelector('iframe');
var sidebarLinks = Array.prototype.slice.call(document.querySelectorAll('li[data-key]'));
var searchBox = document.querySelector('.search');
var transitionTimeout;
var data = {};

function pushPage(key) {
  if (history.state) {
    var scroll = main.scrollTop;
    var url = window.config.base;
    url += (history.state.key.length > 0 ? ('/' + history.state.key) : '');
    history.replaceState({ key: history.state.key, scroll: scroll }, '', url);
  }

  var url = window.config.base;
  url += key.length > 0 ? ('/' + key) : '';
  history.pushState({ key: key, scroll: 0 }, '', url);
}

function showPage(key, scroll) {

  // Unhighlight all active links
  var activeLinks = Array.prototype.slice.call(document.querySelectorAll('li[data-key].active'));
  activeLinks.forEach(function(link) {
    link.classList.remove('active');
  });

  // Highlight active link
  var link = document.querySelector('li[data-key="' + key + '"]');
  link && link.classList.add('active');

  // Destroy any existing content elements
  var contents = Array.prototype.slice.call(main.querySelectorAll('.content'));
  contents.forEach(function(content) {
    content.remove();
  });

  // Show/hide embed
  setEmbed(link && link.dataset.embed);

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
  main.scrollTop = scroll;

  // Set window title
  document.title = (key === 'index' ? '' : (key.replace(/_/g, ' ') + ' - ')) + 'LOVR';
}

// Syntax highlighting and autolinking
function enhance(node) {
  var pres = Array.prototype.slice.call(node.querySelectorAll('pre code'));
  pres.forEach(function(pre) {
    pre.classList.add('lua');
    hljs.highlightBlock(pre);
  });

  var linkables = Array.prototype.slice.call(node.querySelectorAll('code, td'));
  linkables.forEach(function(linkable) {
    linkable.innerHTML = linkable.innerHTML.replace(/[a-zA-Z\.:]+/gm, function(token) {
      if (token !== node.dataset.key && document.querySelector('[data-key="' + token + '"]')) {
        return '<a data-key="' + token + '">' + token + '</a>';
      }

      return token;
    });
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
}

// Stream documentation
oboe(window.config.api)
  .node('!.*', function(node, path, ancestors) {
    var key = path[0];
    data[key] = node;

    var li = document.querySelector('li[data-key="' + key + '"]');
    if (li) {
      var onclick = function(event) {
        var content = document.querySelector('.content');
        if (content && content.dataset.key === key) { return; }
        pushPage(key);
        showPage(key, 0);
      };

      li.classList.remove('disabled');
      li.addEventListener('click', onclick);
      li.addEventListener('keypress', function(event) {
        if (event.keyCode === 13 || event.keyCode === 32) {
          event.preventDefault();
          onclick(event);
        }
      });
    }
  });

// Render pages when history is updated
window.addEventListener('popstate', function(event) {
  var page = (event.state && event.state.key) || 'Getting_Started';
  showPage(page, event.state && event.state.scroll);
});

// Embeds
function setEmbed(key) {
  if (key) {
    embed.style.display = 'block';
    iframe.style.display = 'none';
    iframe.src = '/embed/' + key;
  } else {
    embed.style.display = 'none';
    iframe.style.display = 'none';
    iframe.src = 'about:blank';
  }
}

iframe.addEventListener('load', function(event) {
  iframe.style.display = iframe.src === 'about:blank' ? 'none' : 'block';
});

// Bootstrap initial content
var initialContent = document.querySelector('.content');
if (initialContent) {
  enhance(initialContent);
  var wrapper = document.querySelector('.wrapper');
  var key = initialContent.dataset.key;
  var link = wrapper.querySelector('[data-key="' + key + '"]');

  if (link) {
    var linkGeometry = link.getBoundingClientRect();
    wrapper.scrollTop = linkGeometry.top - linkGeometry.height / 2 -  wrapper.offsetHeight / 2;
    setEmbed(link.dataset.embed);
  }
}

// Searching

document.onkeydown = function(event) {
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
};

document.onkeypress = function(event) {
  if (event.ctrlKey || event.altKey || event.metaKey) {
    return;
  }

  if (document.activeElement !== searchBox && event.key.length === 1 && /[a-zA-Z\.:]/.test(event.key)) {
    event.preventDefault();
    searchBox.style.display = 'block';
    searchBox.focus();
    searchBox.value = event.key;
    updateResults();
  }
};

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
  sidebarLinks.forEach(function(link) {
    var visible = link.dataset.key.toLowerCase().indexOf(searchBox.value.toLowerCase()) >= 0;
    link.style.display = visible ? '' : 'none';
  });
}
