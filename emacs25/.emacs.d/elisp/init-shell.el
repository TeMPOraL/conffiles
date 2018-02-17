;;;; All stuff related to shells & shell integration.

;;; eshell
(setq eshell-prompt-function
      (macrolet ((with-face (str &rest props)
                            `(propertize ,str 'face (list ,@props))))
        (lambda ()
          (concat
           (with-face (format-time-string "%Y-%m-%d %H:%M" (current-time)) :foreground "grey")
           " "
           (with-face (abbreviate-file-name (eshell/pwd)) :foreground "white")
           (if (= (user-uid) 0)
               (with-face " #" :foreground "red")
             (with-face " $" :foreground "green"))
           (with-face " " :foreground "white")))))

(setq eshell-highlight-prompt nil) ; we'll handle colors ourselves

(provide 'init-shell)
