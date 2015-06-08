;;; sane-defaults.el ---


;; Lines should be 80 characters wide, not 72
(setq fill-column 80)


;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; add new line after end of file
require-final-newline 1


(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives 
                  '("melpa" .
                           "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)

;; I use version control, don't annoy me with backup files everywhere
(setq make-backup-files nil)
(setq auto-save-default nil)

(setq compilation-window-height 12)


;; make emacs use the clipboard
(setq x-select-enable-clipboard t)        ; copy-paste should work ...
      ;; interprogram-paste-function            ; ...x...
      ;; 'withcl-cut-buffer-or-selection-value)      ; ...other X clients


(setq ring-bell-function 'ignore)

(provide 'sane-defaults)
;;; sane-defaults.el ends here
