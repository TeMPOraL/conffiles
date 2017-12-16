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

;; Still not sure whether I want Nyan Mode or not.
;; (use-package nyan-mode
;;   :ensure t
;;   :config
;;   (nyan-mode))

(provide 'init-look-and-feel)
