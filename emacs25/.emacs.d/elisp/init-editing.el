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

(setq sentence-end-double-space nil)



(use-package scpaste
  :ensure t)

;;; TODO exported HTML needs a proper title tag
;;; TODO default buffer name should be better (in particular, slugified)

(defhydra hydra-scpaste (global-map "<f5>")
  ("p" (let ((scpaste-http-destination "http://paste.temporal.pl")
             (scpaste-scp-destination "temporal.nazwa.pl:/home/temporal/www/pastes"))
         (call-interactively 'scpaste-region))))



;;; Stolen from CCE - http://doc.rix.si/cce/cce.html
;;; Modified to provide a polish language version.
(defun scissors (&optional arg)
  (interactive "P")
  (if (equal arg '(4))
      (progn
        (insert "--8<---------------wytnij tu--------------start------------->8---\n")
        (save-excursion
          (insert "\n--8<---------------wytnij tu--------------koniec------------>8---\n")))
    (progn
      (insert "--8<---------------cut here---------------start------------->8---\n")
      (save-excursion
        (insert "\n--8<---------------cut here---------------end--------------->8---\n")))))

;;; Stolen from CCE - http://doc.rix.si/cce/cce.html
(defun my/set-truncate-lines ()
  "Toggle value of truncate-lines and refresh window display."
  (interactive)
  (setq truncate-lines (not truncate-lines))
  ;; now refresh window display (an idiom from simple.el):
  (save-excursion
    (set-window-start (selected-window)
                      (window-start (selected-window)))))

(global-set-key (kbd "<f8>") 'my/set-truncate-lines)



(provide 'init-editing)

