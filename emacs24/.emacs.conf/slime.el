(try-load-and-configure-library 'slime
                                (setq inferior-lisp-program "/usr/local/bin/sbcl")
                                (slime-setup '(slime-fancy)))
