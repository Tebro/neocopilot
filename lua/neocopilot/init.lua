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
  
  -- Set key mapping for Ctrl + s in the input chat buffer
  vim.api.nvim_buf_set_keymap(0, "i", "<C-s>", "<cmd>lua require('neocopilot').send_prompt_to_copilot()<CR>", { noremap = true, silent = true })
end

function M.send_prompt_to_copilot()
  local input_bufnr = vim.fn.bufnr('%')
  local input_text = vim.api.nvim_buf_get_lines(input_bufnr, 0, -1, false)
  local prompt = table.concat(input_text, "\n")
  
  local response = utils.get_copilot_response(prompt)
  
  -- Get the output buffer number
  local output_bufnr = vim.fn.bufnr('chat_output')
  
  -- Set the response in the output buffer
  vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, vim.split(response, "\n"))
end

vim.api.nvim_create_user_command("NeoCopilotChat", M.open_chat_buffers, {})

return M
