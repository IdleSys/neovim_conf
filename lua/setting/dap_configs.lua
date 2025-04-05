local dap = require 'dap'

-- .NET
local netcoredbg_path = '/home/alireza/.local/share/nvim/mason/packages/netcoredbg/netcoredbg'
local function build_dotnet_project()
  local default_path = vim.fn.getcwd() .. '/'
  if vim.g['dotnet_last_proj_path'] ~= nil then
    default_path = vim.g['dotnet_last_proj_path']
  end
  local path = vim.fn.input('Path to your *proj file', default_path, 'file')
  vim.g['dotnet_last_proj_path'] = path
  local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
  print ''
  print('Cmd to execute: ' .. cmd)
  local f = os.execute(cmd)
  if f == 0 then
    print '\nBuild: ✔️ '
  else
    print('\nBuild: ❌ (code: ' .. f .. ')')
  end
end

local function get_dotnet_ddl_path()
  local request = function()
    return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
  end

  if vim.g['dotnet_last_dll_path'] == nil then
    vim.g['dotnet_last_dll_path'] = request()
  else
    if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
      vim.g['dotnet_last_dll_path'] = request()
    end
  end

  return vim.g['dotnet_last_dll_path']
end

local function ConfigureDotnetDap()
  vim.g.dotnet_build_project = build_dotnet_project
  vim.g.dotnet_get_dll_path = get_dotnet_ddl_path

  dap.adapters.coreclr = {
    type = 'executable',
    command = netcoredbg_path,
    args = { '--interpreter=vscode' },
  }

  dap.configurations.cs = {
    {
      type = 'coreclr',
      name = 'launch - netcoredbg',
      request = 'launch',
      program = function()
        if vim.fn.confirm('Rebuild?', '&y\n&n', 2) == 1 then
          vim.g.dotnet_build_project()
        end
        return vim.g.dotnet_get_dll_path()
      end,
    },
  }
end

local function ConfigureClangAndCppDap()
  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = 'OpenDebugAD7',
  }
  dap.configurations.cpp = {
    {
      name = 'Launch file',
      type = 'cppdbg',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopAtEntry = true,
    },
    {
      name = 'Attach to gdbserver :1234',
      type = 'cppdbg',
      request = 'launch',
      MIMode = 'gdb',
      miDebuggerServerAddress = 'localhost:1234',
      miDebuggerPath = '/usr/bin/gdb',
      cwd = '${workspaceFolder}',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
    },
  }
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
end

return { ConfigureDotnetDap = ConfigureDotnetDap, ConfigureClangAndCppDap = ConfigureClangAndCppDap }
