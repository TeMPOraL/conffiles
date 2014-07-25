;;; Basics of EMACS operations; look & feel.
(global-font-lock-mode t)
(transient-mark-mode t)
(line-number-mode t)
(column-number-mode t)

(setq font-lock-maximum-decoration t)

(tool-bar-mode -1) ;; get rid of that ugly & useless toolbar

;;; Additional line numbering
(global-linum-mode 1)
(setq linum-format "%d ")

;;; Use Org Mode as the default mode for new buffers & stuff.
(setq default-major-mode 'org-mode)

;;; Use tabs for identation where appropiate
;(setq-default tab-width 4
;			  indent-tabs-mode t)

(setq-default indent-tabs-mode nil)

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

;;; Skip startup message
(setq inhibit-startup-message t)
