{
  '^imag': 'Texture'
  '^fbo$': 'Canvas'
  '^frameb': 'Canvas'
  'render\\s*tex': 'Canvas'
  '^rtt': 'Canvas'
  '^soun': 'audio'
  '^love': 'lovr'
  '^unity': 'lovr'
  '^rng': 'random'
  'matr': 'Transform'
  'netw': 'enet'
  'multip': 'enet'
  'sock': 'enet'
  'udp': 'enet'
  'glsl': 'Shader'
  'batc.*': 'instance'
  'msaa': 'lovr.conf'
  'multis': 'lovr.conf'
  'antia': 'lovr.conf'

  '^partic': {
    type: 'unsupported',
    feature: 'Particles'
  }

  '^threa': {
    type: 'unsupported',
    feature: 'Threads'
  }

  '^overla': {
    type: 'unsupported',
    feature: 'Overlays'
  }

  'http': {
    type: 'unsupported',
    feature: 'HTTP requests'
  }

  'video': {
    type: 'unsupported',
    feature: 'Video playback'
  }

  'bezi': {
    type: 'unsupported',
    feature: 'Bezier curves'
  }

  '^(android|cardboard|gear|daydream|mobile)': {
    type: 'unsupported',
    feature: 'Mobile VR'
  }

  '^(ar\\s*kit|ar\\s*core|augm.*)$': {
    type: 'unsupported',
    feature: 'Augmented Reality'
  }

  '^hi$': {
    type: 'hi'
  }

  '^(unity|unreal)$': {
    type: 'no'
  }
}
