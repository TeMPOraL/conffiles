;;;; Initialize everything for Org Mode.

(use-package org
  :ensure t
  :init
  (setq org-return-follows-link t
        org-hide-leading-stars t
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-pretty-entities-include-sub-superscripts nil
        org-special-ctrl-a/e t

        org-log-done t

        ;; FIXME these need to be rewritten for OS-independent path (e.g. w/ trc/user-real-homedir function, or sth.).
        org-agenda-files '("c:/Users/TeMPOraL/Dropbox/GTD2/"
                           "c:/Users/TeMPOraL/Dropbox/GTD2/projects/"
                           "c:/Users/TeMPOraL/Dropbox/GTD2/projects/HSKRK/")

        org-refile-targets '((nil :maxlevel . 1)
                             (org-agenda-files :maxlevel . 1))

        org-agenda-prefix-format '((agenda . " %i %-12:c%?-12t% s")
                                   (timeline . "  % s")
                                   (todo . " %l%i %-12:c")
                                   (tags . " %i %-12:c")
                                   (search . " %i %-12:c"))

        org-agenda-span 14
        org-todo-keywords (quote ((sequence "TODO(t)" "NEXT(n)" "DOING(o)" "|" "DONE(d)")
                                  (sequence "WAITING_FOR(w@/!)" "DELEGATED(e@/!)" "|" "CANCELLED(c@/!")))
        ;; TODO faces for org keywords (maybe in look&feel file, or sth?)

        org-use-fast-todo-selection t
        org-treat-S-cursor-todo-selection-as-state-change nil
        org-agenda-restore-windows-after-quit t

        org-src-fontify-natively t
        org-src-tabs-act-natively t

        ;; TODO templates

        )

  :bind (("C-c a" . org-agenda)
         ("C-c r" . org-remember)
         ("C-c c" . org-capture)
         ("<f9>" . org-agenda)
         ("<f7>" . org-time-stamp-inactive)))
  

(use-package org-bullets
  :ensure t
  :init (add-hook 'org-mode-hook 'org-bullets-mode)
  ;; TODO configure actual Unicode bullets
  )

(use-package org-sticky-header
  :ensure t
  :init
  (add-hook 'org-mode-hook 'org-sticky-header-mode)
  (setq org-sticky-header-full-path 'full))

(use-package org-beautify-theme
  :ensure t)

(use-package kanban
  :ensure t)
  
(provide 'init-org-mode)
