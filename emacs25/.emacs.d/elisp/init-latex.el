;;;; Stuff related to handling LaTeX documents.

;;; Weird config - see http://www.gnu.org/software/auctex/.
(use-package tex
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t))

(provide 'init-latex)
