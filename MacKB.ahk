; For this script Ctrl and Alt should be swapped using registry
; In comments named Mac Buttons
#Requires AutoHotkey v2.0
#SingleInstance

;       ^ Space
;       Change language
$!space::#space

;       ⌘ Space
;       Open search
;$^space::^esc  ; for win 10
$^space::#s ; for win 11

;       ^ Backspace, ⌥ Backspace
;       Delete whole word
$!BackSpace::^BackSpace
#BackSpace::^BackSpace

;       ⌘ Backspace
;       Delete whole line
$^BackSpace:: Send '{LCtrl up}+{Home}{BackSpace}{LCtrl down}'

;       ⌥ {arrow}
;       Navigate by word
$#Left::^Left
$#Right::^Right

;       ⌘ Left, ⌘ Right
;       Navigate to start/end of line
$^Left::Home
$^Right::End

;       ⌘ [, ⌘ ]
;       Back, forward Navigation
$^[::!Left
$^]::!Right

;       ⌘ Q
;       Exit
$^q::!F4

;       ^⌘Q
;       Lock
$^!q:: DllCall("LockWorkStation")

;       ⇧⌘4, ^⇧⌘4
;       Make screenshot
$+^4::+#s
$+^!4:: Send '{LCtrl up}{LAlt up}+#s'

;
;----------Alt Tab and Ctrl Tab fix----------┐
;
isPAltTab := false ; is Phisical Alt tab
isPCtrTab := false ; is Phisical Ctrl tab

~*LAlt up:: {
    global isPCtrTab

    if (isPCtrTab) {
        Send '{Blind}{LCtrl up}'
        isPCtrTab := 0
    }
}

~*LCtrl up:: {
    global isPAltTab

    if (isPAltTab) {
        Send '{Blind}{LAlt up}'
        isPAltTab := 0
    }
}

*Tab:: {
    global isPAltTab
    global isPCtrTab

    isAltPressed := GetKeyState('LCtrl', 'P')
    isCtrlPressed := GetKeyState('LAlt', 'P')

    if (isAltPressed) {
        if (isPAltTab = 0) {
            isPAltTab := 1
            Send '{Blind}{LCtrl up}{LAlt down}{Tab down}'
        } else {
            Send '{Blind}{Tab down}'
        }
    } else if (isCtrlPressed) {
        if (isPCtrTab = 0) {
            isPCtrTab := 1
            Send '{Blind}{LAlt up}{LCtrl down}{Tab}'
        } else {
            Send '{Blind}{Tab down}'
        }
    } else {
        Send '{Blind}{Tab down}'
    }
}

*Tab up:: {
    Send '{Blind}{Tab up}'
}
