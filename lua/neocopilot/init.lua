local M = {}

local config = require("neocopilot.config")
local utils = require("neocopilot.utils")

function M.setup(user_config)
  config.update(user_config)
  -- Additional setup code can be added here
end

function M.open_chat_buffers()
  -- Create a new vertical split
  vim.cmd("vsplit")
  
  -- Open the chat output buffer on the left side
  vim.cmd("leftabove vsplit")
  vim.cmd("enew")
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "hide"
  vim.bo.swapfile = false
  vim.bo.filetype = "chat_output"
  vim.cmd("wincmd l")
  
  -- Open the chat input buffer on the right side
  vim.cmd("enew")
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "hide"
  vim.bo.swapfile = false
  vim.bo.filetype = "chat_input"
  
  -- Adjust the width of the splits
  vim.cmd("wincmd h")
  vim.cmd("vertical resize 70%")
  vim.cmd("wincmd l")
  vim.cmd("vertical resize 30%")
end

vim.api.nvim_create_user_command("NeoCopilotChat", M.open_chat_buffers, {})

return M
