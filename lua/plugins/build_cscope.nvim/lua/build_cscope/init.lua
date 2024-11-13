local M = {}

local build_cscope = function(file_types, ignore_paths)
  local find_cmd = 'find . '

  -- set ignore path arguments
  if ignore_paths then
    for _, igp in pairs(ignore_paths) do
      find_cmd = find_cmd .. '-path "' .. igp .. '" -o '
    end
    -- '-path ""' is added so that the extra -o added in last iteration of loop
    -- above doesn't break the command.
    find_cmd = find_cmd .. '-path "" -prune '
  end

  -- set file type arguments
  for _, ft in pairs(file_types) do
    find_cmd = find_cmd .. '-o -iname "*.' .. ft .. '" -print '
  end

  -- redirect output to cscope.files
  find_cmd = find_cmd .. '> cscope.files'

  -- run find command and build cscope database
  os.execute(find_cmd)
  vim.cmd('Cs db build')
end

M.opts = {
  file_types = { 'c', 'h', },
  ignore_paths = { },
}

M.setup = function(opts)
  opts = opts or {}
  M.opts = vim.tbl_deep_extend('force', M.opts, opts)
  local user_command_func = function()
    build_cscope(M.opts.file_types, M.opts.ignore_paths)
  end

  vim.api.nvim_create_user_command('BuildCscope', user_command_func, {})
end

return M
