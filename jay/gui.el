(color-theme-gentooish)

;; Set font
(set-face-attribute 'default nil :font "Terminus-12")

;; set frame size
(add-to-list 'default-frame-alist '(height . 72))
(add-to-list 'default-frame-alist '(width . 200))

;;(tool-bar-mode -1)
(menu-bar-mode 1)

;; Vertical ido list
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))


(provide 'jay/gui)
