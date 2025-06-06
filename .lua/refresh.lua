return function(v)
  local git = unix.commandv('git')
  local repo = 'https://github.com/bjornbytes/lovr-docs'
  local dir = '.lovr-docs/' .. v

  if path.isdir(dir) then
    unix.execve(git, { git, '-C', dir, 'pull' })
  else
    unix.execve(git, { git, 'clone', '--depth=1', '--branch=' .. v, repo, dir })
  end
end
