local void = { br = true, hr = true, img = true, input = true, link = true, meta = true }

local function flatten(t, res)
  res = res or {}
  if type(t) == 'table' then
    for k, v in ipairs(t) do
      flatten(v, res)
    end
  else
    table.insert(res, t)
  end
  return res
end

local function classnames(t)
  if type(t) == 'string' then
    return t
  else
    local classes = {}
    for k, v in pairs(t) do
      if type(k) == 'number' and type(v) == 'string' then
        table.insert(classes, v)
      elseif v then
        table.insert(classes, k)
      end
    end
    return table.concat(classes, ' ')
  end
end

return function(f, ...) -- Inspired by https://github.com/rokf/lua-html
  return table.concat(flatten(f(setmetatable({
    print = print,
    error = error,
    type = type,
    next = next,
    pairs = pairs,
    ipairs = ipairs,
    tostring = tostring,
    string = string,
    t = table
  }, {
    __index = function(_, tag)
      return function(t)
        local buffer = {}
        if type(t) == 'string' then
          table.insert(buffer, ('<%s>'):format(tag))
          table.insert(buffer, t)
        else
          local attributes = {}
          for k, v in pairs(t) do
            if type(k) ~= 'number' and v then
              v = k == 'class' and classnames(v) or v
              if v ~= '' then
                table.insert(attributes, ('%s="%s"'):format(k, v))
              end
            end
          end
          local space = next(attributes) and ' ' or ''
          table.insert(buffer, ('<%s%s%s>'):format(tag, space, table.concat(attributes)))
          flatten(t, buffer)
        end
        if not void[tag] then table.insert(buffer, ('</%s>'):format(tag)) end
        return buffer
      end
    end
  }), ...), {}))
end
