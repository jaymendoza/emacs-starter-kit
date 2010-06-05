;; swank-clojure
(add-to-list 'load-path (concat dotfiles-dir "/vendor/swank-clojure"))

(setq clojure-dir "~/.clojure")

(setq swank-clojure-classpath (append (directory-files "/usr/share/java/" t ".jar$")
                                      (directory-files (concat clojure-dir "/") t ".jar$")
                                      (list (concat dotfiles-dir "/vendor/swank-clojure/src"))))

(setq swank-clojure-extra-vm-args (list "-server"
                                        "-Djava.net.preferIPv4Stack=true"
                                        "-Xms256m"
                                        "-Xmx1024m"
                                        "-XX:CompileThreshold=1500"
                                        "-XX:+UseConcMarkSweepGC"
                                        "-XX:+UseParNewGC"
                                        "-XX:+ExplicitGCInvokesConcurrent"
                                        "-XX:+CMSClassUnloadingEnabled"
                                        "-XX:MaxPermSize=250m"
                                        "-XX:+UseAdaptiveSizePolicy"
                                        "-XX:+AggressiveOpts"
                                        "-XX:+UseFastAccessorMethods"
                                        "-XX:+UseFastEmptyMethods"
                                        "-XX:+UseFastJNIAccessors"
                                        "-Xverify:none"
                                        "-XX:+UseCompressedOops"))

(eval-after-load "slime"
  '(progn
     (require 'swank-clojure)
     (add-to-list 'slime-lisp-implementations `(clojure ,(swank-clojure-cmd) :init swank-clojure-init) t)
     (add-hook 'slime-indentation-update-hooks 'swank-clojure-update-indentation)
     (add-hook 'slime-repl-mode-hook 'swank-clojure-slime-repl-modify-syntax t)
     (add-hook 'clojure-mode-hook 'swank-clojure-slime-mode-hook t)))

;; needed for overriding default method for invoking slime
(ad-activate 'slime-read-interactive-args)

;; paredit
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'clojure-mode-hook          (lambda () (paredit-mode +1)))

(provide 'jay/swank-clojure)
