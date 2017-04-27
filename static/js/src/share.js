var drop = document.querySelector('.drop');

drop.addEventListener('dragover', function(event) {
  event.preventDefault();
  event.stopPropagation();
});

drop.addEventListener('drop', function(event) {
  event.stopPropagation();
  event.preventDefault();

  var files = event.dataTransfer.files;
  var file = files[0];

  if (!file) {
    return;
  }

  var size = file.size;
  var type = file.type;

  if (size > 15000000) {
    drop.textContent = 'Sorry, uploads must be less than 15MB';
    drop.classList.add('error');
    return;
  }

  if (type !== 'application/zip' && type !== 'application/x-zip-compressed' && type !== 'application/octet-stream') {
    drop.textContent = 'Hmm, this doesn\'t look like a .lovr or .zip file';
    drop.classList.add('error');
    return;
  }

  drop.textContent = '';
  drop.classList.remove('error');

  var form = new FormData();
  form.append('file', file);

  var xhr = new XMLHttpRequest();
  xhr.open('post', '/api/share', true);

  xhr.onreadystatechange = function(event) {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      if (xhr.status !== 200) {
        var messages = {
          'unzip': 'There was a problem reading your upload.',
          'too many files': 'Wow, there are too many files in here! (max 1000)',
          'no main': 'I couldn\'t find a main.lua in there!',
          'absolute': 'Your upload was not packaged correctly.',
          'too big': 'Woah there, your upload was over 25MB!',
          'packing': 'I couldn\'t package your app, sorry!'
        };

        var message = messages[xhr.responseText] || 'There was a problem with the upload, sorry!';

        if (xhr.status === 413) {
          message = 'Sorry, uploads must be less than 15MB';
        }

        drop.textContent = message;
        drop.classList.add('error');
        return;
      }

      var result = JSON.parse(xhr.responseText);
      window.location = '/play/' + result.id;
    }
  };

  xhr.send(form);

  drop.textContent = 'Uploading...';
});
