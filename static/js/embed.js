var loaded = {};
var activeProject = null;
var canvas = document.getElementById('canvas');
var loader = document.querySelector('.loader');
var button = document.querySelector('button');

var Module = window.Module = {
  noInitialRun: true,
  preRun: [],
  postRun: [],
  print: console.log.bind(console),
  printErr: console.error.bind(console),
  thisProgram: './lovr',
  canvas: canvas,
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

    requestAnimationFrame(function() {
      loader.style.transition = 'none';
      loader.style.opacity = 1;
      getComputedStyle(loader).opacity;
      loader.style.transition = '';
      loader.style.opacity = 0;
    });

    try {
      _main(2, argv);
    } catch (e) {
      if (e !== 'SimulateInfiniteLoop' && e !== 'unwind') {
        throw e;
      }
    }
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
    var url = '/static/f/' + key + '.zip';

    var slash = key.lastIndexOf('/');
    if (slash !== -1) {
      var dirname = key.substring(0, slash);
      Module.FS_createPath('/', dirname, true, true);
    }

    Module.FS_createPreloadedFile('/', key + '.zip', url, true, false);
    loaded[key] = true;
  }
};

if (navigator.xr) {
  navigator.xr.isSessionSupported('immersive-vr').then(function(supported) {
    if (!supported) {
      return;
    }

    button.style.display = 'block';

    var presenting = false;

    function onEnter() {
      presenting = true;
      button.disabled = false;
      button.classList.add('presenting');
    }

    function onExit() {
      presenting = false;
      button.disabled = false;
      button.classList.remove('presenting');
    }

    button.addEventListener('click', function() {
      if (!presenting) {
        button.disabled = true;
        Module.lovr.enterVR().then(function(session) {
          session.addEventListener('end', onExit);
          onEnter();
        });
      } else {
        button.disabled = true;
        Module.lovr.exitVR().then(onExit);
      }
    });
  });
}

window.addEventListener('mouseup', function(event) {
  if (event.currentTarget !== canvas) {
    canvas.dispatchEvent(new MouseEvent('mouseup'));
  }
});
