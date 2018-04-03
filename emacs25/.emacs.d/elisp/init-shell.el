;;;; All stuff related to shells & shell integration.

;;; NOTE: good eshell stuff to remember documented here:
;;; - https://github.com/howardabrams/dot-files/blob/master/emacs-eshell.org
;;; - http://www.howardism.org/Technical/Emacs/eshell-fun.html



(setq async-shell-command-buffer 'new-buffer)


;;; Prompt
(setq eshell-prompt-function
      (macrolet ((with-face (str &rest props)
                            `(propertize ,str 'face (list ,@props))))
        (lambda ()
          (let ((retval (eshell-get-variable "?")))
            (concat
             ;; Current date and time.
             (with-face (format-time-string "%Y-%m-%d %H:%M" (current-time)) :foreground "grey")

             " "
             ;; Return value of last command.
             (if (= retval 0)
                 (with-face "0 " :foreground "white")
               (with-face (format "%d " retval) :foreground "red"))

             ;; PWD.
             (with-face (abbreviate-file-name (eshell/pwd)) :foreground "white")

             ;; Different ending character depending on user privileges.
             (if (= (user-uid) 0)
                 (with-face " #" :foreground "red")
               (with-face " $" :foreground "green"))

             ;; Extra margin before user input.
             (with-face " " :foreground "white"))))))

(setq eshell-highlight-prompt nil) ; we'll handle colors ourselves


;;; Run eshell directly under current buffer.

(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-c !") 'eshell-here)


;;; Useful commands for eshell.

(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(defun eshell/x ()
  (insert "exit")
  (eshell-send-input)
  (delete-window))


;;; Run a shell command forever in a buffer.
;;; Stolen from CCE - http://doc.rix.si/cce/cce.html.
;;; Modified for interactive use.
;;; Modified to use Fish shell.
(defun my/async-forever (command buffer-name)
  "Run a command in an async buffer forever"
  (interactive "sCommand: \nBBuffer: ")
  (async-shell-command (concat "while true; " command "; sleep 5; end")
                       (get-buffer-create buffer-name)))

(provide 'init-shell)
