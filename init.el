(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

(defvar my-packages '(better-defaults paredit idle-highlight-mode ido-ubiquitous
                                      find-file-in-project magit smex scpaste smooth-scrolling
                                      expand-region ace-jump-mode color-theme color-theme-molokai
                                      fill-column-indicator projectile))

(package-initialize)
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; ;; Set path to .emacs.d
(setq dotfiles-dir "~/.emacs.d")

;; Set path to dependencies
(setq site-lisp-dir (expand-file-name "site-lisp" dotfiles-dir))
(setq elpa-dir (expand-file-name "elpa" dotfiles-dir))

;; Set up load path
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path elpa-dir)


(require 'smex)
(smex-initialize)

(require 'key-bindings)
(require 'appearance)
(require 'sane-defaults)
(require 'setup-ido)
(require 'setup-dired)
(require 'miscelanea)


(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(global-linum-mode 1)
(projectile-global-mode)
(setq-default indent-tabs-mode 1)
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
