import insert from table
import render_html, Widget from require 'lapis.html'
mde = require 'markdown_extra'

renderers = {
  modules: require 'widgets.module'
  callbacks: require 'widgets.function'
  functions: require 'widgets.function'
  objects: require 'widgets.object'
  types: require 'widgets.enum'
}

baseSort = (a, b) ->
  a = a\gsub(':__', ':zz')
  b = b\gsub(':__', ':zz')
  aBase = a\lower!\gsub('([%.:])[gs]et.', (x) -> x)\gsub('([%.:])is.', (x) -> x)
  bBase = b\lower!\gsub('([%.:])[gs]et.', (x) -> x)\gsub('([%.:])is.', (x) -> x)
  return aBase == bBase and (a < b) or (aBase < bBase)

glob = (version, justApi) ->
  data, tags, content, categories = {}, {}, {}, {}

  return nil if not lfs.attributes("content/#{version}", 'mode')

  api = loadfile("content/#{version}/api/init.lua")()
  examples = loadfile("content/#{version}/examples/init.lua")()
  guides = loadfile("content/#{version}/guides/init.lua")()

  return api if justApi

  track = (item, category) ->
    tag = item.tag or 'none'
    tags[tag] or= {}
    categories[category] or= {}
    data[item.key] = item
    insert tags[tag], item.key
    insert categories[category], item.key

  sort = (keys) ->
    table.sort keys, (a, b) -> if a\find('^lovr') == b\find('^lovr') then a < b else a > b

  postprocess =
    functions: (fn) ->
      key = fn.key
      fn.related or= {}
      addFriend = (friend) -> insert fn.related, friend if friend ~= key and data[friend]
      addFriend key\gsub('get', 'set')
      addFriend key\gsub('is', 'set')
      addFriend key\gsub('set', 'get')
      addFriend key\gsub('set', 'is')
      addFriend key\match('^(%w+):') or fn.module

    objects: (object) ->
      object.related or= {}
      insert object.related, object.extends
      insert object.related, object.module
      table.sort object.methods, (a, b) -> baseSort(a.key, b.key)

    types: (enum) ->
      enum.related or= {}
      insert enum.related, enum.module

  render = (category, item) ->
    widget = renderers[category] item
    widget.data, widget.tags = data, tags
    widget\render_to_string!

  track cb, 'callbacks' for cb in *api.callbacks
  for m in *api.modules
    track m, 'modules'
    track f, 'functions' for f in *m.functions
    track e, 'types' for e in *m.enums
    for o in *m.objects
      track o, 'objects'
      track f, 'functions' for f in *o.methods

  for tag in pairs tags
    table.sort tags[tag], baseSort

  for category, keys in pairs categories
    sort keys
    postprocess[category] and postprocess[category] data[key] for key in *keys
    content[key] = render category, data[key] for key in *keys

  categories.examples = {}
  for example in *examples do
    handle = io.open("content/#{version}/examples/#{example}/main.lua", 'r')
    continue if handle == nil
    key = content[example] and "example-#{example}" or example
    content[key] = "<h1>#{example\gsub('_', ' ')}</h1><pre><code>#{handle\read('*a')}</code></pre>"
    insert categories.examples, key
    handle\close!

  categories.guides = {}
  for guide in *guides do
    handle = io.open("content/#{version}/guides/#{guide}.md", 'r')
    continue if handle == nil
    key = content[guide] and "guide-#{guide}" or guide
    content[key] = mde.from_string handle\read('*a')
    insert categories.guides, key
    handle\close!

  content, categories

glob
