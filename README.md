# Mac-like keyboard shortcuts in Windows

_[AutoHotkey](https://www.autohotkey.com/) config_

## Installation

0. **Before using this script you need to swap some keys in registry.** I recommend [sharp keys](https://github.com/randyrants/sharpkeys)
   1. Remap LCtrl to LAlt
   2. Remap LAlt to LCtrl
   3. Remap Tab to E0*13 key
      <br><i>I selected this key because it is not used in other programs. If you want, you can choose another unused key and fixup mapping in `*SC113::`and`\_SC113 up::` sections (use AHK key history to determine codes</i>
1. Install [AutoHotkey](https://www.autohotkey.com/)
2. Run the MacKB.ahk file
3. Put the MacKB.ahk file or a shortcut to the file in your Autostart folder to run it automatically on startup.

## Implemented commands

- Alt + Tab, Shift + Alt + Tab, Ctrl + Tab, Shift + Ctrl + Tab work normally (it was the hardest thing)))
- Ctrl + Space -- Change language
- Alt + Space -- Open search
- Win + Left/Right -- Navigate by words
- Alt + Left/Right -- Navigate to start/end of line
- Alt + [ -- Go back (for browser)
- Alt + ] -- Fo forward (for browser)
- Alt + Q -- Close app
- Ctrl + Alt + Q -- Lock
- Shift + Alt + 4, Shift + Ctrl + Alt + 4 -- Make screenshot

> I tried to implement this without using registry, it works good, but not perfect. If interesting you can find it in the first commit

_Feel free to open an issue or make a PR_
_My telegam: https://t.me/pxela_
