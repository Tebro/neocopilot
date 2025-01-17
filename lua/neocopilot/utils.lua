local M = {}

function M.is_copilot_available()
  local copilot_status, _ = pcall(require, "copilot")
  return copilot_status
end

function M.get_copilot_response(prompt)
  local copilot = require("copilot")
  local copilot_api = require("copilot.api")

  local request_body = {
    prompt = prompt,
    max_tokens = 100,
    temperature = 0.7,
  }

  local response = copilot_api.complete(request_body)

  if response and response.choices and response.choices[1] then
    return response.choices[1].text
  else
    return "Error: Unable to get response from Github Copilot"
  end
end

return M
