;;;; TRC Context
;;;; Just in case I need that one.

(defun trc-context-trc-init ()
  (message "TRC context initialized!")) ; TODO TRC initialization;

(defun trc-context-trc-deinit ()
  (message "TRC context deinitialized!")) ; TODO TRC deinitialization;

(trc-context-register :name "trc" :lighter "=/\\=" :init-function 'trc-context-trc-init :deinit-function 'trc-context-trc-deinit)
