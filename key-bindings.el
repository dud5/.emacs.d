;;; key-bindings.el ---


(global-unset-key "\C-z")
(global-unset-key "\C-x z")

;; Smart M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-z") 'shell)

(global-set-key (kbd "M-g") 'goto-line)

(global-set-key [delete] 'delete-char)

;; Duplicate region
;; create a defuns file!!!
(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated."
  (interactive "p")
  (if (region-active-p)
      (duplicate-region arg)
    (duplicate-current-line arg)))

(defun duplicate-region (num &optional start end)
  "Duplicates the region bounded by START and END NUM times.
If no START and END is provided, the current region-beginning and
region-end is used. Adds the duplicated text to the kill ring."
  (interactive "p")
  (let* ((start (or start (region-beginning)))
         (end (or end (region-end)))
         (region (buffer-substring start end)))
    (kill-ring-save start end)
    (goto-char end)
    (dotimes (i num)
      (insert region))))

(defun duplicate-current-line (num)
  "Duplicate the current line NUM times."
  (interactive "p")
  (when (eq (point-at-eol) (point-max))
    (goto-char (point-max))
    (newline)
    (forward-char -1))
  (duplicate-region num (point-at-bol) (1+ (point-at-eol)))
  (goto-char (1- (point))))


(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)


;; resizing windows
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<up>") 'shrink-window)
(global-set-key (kbd "S-C-<down>") 'enlarge-window)

(global-set-key (kbd "C-)") 'match-paren)

(global-set-key "\M-f" 'iwb)

(global-set-key (kbd "C-c k") 'browse-kill-ring)


;; Jump to definition using ido-style
(global-set-key (kbd "C-x C-i") 'imenu)


;; Comment and uncomment
(global-set-key (kbd "C-,") 'comment-region)
(global-set-key (kbd "M-,") 'uncomment-region)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; C-k backwards
(global-set-key "\C-l" 'backwards-kill-line)


;; ;; allow to move between windows with shift + arrow_key
;; (when (fboundp 'windmove-default-keybindings)
;;   (windmove-default-keybindings))

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c C-SPC") 'ace-jump-mode)


(require 'expand-region)
(global-set-key (kbd "C-d") 'er/expand-region)

(global-set-key [f1] 'split-window-vertically)
(global-set-key [f2] 'split-window-horizontally)


(global-set-key [f8] 'compile)


;; Move windows, even in org-mode
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<left>") 'windmove-left)
(global-set-key (kbd "S-<up>") 'windmove-up)
(global-set-key (kbd "S-<down>") 'windmove-down)

(provide 'key-bindings)
;;; key-bindings.el ends here

(global-set-key (kbd "M-n") 'flymake-goto-next-error)
(global-set-key (kbd "M-p") 'flymake-goto-prev-error)
