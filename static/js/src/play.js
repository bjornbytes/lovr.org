var Module = window.Module = {
  arguments: ['./'],
  print: console.log.bind(console),
  printErr: console.error.bind(console),
  canvas: document.querySelector('canvas'),
  locateFile: function(file) {
    if (/\.mem$/.test(file)) {
      return '/static/js/lovr.js.mem';
    } else if (/\.data$/.test(file)) {
      return '/static/play/' + file;
    }

    return file;
  }
};

if (navigator.getVRDisplays) {
  navigator.getVRDisplays().then(function(displays) {
    if (displays && displays[0] && displays[0].capabilities.canPresent) {
      var vrButton = document.createElement('button');
      vrButton.classList.add('vr');
      document.querySelector('main').appendChild(vrButton);
      vrButton.addEventListener('click', function(event) {
        window.dispatchEvent(new CustomEvent('lovr.entervr'));
      });
    }
  });
}
