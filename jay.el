(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

(require 'jay/meta)
(require 'jay/gui)
(require 'jay/keyboard)
(require 'jay/swank-clojure)

(load (concat dotfiles-dir "vendor/twittering-mode/twittering-mode.el"))
(require 'twittering-mode)
(require 'jay/twitter-account)
