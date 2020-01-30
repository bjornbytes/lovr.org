var loaded = {};
var activeProject = null;
var canvas = document.getElementById('canvas');
var loader = document.querySelector('.loader');
var button = document.querySelector('button');

var context = canvas.getContext('webgl2', {
  alpha: false,
  antialias: true,
  depth: true,
  stencil: true,
  preserveDrawingBuffer: true
});

var Module = window.Module = {
  noInitialRun: true,
  preRun: [findDisplay],
  postRun: [],
  print: console.log.bind(console),
  printErr: console.error.bind(console),
  thisProgram: './lovr',
  canvas: canvas,
  preinitializedWebGLContext: context,
  locateFile: function(file) {
    if (/\.wasm$/.test(file)) {
      return '/static/f/' + file;
    } else {
      return file;
    }
  },
  monitorRunDependencies: function(count) {
    if (count === 0 && activeProject) {
      if (Module.calledRun) {
        startProject();
      } else {
        Module.onRuntimeInitialized = startProject;
      }
    }
  }
};

function findDisplay() {
  if (navigator.getVRDisplays) {
    Module.addRunDependency('lovrDisplay');
    navigator.getVRDisplays().
      then(function(displays) {
        Module.lovrDisplay = displays[0];
        canvas.style.cursor = displays[0] ? 'default' : '';
      }).finally(function() {
        Module.removeRunDependency('lovrDisplay');
      });
  }
}

function startProject() {
  var width = canvas.width, height = canvas.height;
  _lovrDestroy(Browser.mainLoop.arg);

  requestAnimationFrame(function() {
    canvas.width = width;
    canvas.height = height;

    var pointerSize = 4;
    var argv = stackAlloc(2 * pointerSize);
    HEAP32[(argv >> 2) + 0] = allocateUTF8OnStack(Module.thisProgram);
    HEAP32[(argv >> 2) + 1] = allocateUTF8OnStack('/' + activeProject + '.zip');

    try {
      _main(2, argv);
    } catch (e) {
      if (e !== 'SimulateInfiniteLoop') {
        throw e;
      }
    }

    requestAnimationFrame(function() {
      loader.style.transition = 'none';
      loader.style.opacity = 1;
      getComputedStyle(loader).opacity;
      loader.style.transition = '';
      loader.style.opacity = 0;
    });
  });
}

window.runProject = function(key) {
  if (!key) {
    return;
  }

  activeProject = key;
  loader.style.opacity = 1;

  if (loaded[key]) {
    startProject();
  } else {
    var bundle = '/static/f/' + key + '.zip';
    Module.FS_createPreloadedFile('/', key + '.zip', bundle, true, false);
    loaded[key] = true;
  }
};

button.addEventListener('click', function() {
  if (Module.lovrDisplay && Module.lovrDisplay.capabilities.canPresent) {
    if (Module.lovrDisplay.isPresenting) {
      window.dispatchEvent(new CustomEvent('lovr.exitvr'));
    } else {
      window.dispatchEvent(new CustomEvent('lovr.entervr'));
    }
  } else {
    Module.requestFullscreen();
  }
});

Module.onFullscreen = function(isFullscreen) {
  if (isFullscreen) {
    Module.setCanvasSize(window.innerWidth * window.devicePixelRatio, window.innerHeight * window.devicePixelRatio);
    canvas.classList.add('fullscreen');
  } else {
    canvas.classList.remove('fullscreen');
  }
}

window.addEventListener('vrdisplaypresentchange', function() {
  if (Module.lovrDisplay && Module.lovrDisplay.isPresenting) {
    button.classList.add('presenting');
  } else {
    button.classList.remove('presenting');
  }
});

window.addEventListener('mouseup', function(event) {
  if (event.currentTarget !== canvas) {
    canvas.dispatchEvent(new MouseEvent('mouseup'));
  }
});
