# This is my keybindings for Sublime Text 3.

```
[
{ "keys": ["ctrl+p"], "command": "show_overlay", "args": {"overlay": "command_palette"} },
{ "keys": ["ctrl+v"], "command": "toggle_side_bar" },
{ "keys": ["alt+a"], "command": "alignment" },
{ "keys": ["j", "j"], "command": "exit_insert_mode",
"context":
[
{ "key": "setting.command_mode", "operand": false },
{ "key": "setting.is_widget", "operand": false }
]},
{ "keys": ["super+v"], "command": "paste_and_indent" },
{ "keys": ["super+shift+v"], "command": "paste" },
{ "keys": ["ctrl+h"], "command": "move_to", "args": {"to": "bol", "extend": false} },
{ "keys": ["ctrl+l"], "command": "move_to", "args": {"to": "eol", "extend": false} }
]
```
