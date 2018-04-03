;;;; All stuff related to all Lisp modes.

;;; Generic Lisp mode configuration.
(use-package lisp-mode
  :init
  (defconst lisp--prettify-symbols-alist '(("lambda"  . ?λ)
                                           ("."       . ?•))))

(use-package paren-face
  :ensure t
  :config
  (global-paren-face-mode t))

(use-package paredit
  :ensure t
  :diminish "( )"
  :init
  (dolist (mode '(emacs-lisp-mode-hook lisp-mode-hook lisp-interaction-mode-hook ielm-mode-hook))
    (add-hook mode 'enable-paredit-mode)))


;;; Emacs Lisp

(use-package eldoc
  :diminish eldoc-mode
  :init (setq eldoc-idle-delay 0.1))

(use-package emacs-lisp
  :bind (("C-c e i" . ielm)))


;;; Common Lisp
(use-package slime
  :ensure t
  ;; :diminish
  :init
  (setq inferior-lisp-program "sbcl --dynamic-space-size 4096")
  :config
  (slime-setup '(slime-fancy))
  (setq log4slime-mode nil) ;; hack, log4slime references to free variable
  (load "~/quicklisp/log4slime-setup.el")
  (global-log4slime-mode 1))

(provide 'init-lisp)
