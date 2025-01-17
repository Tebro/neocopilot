# NeoCopilot

A Neovim plugin for using Github copilot with advanced integration

## Ex Commands

### `:NeoCopilotChat`

This command opens two buffers, one for chat output and one for chat input, split below the current buffer. The chat output buffer is opened on the top, and the chat input buffer is opened on the bottom. The buffers are split horizontally, with the chat output buffer taking up 70% of the height and the chat input buffer taking up 30% of the height.

### Pressing Ctrl + s in the input chat buffer

When you write in the input chat buffer and press Ctrl + s, the prompt is sent to Github Copilot, and the response is presented in the top output buffer.

## Installation

To install NeoCopilot using the lazy plugin manager, add the following to your plugin configuration:

```lua
{
  "Tebro/neocopilot",
  config = function()
    require("neocopilot").setup()
  end,
}
```
