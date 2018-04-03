;;; Fonts & basic display.
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)

(column-number-mode -1)
(line-number-mode -1)
(setq mode-line-position "")            ;Get rid of the top/bot/% stuff

(show-paren-mode t)

;;; Bell.
(setq ring-bell-function 'ignore
      visible-bell t)

;;; TODO set up a color theme at some point.

;;; Reclaim some screen space from unused features.

;; TODO bind it to a key or sth - for tablet/PC mode support.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;; Mark
(use-package visible-mark
  :ensure t
  :config
  (setq visible-mark-max 1)
  (transient-mark-mode -1)
  (global-visible-mark-mode 1)

  ;; Stolen from https://www.masteringemacs.org/article/fixing-mark-commands-transient-mark-mode.
  ;; For use if I ever want to come back to `transient-mark-mode'.
  (defun push-mark-no-activate ()
    "Pushes `point' to `mark-ring' and does not activate the region
   Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
    (interactive)
    (push-mark (point) t nil)
    (message "Pushed mark to ring"))

  (defun jump-to-mark ()
    "Jumps to the local mark, respecting the `mark-ring' order.
  This is the same as using \\[set-mark-command] with the prefix argument."
    (interactive)
    (set-mark-command 1))

  (defun exchange-point-and-mark-no-activate ()
    "Identical to \\[exchange-point-and-mark] but will not activate the region."
    (interactive)
    (exchange-point-and-mark)
    (deactivate-mark nil))

  (global-set-key (kbd "C-`") 'push-mark-no-activate)
  (global-set-key (kbd "M-`") 'jump-to-mark)
  (define-key global-map [remap exchange-point-and-mark] 'exchange-point-and-mark-no-activate))

;;; ^L handling
(use-package form-feed
  :ensure t
  :diminish form-feed-mode
  :config
  (add-hook 'text-mode-hook 'form-feed-mode)
  (add-hook 'prog-mode-hook 'form-feed-mode))

;;; Uniquification of buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-separator ":")

;;; Better window switching
(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode))

;;; Line numbers
(use-package nlinum
  :ensure t
  :disabled t                           ; Emacs 26
  :config
  ;; A hack to ensure the width of the line numbers column stays the same, instead of changing
  ;; while scrolling each time a visible line number passes an order-of-magnitude boundary.
  (defun trc/nlinum-mode-hook ()
    (when nlinum-mode
      (setq-local nlinum-format
                  (concat "%" (number-to-string (ceiling (log (max 1 (/ (buffer-size) 80)) 10)))
                          "d"))))
  (add-hook 'nlinum-mode-hook #'trc/nlinum-mode-hook)
  (global-nlinum-mode 1))

;;; Some lightweight prevention of disappearing nlinum line numbers.
(use-package nlinum-hl
  :ensure t
  :disabled t                           ; Emacs 26
  :config
  (add-hook 'focus-in-hook #'nlinum-hl-flush-all-windows)
  (add-hook 'focus-out-hook #'nlinum-hl-flush-all-windows))

(global-display-line-numbers-mode 1)    ; Emacs 26


;; Still not sure whether I want Nyan Mode or not.
;; (use-package nyan-mode
;;   :ensure t
;;   :config
;;   (nyan-mode))

(provide 'init-look-and-feel)
