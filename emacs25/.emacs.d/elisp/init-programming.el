;;;; Settings common to programming modes, and those
;;;; that do not exactly deserve a separate file.

;;; Visuals

(defun trc/insert-magic-keywords-hl ()
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\|NOTE\\|HACK\\|XXX\\)"
                                 1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook             ;XXX what is prog-common-hook anyway?
          #'trc/insert-magic-keywords-hl)

(add-hook 'prog-mode-hook
          'prettify-symbols-mode)

(use-package pretty-lambdada
  :ensure t
  :disabled t ; we'll try with prettify-symbols-mode
  :config
  (pretty-lambda-for-modes))

;;; Git support
(use-package git-gutter-fringe
  :ensure t
  :diminish git-gutter-mode
  :init (setq git-gutter-fr:side 'right-fringe)
  :config
  (global-git-gutter-mode t))

(use-package gitconfig-mode
  :ensure t)

(use-package gitignore-mode
  :ensure t)

(use-package magit
  :bind (("C-x g" . magit-status))
  :ensure t)

(provide 'init-programming)
