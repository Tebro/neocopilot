local M = {}

local config = require("neocopilot.config")
local utils = require("neocopilot.utils")

function M.setup(user_config)
  config.update(user_config)
  -- Additional setup code can be added here
end

return M
