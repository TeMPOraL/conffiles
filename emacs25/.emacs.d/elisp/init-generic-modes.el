;;; Editing experience improving modes
(use-package which-key
  :ensure t
  :defer 10
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.5)
  (which-key-setup-side-window-right-bottom)
  (which-key-mode 1))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ;; TODO there are more useful functions - like mark-next/previous/all-symbol and mark--in-defun
         ))
;;; TODO consider adding phi-search, phi-replace, phi-search-mc (?) - https://github.com/zk-phi/phi-search
;;; TODO consider adding mc-extras https://github.com/knu/mc-extras.el

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))


;;; IDO
(use-package ido
  :ensure t
  :init (setq ido-enable-flex-matching t
              ;; ido-ignore-extensions t
              ;; ido-use-virtual-buffers t
              ido-everywhere t)
  :config
  (ido-mode 1)
  (ido-everywhere 1))

(use-package flx-ido
  :ensure t
  :init (setq ido-enable-flex-matching t
              ido-use-faces nil)
  :config
  (flx-ido-mode 1))

(use-package ido-vertical-mode
  :ensure t
  :init (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)
  :config
  (ido-vertical-mode 1))

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode 1))


;;; Utility modes
(use-package whitespace
  :bind ("<f12>" . whitespace-mode)
  :diminish whitespace-mode)

(use-package nlinum
  :ensure t
  :config
  (defun trc/nlinum-mode-hook ()
    (when nlinum-mode
      (setq-local nlinum-format
                  (concat "%" (number-to-string (ceiling (log (max 1 (/ (buffer-size) 80)) 10)))
                          "d"))))
  (add-hook 'nlinum-mode-hook #'trc/nlinum-mode-hook)
  (global-nlinum-mode 1))

(use-package nlinum-hl
  :ensure t
  :config
  (add-hook 'focus-in-hook #'nlinum-hl-flush-all-windows)
  (add-hook 'focus-out-hook #'nlinum-hl-flush-all-windows))

(use-package htmlize
  :ensure t)

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))

(provide 'init-generic-modes)
