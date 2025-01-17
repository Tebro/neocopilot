local M = {}

M.default_config = {
  option1 = true,
  option2 = false,
}

function M.update(user_config)
  M.config = vim.tbl_deep_extend("force", {}, M.default_config, user_config or {})
end

return M
