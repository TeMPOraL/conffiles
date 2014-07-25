(try-load-and-configure-library
 'webjump
;;; Settings for webjump command, an Emacs builtin.
;;; TODO append some more stuff
 (setq webjump-sites (cons '("Wolfram Alpha" .
							 [simple-query "http://www.wolframalpha.com" "http://www.wolframalpha.com/input/?i=" ""])
						   webjump-sites))
 (setq webjump-sites (cons '("SkOs AGH" . 
							 [simple-query "http://regent.uci.agh.edu.pl/skos/" "http://regent.uci.agh.edu.pl/skos/skos_search.php?nazwisko=" ""])
						   webjump-sites)))