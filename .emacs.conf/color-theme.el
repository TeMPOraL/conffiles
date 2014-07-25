;;;; Configuration for color-theme library.
(try-load-and-configure-library
 'color-theme
 (eval-after-load "color-theme"
   '(progn
	  (color-theme-initialize) ;;<-- FIXME this function is flawed, or at least conflicts with stuff
      (color-theme-hober))))
