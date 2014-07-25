;;;; Erlang Solutions context.
;;;; Cause the guys hate space-tab mixing.

;;; FIXME write some automated factility for saving and restoring configuration data
(defvar trc-esl-initial-indent-tabs-mode nil)
(defvar trc-esl-use-viper-mode (not (null (locate-library "viper"))))

(defun trc-context-esl-init ()
  ;; alter indentation settings
  (setq trc-esl-initial-indent-tabs-mode (default-value 'indent-tabs-mode))
  (setq-default indent-tabs-mode nil)

  ;; Viper Mode
  (when trc-esl-use-viper-mode
	(setq viper-mode t)
	(require 'viper))

  (message "ESL context initialized!"))

(defun trc-context-esl-deinit ()
  ;; Viper Mode
  (when trc-esl-use-viper-mode
	(setq viper-mode nil) ;; NOTE maybe we should use default value instead
	(viper-go-away))

  ;; restore original setting
  (setq-default indent-tabs-mode trc-esl-initial-indent-tabs-mode)
  (message "ESL context deinitialized!"))

(trc-context-register :name "esl" :lighter "ESL" :init-function 'trc-context-esl-init :deinit-function 'trc-context-esl-deinit)
