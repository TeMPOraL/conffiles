;;; Basics of Emacs operations; look & feel.
;; Appearance
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Text look&feel
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(transient-mark-mode t)
(column-number-mode t)

(show-paren-mode 1)

(setq redisplay-dont-pause t)

;;; Additional line numbering
(line-number-mode t)
(global-linum-mode 1)
(setq linum-format "%d ")

;;; Use Org Mode as the default mode for new buffers & stuff.
(setq default-major-mode 'org-mode)
(setq-default indent-tabs-mode nil)

;;; Skip startup message
(setq inhibit-startup-message t)

;;; default browse-url
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

(require 'cl) ; because we like Common Lisp, and keyword params are nice

;;; Helper macro for other configuration files
;;; TODO (symbol-name ...) could be executed during macro-expansion time, but I get some weird
;;; errors when I try it; find a way to do this right.
(defmacro try-load-and-configure-library (lib &rest configuration)
   `(when (locate-library (symbol-name ,lib))
     (require ,lib)
     ,@configuration))

(defmacro try-load-and-configure-file (file &rest configuration)
  `(when (locate-library ,file)
     (load ,file)
     ,@configuration))

