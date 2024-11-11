local setup, go = pcall(require, "go")
if not setup then
  return
end

require('go').setup()
