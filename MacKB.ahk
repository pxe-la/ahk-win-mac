#Requires AutoHotkey v2.0

#SingleInstance

isAltTab := false
isCtrlTab := false

*LCtrl:: {
    SetKeyDelay -1

    isAltPressed := GetKeyState('LAlt', 'P')

    if (isAltPressed) {
        Send '{Blind}{LAlt down}'
    } else {
        Send '{Blind}{LCtrl up}{LAlt down}'
    }
}

*LCtrl up:: {
    global isCtrlTab

    SetKeyDelay -1
    if (isCtrlTab) {
        Send '{Blind}{LCtrl up}'
        isCtrlTab := 0
    } else {
        Send '{Blind}{LAlt up}'
    }
}

*LAlt:: {
    SetKeyDelay -1

    isCtrlPressed := GetKeyState('LCtrl', 'P')
    if (isCtrlPressed) {
        Send '{Blind}{LCtrl down}'
    } else {
        Send '{Blind}{LAlt up}{LCtrl down}'
    }
}

*LAlt up:: {
    global isAltTab

    SetKeyDelay -1
    if (isAltTab) {
        Send '{Blind}{Lalt up}'
        isAltTab := 0
    } else {
        Send '{Blind}{LCtrl up}'
    }
}

*Tab:: {
    global isAltTab
    global isCtrlTab

    isAltPressed := GetKeyState('LAlt', 'P')
    isCtrlPressed := GetKeyState('LCtrl', 'P')

    if (isAltPressed) {
        if (isAltTab = 0) {
            isAltTab := 1
            Send '{Blind}{LCtrl up}{LAlt down}{Tab down}'
        } else {
            Send '{Blind}{Tab down}'
        }
    } else if (isCtrlPressed) {
        if (isCtrlTab = 0) {
            isCtrlTab := 1
            Send '{Blind}{LAlt up}{LCtrl down}{Tab}'
        } else {
            Send '{Blind}^{Tab down}'
        }
    } else {
        Send '{Blind}{Tab down}'
    }
}

*Tab up:: {
    Send '{Blind}{Tab up}'
}

; In the following commands ctrl and alt already swapped
; in comments named physical buttons

; Ctrl_Space: change language
$!space::#space

; Alt_Space: open search
; $^space::^esc  ; for win 10
$^space::#s ; for win 11

; Ctrl_Backspace,
; Win_Backspace: Delete whole word
$!BackSpace::^BackSpace
#BackSpace::^BackSpace

; Alt_Backspace: Delete whole line
$^BackSpace:: {
    Send '{LCtrl up}+{Home}{BackSpace}{LCtrl down}'
}

; Win_{arrow}: Navigate by word
$#Left::^Left
$#Right::^Right

; Alt_[arrow]: Navigate to start/end of line
$^Left::Home
$^Right::End
; $^Up::PgUp
; $^Down::PgDn

; Alt_[bracket]: Back/forward Navigation
$^[::!Left
$^]::!Right

; Alt_Q: Exit
$^q::!F4

; Alt_Ctrl_Q: Lock
$^!q:: DllCall("LockWorkStation")

; Alt_Shift_4: Make screenshot
$+^4::+#s
$+^!4:: Send '{LCtrl up}{LAlt up}+#s'
