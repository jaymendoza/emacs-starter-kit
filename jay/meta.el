;; Disable annoying black square
(setq ring-bell-function 'ignore)
(setq visible-bell nil)

;; Avoid errors with Tramp
(setq max-lisp-eval-depth 15000)

;; Save backups in one place
;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir
  (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
          (if buffer-file-name
              (concat "#" (file-name-nondirectory buffer-file-name) "#")
            (expand-file-name
             (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

(setq default-tab-width 4)
(setq tab-width 4)

(defun byte-recompile-home ()
  "Speed load time by compiling dotfiles"
  (interactive)
  (byte-recompile-directory "~/.emacs.d" 0))

(defun tf-open-finder ()
  "Open the current directory in the Finder."
  (interactive)
  (shell-command-to-string "open ."))

(defun tf-open-plainview ()
  "Open the current file's HTML counterpart in Plainview browser."
  (interactive)
  (shell-command-to-string (concat "open -a Plainview.app "
                                   (file-name-directory buffer-file-name)
                                   "html/"
                                   (file-name-nondirectory buffer-file-name)
                                   ".html")))

;; disable auto searching for files unless called explicitly
(setq ido-auto-merge-delay-time 99999)

(define-key ido-file-dir-completion-map (kbd "C-c C-s") 
  (lambda() 
    (interactive)
    (ido-initiate-auto-merge (current-buffer))))

;; Run Ruby Rake
(global-set-key [(meta shift r)] 'rake)

;; Full screen toggle
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))
(global-set-key (kbd "M-n") 'toggle-fullscreen)

(prefer-coding-system 'utf-8)

(server-start)

;;(require 'line-num)

(provide 'jay/meta)
