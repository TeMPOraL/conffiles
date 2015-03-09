;; (setq inferior-lisp-program "/usr/local/bin/sbcl")
;; (add-to-list 'load-path "/home/temporal/repos/slime")
(try-load-and-configure-library 'slime
                                (slime-setup '(slime-fancy)))
