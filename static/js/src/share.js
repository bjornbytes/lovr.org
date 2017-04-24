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

  if (size > 10000000) {
    drop.textContent = 'Sorry, uploads must be less than 10MB';
    drop.classList.add('error');
    return;
  }

  if (type !== 'application/zip') {
    drop.textContent = 'Hmm, this doesn\'t look like a lovr (zip) file';
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
        console.error(xhr.responseText);
        return;
      }

      var result = JSON.parse(xhr.responseText);
      window.location = '/play/' + result.id;
    }
  };

  xhr.send(form);

  drop.textContent = 'Uploading...';
});
