(try-load-and-configure-library
 'paredit
 (autoload 'enable-paredit-mode "paredit"
   "Minor mode for pseudo-structurally editing Lisp code." t)
 (add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode 1)))
 (add-hook 'lisp-mode-hook             (lambda () (paredit-mode 1)))
 (add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode 1)))

 (defun paredit-wrap-round-from-behind ()
   (interactive)
   (forward-sexp -1)
   (paredit-wrap-round)
   (insert " ")
   (forward-char -1))

 (define-key paredit-mode-map (kbd "M-)")
   'paredit-wrap-round-from-behind)) 
