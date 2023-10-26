return function(v)
  if not (v == 'master' or v == 'dev' or v:match('v%d+%.%d+%.%d+')) then
    return
  end

  local git = unix.commandv('git')
  local repo = 'https://github.com/bjornbytes/lovr-docs'
  local dir = '.lovr-docs/' .. v

  if path.isdir(dir) then
    unix.execve(git, { git, '-C', dir, 'pull' })
  else
    unix.execve(git, { git, 'clone', '--depth=1', '--branch=' .. v, repo, dir })
  end
end
