local M = {}

M.default_config = {
  option1 = true,
  option2 = false,
}

function M.update(user_config)
  M.config = vim.tbl_deep_extend("force", {}, M.default_config, user_config or {})
end

function M.install_lazy_plugin_manager()
  print("To install NeoCopilot using the lazy plugin manager, add the following to your plugin configuration:")
  print([[
  {
    "Tebro/neocopilot",
    config = function()
      require("neocopilot").setup()
    end,
  }
  ]])
end

return M
