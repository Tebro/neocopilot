local M = {}

function M.is_copilot_available()
  local copilot_status, _ = pcall(require, "copilot")
  return copilot_status
end

return M
