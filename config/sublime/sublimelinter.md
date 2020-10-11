# Sublime Text 3 SublimeLinter Style Settings

```
// SublimeLinter Settings - User
{
  "styles": [
        {
            "mark_style": "outline",
            "priority": 1,
            "icon": "dot",
            "scope": "region.yellowish markup.changed.sublime_linter markup.warning.sublime_linter",
            "types": ["warning"]
        },
        {
            "mark_style": "outline",
            "priority": 1,
            "icon": "dot",
            "scope": "region.redish markup.deleted.sublime_linter markup.error.sublime_linter",
            "types": ["error"]
        },
        {
            "priority": 1,
            "icon": "dot",
            "mark_style": "outline"
        }
    ],
  "linters": {
    "jshint": {
      "disable": true
    }
  }
}
```
