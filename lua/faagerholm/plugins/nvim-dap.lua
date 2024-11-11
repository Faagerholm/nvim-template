-- import nvim-dap safely
local status, dap = pcall(require, "dap")
if not status then
  print("nvim-dap not found")
  return
end

-- nvim-dap-virtual-text
local status, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not status then
  print("nvim-dap-virtual-text not found")
  return
end

-- nvim-dap-ui
local uiStatus, dapui = pcall(require, "dapui")
if not uiStatus then
  print("nvim-dap-ui not found")
  return
end

-- go specific dap configuration, import safely
local goStatus, dap_go = pcall(require, "dap-go")
if not goStatus then
  print("dap-go not found")
  return
end

dap_go.setup()
dapui.setup()
dap_virtual_text.setup()

-- signs for breakpoint
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "⚠️", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🔍", texthl = "", linehl = "", numhl = "" })

require('telescope').load_extension('dap') -- load telescope dap extension 
