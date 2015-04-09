(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

(try-load-and-configure-library 'slime
                                (slime-setup '(slime-fancy)))
