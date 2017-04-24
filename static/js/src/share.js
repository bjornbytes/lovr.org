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
    console.log('Sorry, your file is WAY too big (> 10MB)');
    return;
  }

  if (type !== 'application/zip') {
    console.log('Sorry, this doesn\'t look like a zip file');
    return;
  }

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
