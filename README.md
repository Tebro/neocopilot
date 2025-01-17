# NeoCopilot

A Neovim plugin for using Github copilot with advanced integration

## Ex Commands

### `:NeoCopilotChat`

This command opens two buffers, one for chat output and one for chat input, split to the side of the current buffer. The chat output buffer is opened on the left side, and the chat input buffer is opened on the right side. The buffers are split vertically, with the chat output buffer taking up 70% of the width and the chat input buffer taking up 30% of the width.

### Pressing Ctrl + s in the input chat buffer

When you write in the input chat buffer and press Ctrl + s, the prompt is sent to Github Copilot, and the response is presented in the top output buffer.
