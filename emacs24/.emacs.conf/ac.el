(try-load-and-configure-library
 'auto-complete-config
 (ac-config-default)

 (add-hook 'slime-mode-hook 'set-up-slime-ac)
 (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
 (eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'slime-repl-mode))

 (global-auto-complete-mode t))
