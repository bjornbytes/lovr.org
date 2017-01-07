import oboe from 'oboe';
require('script!./highlight.js');
var main = document.querySelector('main');
var elDocs = document.querySelector('.docs');
var sidebarLinks = document.querySelectorAll('li[data-doc]');
var searchBox = document.querySelector('.search');
var transitionTimeout;

var docs = {};

function pushPage(key) {
  if (history.state) {
    var scroll = elDocs.scrollTop;
    history.replaceState({ key: history.state.key, scroll: scroll }, '', prefix + '/docs/' + history.state.key);
  }

  history.pushState({ key: key, scroll: 0 }, '', prefix + '/docs/' + key);
}

function showPage(key, scroll) {
  highlightLink(key);

  // Initiate outro animation for any existing content elements
  var contents = Array.prototype.slice.call(main.querySelectorAll('.content'));
  var isDirty = contents.length > 0;
  contents.forEach(function(content) {
    content.classList.add('outro');
    content.addEventListener('animationend', function() {
      content.remove();
    })
  });

  if (!key) {
    return;
  }

  // Create element for new content
  var newContent = document.createElement('div');
  newContent.classList.add('content');
  newContent.innerHTML = docs[key];
  newContent.dataset.key = key;
  enhance(newContent);

  // Add the new content to the DOM (animation plays automatically)
  if (transitionTimeout) { clearTimeout(transitionTimeout); }
  transitionTimeout = setTimeout(function() {
    main.appendChild(newContent);

    // Scroll to the right place if the back button was used
    if (scroll !== elDocs.scrollTop) {

      // Makes transition less jarring
      contents.forEach(function(content) {
        content.remove();
      });

      elDocs.scrollTop = scroll;
    }
  }, isDirty ? 140 : 0);

  // Set window title
  document.title = (key === 'index' ? '' : (key + ' - ')) + 'LOVR';
}

function highlightLink(key) {
  var links = Array.prototype.slice.call(document.querySelectorAll('li[data-doc].active'));
  links.forEach(function(link) {
    link.classList.remove('active');
  });

  var activeLink = document.querySelector('li[data-doc="' + key + '"]');
  activeLink && activeLink.classList.add('active');
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
      if (token !== node.dataset.key && document.querySelector('[data-doc="' + token + '"]')) {
        return '<a data-doc="' + token + '">' + token + '</a>';
      }

      return token
    });

    var links = Array.prototype.slice.call(linkable.querySelectorAll('a[data-doc]'));
    links.forEach(function(link) {
      link.style.cursor = 'pointer';
      link.onclick = function(event) {
        var key = link.dataset.doc;
        pushPage(key);
        showPage(key, 0);
      };
    });
  });
}

oboe(prefix + '/api/docs')
  .node('!.*', function(node, path, ancestors) {
    var key = path[0];
    docs[key] = node;

    var li = document.querySelector('li[data-doc="' + key + '"]');
    if (li) {
      li.classList.remove('disabled');
      li.addEventListener('click', function(event) {
        var content = document.querySelector('.content');
        if (content && content.dataset.key == key) { return; }
        pushPage(key);
        showPage(key, 0);
      });
    }
  });

// Render pages when history is updated
window.addEventListener('popstate', function(event) {
  showPage(event.state && event.state.key, event.state && event.state.scroll);
});

// Add syntax highlighting and autolinking to any initial content
var initialContent = document.querySelector('.content');
if (initialContent) {
  enhance(initialContent);
  var wrapper = document.querySelector('.wrapper');
  var link = wrapper.querySelector('[data-doc="' + initialContent.dataset.key + '"]');
  var linkGeometry = link.getBoundingClientRect();
  wrapper.scrollTop = linkGeometry.top - linkGeometry.height / 2 -  wrapper.offsetHeight / 2;
}

document.onkeydown = function(event) {
  if (event.keyCode === 27) {
    searchBox.value = '';
    searchBox.style.display = 'none';
    searchBox.blur();
    updateResults();
  } else if (event.keyCode === 8) {
    searchBox.focus();
  } else if (event.keyCode === 13) {
    var link = Array.prototype.find.call(sidebarLinks, function(link) { return link.style.display === ''; });
    if (link) {
      link.click();
    }
  }
};

document.onkeypress = function(event) {
  if (document.activeElement !== searchBox && event.key.length === 1 && /[a-zA-Z\.:]/.test(event.key)) {
    event.preventDefault();
    searchBox.style.display = 'block';
    searchBox.value += event.key;
    searchBox.focus();
    updateResults();
  }
};

searchBox.onkeydown = function() {
  setTimeout(function() {
    searchBox.style.display = searchBox.value === '' ? '' : 'block';
    updateResults();
  }, 0);
};

function updateResults() {
  sidebarLinks.forEach(function(link) {
    var visible = link.dataset.doc.toLowerCase().indexOf(searchBox.value.toLowerCase()) >= 0;
    link.style.display = visible ? '' : 'none';
  });
}
