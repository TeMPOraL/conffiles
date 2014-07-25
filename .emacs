;;;; Main .emacs file.
;;;; This is only a bootstrap configuration that just sets up some directories and route to proper config files.
(defconst trc-local-config (expand-file-name "~/.emacs.local") "Location-specific configuration (like where to read music from, whatever).")
(defconst trc-local-preconfig (expand-file-name "~/.emacs.preconfig" "Locations-specific configuration that should be read before all other configs."))
(defconst trc-config-dir "~/.emacs.conf/" "Directory with EMACS configuration files.")
(defconst trc-site-dirs '("~/emacs-stuff/" "~/emacs_stuff/") "Directory with additional libraries and modules.")


;;; Load local preconfig if it exists.
(load trc-local-preconfig t)

;;; Set up load path to all stuff in emacs-stuff (possibly platform / hostname-dependent)
(mapc (lambda (path)
	(add-to-list 'load-path path)
	(when (file-exists-p path)
	  (cd path)
	  (normal-top-level-add-subdirs-to-load-path)))
      trc-site-dirs)

;;; Pass action to the .emacs.d directory
(mapc 'load (directory-files trc-config-dir t "^.*.el$"))

;;; Load local config if it exists.
(load trc-local-config t)

;;; TODO display some nice banner ;)
