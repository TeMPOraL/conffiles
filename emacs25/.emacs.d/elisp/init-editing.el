;;;; Stuff specific to file editing, but otherwise general across modes.
;;;; Maybe not the best split, but whatevs.

;;; Identation
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default tab-always-indent 'complete)

;;; UTF-8 everywhere!
;;; Stolen from https://stackoverflow.com/a/2903256/.
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; (set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
;; (unless (eq system-type 'windows-nt)
;;  (set-selection-coding-system 'utf-8))

(provide 'init-editing)
