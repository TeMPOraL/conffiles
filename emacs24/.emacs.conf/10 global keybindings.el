;; Whitespace mode
(global-set-key (kbd "<f12>") 'whitespace-mode)

(global-set-key (kbd "\C-x\C-E") 'eval-region)

;; Avoid quitting Emacs by accident.
(global-unset-key (kbd "\C-x\C-c"))

(global-set-key (kbd "M-j") (lambda ()
                              (interactive)
                              (join-line -1)))
