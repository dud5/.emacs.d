;;; miscelanea.el ---


;; format the whole buffer
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;;;;; jump to matching paren
(defun match-paren (arg)
  "Go to the matching  if on (){}[], similar to vi style of % "
  (interactive "p")
  ;; first, check for "outside of bracket" positions expected by forward-sexp, etc.
  (cond ((looking-at "[\[\(\{]") (forward-sexp))
        ((looking-back "[\]\)\}]" 1) (backward-sexp))
        ;; now, try to succeed from inside of a bracket
        ((looking-at "[\]\)\}]") (forward-char) (backward-sexp))
        ((looking-back "[\[\(\{]" 1) (backward-char) (forward-sexp))
        (t (self-insert-command (or arg 1)))))


;; swapping windows
(defun swap-with (dir)
  (interactive)
  (let ((other-window (windmove-find-other-window dir)))
    (when other-window
      (let* ((this-window  (selected-window))
             (this-buffer  (window-buffer this-window))
             (other-buffer (window-buffer other-window))
             (this-start   (window-start this-window))
             (other-start  (window-start other-window)))
        (set-window-buffer this-window  other-buffer)
        (set-window-buffer other-window this-buffer)
        (set-window-start  this-window  other-start)
        (set-window-start  other-window this-start))))
  )

;; swap windows and active the window to which u're moving it.
(global-set-key (kbd "M-S-<down>") (lambda () (interactive) (swap-with 'down)(windmove-down)))
(global-set-key (kbd "M-S-<up>") (lambda () (interactive) (swap-with 'up)(windmove-up)))
(global-set-key (kbd "M-S-<left>") (lambda () (interactive) (swap-with 'left)(windmove-left)))
(global-set-key (kbd "M-S-<right>") (lambda () (interactive) (swap-with 'right)(windmove-right)))


;; Like C-k but from the end of line, cool
(defun backwards-kill-line () (interactive) (kill-region
                                             (point) (progn (beginning-of-line) (point))))



(defun switch-full-screen ()
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))


(global-set-key [f11] 'switch-full-screen)


;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'miscelanea)
;;; miscelanea.el ends here
