# Cursor

## Tab
Essential for cursor tab completion - it won't drop you out of snippets until you press manually tab out of them.

```json
{
  "key": "tab",
  "command": "editor.action.acceptCursorTabSuggestion",
  "when": "cpp.shouldAcceptTab && !hasSnippetCompletions && !inSnippetMode"
}
{
  "key": "tab",
  "command": "-editor.action.acceptCursorTabSuggestion",
  "when": "cpp.shouldAcceptTab"
}
```
