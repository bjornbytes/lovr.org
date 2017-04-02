<!--
category: callback
-->

lovr.load
===

This callback is called once when the game starts.  It should be used to perform initial setup work,
like loading resources and initializing classes and variables.

    function lovr.load(eye)
      model = lovr.graphics.newModel('cena.fbx')
      texture = lovr.graphics.newTexture('cena.png')
      levelGeometry = lovr.graphics.newMesh(1000)
      effects = lovr.graphics.newShader('vert.glsl', 'frag.glsl')

      loadLevel(1)
    end

See also
---

- `lovr.quit`
