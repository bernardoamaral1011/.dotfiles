require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
table.insert(
  require('dap').configurations.python,
  {
    type = 'python',
    request = 'launch',
    name = 'My custom launch configuration',
    program = '${file}',
    envFile= '${workspaceFolder}/.env'
  }
)
table.insert(
  require('dap').configurations.python,
  {
      name = 'Python: FastAPI',
      type = 'python',
      request = 'launch',
      module = 'uvicorn',
      args = {'src.app.main:app', '--host', '0.0.0.0', '--port', '8000'},
      jinja = true,
      envFile = '${workspaceFolder}/.env'
  }
)
