;; FIXME FIXME
(try-load-and-configure-file
 "prolog.el"

 (setq prolog-system 'swi)  ; optional, the system you are using;
                            ; see `prolog-system' below for possible values
 (setq prolog-program-name "swipl.exe")
 (setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
                                 ("\\.m$" . mercury-mode))
							   auto-mode-alist)))