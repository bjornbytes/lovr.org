import oboe from 'oboe';

var main = document.querySelector('main');
var docs = {};

oboe('/api/docs')
  .node('!.*', function(node, path, ancestors) {
    docs[path] = node;

    var li = document.querySelector('li[data-doc="' + path + '"]');
    if (li) {
      li.classList.remove('disabled');
      li.addEventListener('click', function(event) {
        var contents = Array.prototype.slice.call(main.querySelectorAll('.content'));
        contents.forEach(function(content) {
          content.classList.add('outro');
          content.addEventListener('animationend', function() {
            content.remove();
          })
        });

        var newContent = document.createElement('div');
        newContent.classList.add('content');
        newContent.innerHTML = docs[path];
        main.appendChild(newContent);
      });
    }
  });
