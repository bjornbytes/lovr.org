var Module = window.Module = {
  arguments: ['./'],
  print: console.log.bind(console),
  printErr: console.error.bind(console),
  canvas: document.querySelector('canvas'),
  locateFile: function(file) {
    if (/\.mem$/.test(file)) {
      return '/static/js/lovr.js.mem';
    } else if (/\.wasm/.test(file)) {
      return '/static/js/lovr.wasm';
    } else if (/\.data$/.test(file)) {
      return '/static/play/' + file;
    }

    return file;
  }
};

if (navigator.getVRDisplays) {
  document.querySelector('canvas').style.cursor = 'default';

  navigator.getVRDisplays().then(function(displays) {
    var display = displays[0];

    if (display && display.capabilities.canPresent) {
      var vrButton = document.querySelector('button.vr-toggle');
      vrButton.style.display = 'block';

      vrButton.addEventListener('click', function(event) {
        if (display.isPresenting) {
          window.dispatchEvent(new CustomEvent('lovr.exitvr'));
        } else {
          window.dispatchEvent(new CustomEvent('lovr.entervr'));
        }
      });

      window.addEventListener('vrdisplaypresentchange', function() {
        if (display.isPresenting) {
          vrButton.textContent = 'Exit VR';
        } else {
          vrButton.textContent = 'Enter VR';
        }
      });
    }
  });
} else {
  document.querySelector('canvas').style.cursor = 'move';
  
  var vrButton = document.querySelector('button.vr-toggle');
  vrButton.innerHTML = 'Fullscreen';
  vrButton.style.display = 'block';
  var vrEmbed = window.parent.document.getElementsByClassName('embed')[0];

  vrButton.addEventListener('click', function() {
    vrEmbed.classList.add('fullscreen');
  });

  vrEmbed.addEventListener('click', function() {
    vrEmbed.classList.remove('fullscreen');
  });
}
