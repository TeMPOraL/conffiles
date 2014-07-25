;;;; -*- mode: emacs-lisp -*-
;;;; org2blog/wp

(try-load-and-configure-library
 'org2blog
 
 (setq org2blog/wp-blog-alist
	   '(("temporal.pr0.pl"
		  :url "http://temporal.pr0.pl/devblog/xmlrpc.php"
		  :username "admin"
		  :default-title "Greetings from EMACS and Org Mode!"
		  :default-categories ("org2blog" "emacs")
		  :tags-as-categories nil)))
 )