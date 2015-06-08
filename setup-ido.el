;;; setup-ido.el --- 


(require 'ido)
(ido-mode t)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10
      ido-max-work-file-list 50
      ido-max-work-directory-list 30)


;; Use C-w to go back up a dir to better match normal usage of C-w
;; - insert current file name with C-x C-w instead.
(define-key ido-file-completion-map (kbd "C-w") 'ido-delete-backward-updir)
(define-key ido-file-completion-map (kbd "C-x C-w") 'ido-copy-current-file-name)

;; Always rescan buffer for imenu
(set-default 'imenu-auto-rescan t)


(provide 'setup-ido)
;;; setup-ido.el ends here
