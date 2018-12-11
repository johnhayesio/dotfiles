# This is my keybindings for Sublime 3

```
[
  { "keys": ["ctrl+p"], "command": "show_overlay", "args": {"overlay": "command_palette"} },
  { "keys": ["ctrl+v"], "command": "toggle_side_bar" },
  { "keys": ["j", "j"], "command": "exit_insert_mode",
  "context":
  [
    { "key": "setting.command_mode", "operand": false },
    { "key": "setting.is_widget", "operand": false }
  ]}
]
```
