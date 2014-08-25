(try-load-and-configure-library
 'emmet-mode
 (add-hook 'sgml-mode-hook 'emmet-mode)
 (add-hook 'html-mode-hook 'emmet-mode)
 (add-hook 'css-mode-hook  'emmet-mode)
 (add-hook 'web-mode 'emmet-mode))
