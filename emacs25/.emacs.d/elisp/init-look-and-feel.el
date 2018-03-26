;;; Fonts & basic display.
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)

(column-number-mode t)
(line-number-mode t)

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
  :config
  (add-hook 'focus-in-hook #'nlinum-hl-flush-all-windows)
  (add-hook 'focus-out-hook #'nlinum-hl-flush-all-windows))

;; Still not sure whether I want Nyan Mode or not.
;; (use-package nyan-mode
;;   :ensure t
;;   :config
;;   (nyan-mode))

(provide 'init-look-and-feel)
