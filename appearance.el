;;; appearance.el --- 



(defun display-startup-echo-area-message ()
  "If it wasn't for this you'd be GNU/Spammed by now"
  (message ""))

;; ;; font size
;; (set-face-attribute 'default nil :height 100)

;; Obvious
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; highlight the current word
(require 'idle-highlight-mode)
(idle-highlight-mode t)

;; highlight current line
(global-hl-line-mode t)

;; Don't insert instructions in the *scratch* buffer
(setq initial-scratch-message nil)

;; Emacs usually has a splash screen on startup.  Let's get rid of
;; that and start with a blank buffer.
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq inhibit-startup-echo-area-message t)

;; cursor doesn't blink
(blink-cursor-mode -1)

                                        ; Keep mouse high-lightening
(setq mouse-sel-retain-highlight t)

;; Fix scrolling
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time

(require 'smooth-scrolling)

;;(setq display-time-day-and-date t)
(setq display-time-format "%H:%M")       ;;; 15:26 11/10
(display-time)


;; Theme
(require 'color-theme)
;; (require 'colorful)
                                        ;(require 'color-theme-subdued)
;;(require 'pastels-on-dark-theme)
;;(require 'color-theme-almost-monokai)
(require 'color-theme-molokai)

;;(color-theme-initialize)
;; (colorful)
;;(color-theme-gnome2)
;;(color-theme-almost-monokai)
;; (pastels-on-dark-theme)
(color-theme-molokai)


;; ;; line numbers this slows Emacs down for some reason!
;;(require 'linum)
;;(global-linum-mode 1)



;; Show column-number in the mode line
(column-number-mode 1)

;; match parenthesis
(show-paren-mode 1)
(setq show-paren-style 'expression)


;; Change title bar to ~/file-directory if the current buffer is a
;; real file or buffer name if it is just a buffer.
(setq frame-title-format
      '(:eval
        (if buffer-file-name
            (replace-regexp-in-string
             (getenv "HOME") "~"
             (file-name-directory buffer-file-name))
          (buffer-name))))

(require 'fill-column-indicator)
;;(turn-on-fci-mode)
;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)


(setq-default indicate-empty-lines t)

(provide 'appearance)
;;; appearance.el ends here
