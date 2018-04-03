;;;; Stuff for web development.

;;; JavaScript
(use-package js2-mode
  :ensure t
  :mode
  (("\\.js$" . js2-mode)
   ("\\.jsx$" . js2-jsx-mode))
  :config
  (setq js-indent-level 2))

;; TODO steal more from https://github.com/CSRaghunandan/.emacs.d/blob/master/setup-files/setup-js.el
;;      (like, e.g., json-snatcher, and browser integrations)

(use-package json-mode
  :ensure t)

;;; CSS
(use-package rainbow-mode
  :ensure t)

(use-package css-mode
  :config
  (add-hook 'css-mode-hook 'rainbow-mode))

;; TODO web mode
;; TODO rainbow-mode
;; TODO something for JS?
;; TODO fixes for XML/whatevs

(provide 'init-webdev)
