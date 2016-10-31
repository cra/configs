;; The semicolon(;) symbol may be used anywhere for comments.

;;;;
;; Optional modifier state:
;; (set-numlock! #f or #t)
;; (set-scrolllock! #f or #t)
;; (set-capslock! #f or #t)
;;
;; Shell command key:
;; (xbindkey key "foo-bar-command [args]")
;; (xbindkey '(modifier* key) "foo-bar-command [args]")
;;
;; Scheme function key:
;; (xbindkey-function key function-name-or-lambda-function)
;; (xbindkey-function '(modifier* key) function-name-or-lambda-function)

(xbindkey '(Mod2 XF86Mail)
   "xkb-switch -s ru")

(xbindkey '(Mod2 XF86HomePage)
   "xkb-switch -s dvp")

(xbindkey '(Control alt d)
   "xkb-switch -s dvp")

;; setxkbmap dvp,ru; xmodmap ~/.xmodmap;

(xbindkey '(Control alt r)
   "xkb-switch -s ru")

(xbindkey '(Control alt g)
   "xkb-switch -s us")

(xbindkey '(Control alt v)
   "xkb-switch -s se") ;_sv_dvorak")

(xbindkey '(XF86KbdBrightnessDown)
   "/bin/bash asus-kbd-backlight down")

(xbindkey '(XF86KbdBrightnessUp)
   "/bin/bash asus-kbd-backlight up")

(xbindkey '(XF86MonBrightnessDown)
   "/usr/bin/asus-screen-brightness down")

(xbindkey '(XF86MonBrightnessUp)
   "/usr/bin/asus-screen-brightness up")


;; functional-keyz
(xbindkey '(XF86Calculator)
   "urxvtc -e bc")

;; sound
(xbindkey '(XF86AudioMute)
   "amixer -- sset Speaker toggle")

(xbindkey '(XF86AudioRaiseVolume)
   "amixer -- sset Master playback 5dB+")
(xbindkey '(XF86AudioLowerVolume)
   "amixer -- sset Master playback 5dB-")
(xbindkey '(Shift XF86AudioRaiseVolume)
   "amixer -- sset PCM playback 5dB+")
(xbindkey '(Shift XF86AudioLowerVolume)
   "amixer -- sset PCM playback 5dB-")

(xbindkey '(Shift XF86AudioRaiseVolume)
   "amixer -- sset PCM playback 5dB+")
(xbindkey '(Shift XF86AudioLowerVolume)
   "amixer -- sset PCM playback 5dB-")

; cmus
(xbindkey '(Mod2 XF86AudioPlay)
   "cmus-remote --pause")

(xbindkey '(XF86AudioNext)
    "cmus-remote --next")

(xbindkey '(XF86AudioPrev)
    "cmus-remote --prev")
