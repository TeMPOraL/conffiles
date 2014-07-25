;;;; Context switching framework
;;;; Contexts are a way of grouping settings specific for particular project, working environment, ect.
;;;; These contexts should be mutually exclusive, but they also should be able to restore changes in
;;;; Emacs configuration when they are changed.
;;;;
;;;; Some features to be done:
;;;; TODO Context list
;;;; TODO Context list in interactive command (if possible)
;;;; TODO Context toggling (switching to next context)

(define-minor-mode trc-context-mode
  "A tool to switch between working contexts."
  :lighter trc-context-mode-text
  :group 'trc-context-mode
  :global t
  (if trc-context-mode
      (progn                           ; initialize context
	(setq trc-context-current nil)
	(trc-context-update-status-text))
    (trc-context-deactivate-current))) ; deinitialize context mode

(defcustom trc-context-mode-text-format " {CTX:%s}" "A format string that tells us which context is active by default.")

(defvar trc-context-mode-text (format trc-context-mode-text-format "nil") "Text displayed in mode bar.")
(defvar trc-context-list nil "List of all registered contexts.")
(defvar trc-context-current nil "Currently active context.")

;;; FIXME the whole idea of using cadr's, ect. is IMO bad practice;
;;; replace it with property lists, if EMACS support them.
(defun* trc-context-register (&key name lighter init-function deinit-function)
  "Register a new context."
;; FIXME append? or adjoin (is there a function like this in elisp?)
  (setq trc-context-list (cons (list name lighter init-function deinit-function)
			       trc-context-list)))

(defun trc-context-update-status-text ()
  "Update mode line with current context."
  (setq trc-context-mode-text (format trc-context-mode-text-format (if (not (null trc-context-current)) (cadr trc-context-current) "nil"))))

(defun trc-context-deactivate-current ()
  "Deactivate currently active context."
  (if (not (null trc-context-current))
      (funcall (cadddr trc-context-current))))

(defun trc-context-activate-current ()
  "Activate context selected as current."
  (if (not (null trc-context-current))
      (funcall (caddr trc-context-current))))

;;; context switching
(defun trc-context-select (name)
  "Select context by name from registered contexts."
  (interactive "sContext to use: ")
  ;; 1) Find our context on list
  (let ((new-context (find-if (lambda (element)
				(string= name (car element)))
			      trc-context-list)))
    (when (not (null new-context))
      ;; 2) If found, deactivate current (if any) and activate new
      (trc-context-deactivate-current)
      (setq trc-context-current new-context)
      (trc-context-activate-current)
      (trc-context-update-status-text)))) ; TODO "error - no such context"?


;; TODO context toggling(?)
