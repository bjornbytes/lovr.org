import Widget from require 'lapis.html'

class Logo extends Widget
  content: =>
    raw [[
      <svg class="logo" viewBox="0 0 85 78">
        <defs>
          <linearGradient x1="50%" y1="10.433596%" x2="50%" y2="89.3888378%" id="linearGradient-1">
            <stop stop-color="#18A9E3" offset="0%"></stop>
            <stop stop-color="#E94699" offset="100%"></stop>
          </linearGradient>
          <path d="M36.0947816,24.4670322 C44.9603247,9.17704943 59.3351373,9.17826246 68.2002532,24.4670322 L90.4871564,62.9030025 C99.3529756,78.1929853 92.2066627,90.5879653 74.5447305,90.5879653 L29.7514983,90.5879653 C12.0809204,90.5879653 4.94373271,78.1917723 13.8085725,62.9030025 L36.0947816,24.4670322 Z" id="path-2"></path>
          <mask id="mask-3" maskContentUnits="userSpaceOnUse" maskUnits="objectBoundingBox" x="0" y="0" width="84.2947002" height="77.5879653" fill="white">
            <use xlink:href="#path-2"></use>
          </mask>
        </defs>
        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
          <g transform="translate(-10.000000, -13.000000)" stroke="url(#linearGradient-1)" stroke-width="16" fill="#FFFFFF">
            <use mask="url(#mask-3)" xlink:href="#path-2"></use>
          </g>
        </g>
      </svg>
    ]]
