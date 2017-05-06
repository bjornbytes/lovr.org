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

function initVR() {
  if (!navigator.getVRDisplays) {
    return;
  }

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
}

if (!navigator.getVRDisplays) {
  var canvas = document.querySelector('canvas');
  if (canvas) {
    canvas.style.cursor = 'move';
  }

  InitializeWebVRPolyfill();
  initVR();
}

initVR();
