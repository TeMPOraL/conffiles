;;;; All stuff related to Rust programming.

(use-package rust-mode
  :ensure t
  ;; TODO stuff?
  )

(use-package cargo
  :ensure t
  :init
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(provide 'init-rust)
