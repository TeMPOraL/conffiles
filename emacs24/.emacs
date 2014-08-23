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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(background-color "#002b36")
 '(background-mode dark)
 '(column-number-mode t)
 '(cursor-color "#839496")
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("b3f60d671a49dd4adbe1ed9530041e3b7929852e3ac2ebd2def9a46746edfc6f" "ae0233fcacc0356ac73b12a4ed7a352a709e15d70f74e07d7c6d99e979b23184" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(erc-beep-p t)
 '(erc-interpret-mirc-color t)
 '(erc-modules
   (quote
    (autojoin button completion fill irccontrols list log match menu move-to-prompt netsplit networks noncommands readonly ring stamp track)))
 '(erc-pals (quote ("Alice_M")))
 '(foreground-color "#839496")
 '(jabber-account-list
   (quote
    (("jacek.zlydach@chat.facebook.com"
      (:network-server . "chat.facebook.com")
      (:port . 5222)
      (:connection-type . starttls)))))
 '(jabber-mode-line-mode t)
 '(safe-local-variable-values (quote ((Syntax . Common-Lisp))))
 '(tool-bar-mode nil)
 '(weatherline-location "Kraków,Poland")
 '(weatherline-location-id 3094802)
 '(weatherline-mode t)
 '(weatherline-units "metric"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 68 :width normal))))
 '(weatherline-mode-line-face ((t (:foreground "black"))) t))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
