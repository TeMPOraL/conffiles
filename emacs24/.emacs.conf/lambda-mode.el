(try-load-and-configure-file
 "lambda-mode.el"
 (add-hook 'emacs-lisp-mode-hook #'lambda-mode 1)
 (add-hook 'lisp-mode-hook #'lambda-mode 1)
 (setq lambda-symbol (string (make-char 'greek-iso8859-7 107))))