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
        org-catch-invisible-edits 'error

        org-log-done t

        ;; FIXME these need to be rewritten for OS-independent path (e.g. w/ trc/user-real-homedir function, or sth.).
        ;; NOTE handled by #'my/switch-agenda-working-context in the :config section.
        ;; org-agenda-files '("~/Dropbox/GTD2/"
        ;;                    "~/Dropbox/GTD2/projects/"
        ;;                    "~/Dropbox/GTD2/projects/HSKRK/")

        ;; Let's use work week for durations
        ;; org-duration-units `(("min" . 1)
        ;;                      ("h" . 60)
        ;;                      ("d" . ,(* 60 8))
        ;;                      ("w" . ,(* 60 8 5))
        ;;                      ("m" . ,(* 60 8 5 4))
        ;;                      ("y" . ,(* 60 8 5 4 10)))

        ;; Also, just show clock time just in hours and minutes
        org-duration-format 'h:mm

        org-refile-targets '((nil :maxlevel . 1)
                             (org-agenda-files :maxlevel . 1))

        ;; FIXME drop that?
        org-agenda-prefix-format '((agenda . " %i %-12:c%?-12t% s")
                                   (timeline . "  % s")
                                   (todo . " %l%i %-12:c")
                                   (tags . " %i %-12:c")
                                   (search . " %i %-12:c"))

        org-agenda-span 14
        org-deadline-warning-days 14
        org-todo-keywords (quote ((sequence "TODO(t)" "NEXT(n)" "DOING(o)" "|" "DONE(d)")
                                  (sequence "WAITING_FOR(w@/!)" "DELEGATED(e@/!)" "|" "CANCELLED(c@/!)")
                                  (sequence "ONGOING(O)" "|")))
        ;; TODO faces for org keywords (maybe in look&feel file, or sth?)
        org-todo-keyword-faces '(("ONGOING" . "grey"))


        org-use-fast-todo-selection t
        org-treat-S-cursor-todo-selection-as-state-change nil
        org-agenda-restore-windows-after-quit t

        org-src-fontify-natively t
        org-src-tabs-act-natively t

        org-agenda-custom-commands '(("o" "General task overview" todo ""
                                      ((org-super-agenda-groups
                                        '((:name "Most Important Tasks"
                                                 :tag "MIT")
                                          (:name "Due today"
                                                 :deadline today)
                                          (:name "For today"
                                                 :scheduled today)
                                          (:name "Past their date"
                                                 :deadline past
                                                 :scheduled past)
                                          (:name "Others"
                                                 :auto-category t))))
                                      ("~/Dropbox/GTD2/out/overview.html"
                                       "~/Dropbox/GTD2/out/overview.txt"))
                                     ("n" "Next up (if you don't know what to do)" todo ""
                                      ((org-super-agenda-groups
                                        '((:name "Most Important Tasks"
                                                 :tag "MIT")
                                          (:name "Next actions (important)"
                                                 :and (:todo "NEXT"
                                                             :priority>= "C"))
                                          (:name "Next actions"
                                                 :todo "NEXT")
                                          (:discard (:anything))))))
                                     ("." "For today" agenda ""
                                      ((org-super-agenda-groups
                                        '((:name "Most Important Tasks"
                                                 :tag "MIT")
                                          (:name "Habits"
                                                 :habit t)
                                          (:name "Day plan"
                                                 :time-grid t)
                                          (:name "Important"
                                                 :priority "A"
                                                 :deadline today)
                                          (:name "For today"
                                                 :scheduled today)
                                          (:name "At the office"
                                                 :tag "@work")
                                          (:name "At home"
                                                 :tag "@home"
                                                 :tag "@home-krk"
                                                 :tag "@home-rab")
                                          (:name "At hackerspace"
                                                 :tag "@hskrk")
                                          (:name "Due past"
                                                 :deadline past)
                                          (:name "Scheduled past"
                                                 :scheduled past)))
                                       (org-agenda-span 1))
                                      ("~/Dropbox/GTD2/out/today.html"
                                       "~/Dropbox/GTD2/out/today.txt"))
                                     ("c" "Weekly calendar" agenda ""
                                      ((org-super-agenda-groups
                                        '((:name "Calendar"
                                                 :time-grid t)
                                          (:discard (:anything))))
                                       (org-agenda-span 7)))
                                     ("w" "Weekly calendar and tasks" agenda ""
                                      ((org-super-agenda-groups
                                        '((:name "Calendar"
                                                 :time-grid t)
                                          (:name "Important"
                                                 :priority "A")))
                                       (org-agenda-span 7))
                                      ("~/Dropbox/GTD2/out/weekly-calendar-plus-tasks.html"
                                       "~/Dropbox/GTD2/out/weekly-calendar-plus-tasks.txt")))

        ;; TODO
        ;; - (setq org-tags-exclude-from-inheritance '("project"))
        ;;   + set up an agenda entry for listing all projects
        ;;
        ;; - Add a "TODOs in current file" entry as T (apparently you can override default keys
        ;;   with custom agenda commands).
        ;; - Add a "Questions" entry that is pointed to a file in which I store questions
        ;;   (apparently it's enough to override org-agenda-files).
        ;; - Add a "Shopping" entry that is pointed to a file in which I store shopping tasks.

        ;; TODO maybe steal from Sachachua:
        ;; - my/org-agenda-new
        ;; - my/org-agenda-mark-done-and-add-followup

        ;; TODO build something similar to Sachachua's my/org-show-active-projects
        ;; (also, holy shit my/org-prepare-weekly-review)

        ;; TODO maybe also steal Sacha's jump-to-org-agenda to use on an idle timer,
        ;; but it needs to work with a custom command!

        ;; TODO templates - capture
        org-capture-templates '(("t" "TODO" entry
                                 (file+headline "~/Dropbox/GTD2/inbox.org" "Inbox")
                                 "* TODO %?\n  %i\n  %a")
                                ("j" "Journal" entry
                                 (file+headline "~/Dropbox/GTD2/journal.org" "Quick Notes")
                                 "* %T\n  %i\n  %?")
                                ("w" "Web link" entry
                                 (file+headline "~/Dropbox/GTD2/stuff.org" "RnR Web link")
                                 "* TODO %c\n  %?")
                                ("b" "Bookmark" entry
                                 (file "~/Dropbox/GTD/bookmarks.org")
                                 "* %c\n  %T\n  %?")
                                ("n" "Note" entry
                                 (file+headline "~/Dropbox/GTD2/stuff.org" "Notes")
                                 "* %T\n  %i\n   %?")
                                ("q" "Question" entry
                                 (file+headline "~/Dropbox/GTD2/stuff.org" "Questions")
                                 "* TODO Question: %?")
                                ("u" "Quote" entry
                                 (file "~/Dropbox/GTD2/quotes.org")
                                 "* %c\n  %?")
                                ("l" "Blacklist" entry
                                 (file "~/Dropbox/GTD2/blacklist.org")
                                 "* %c\n   %T\n   %?")))
  (add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))

  (setq org-clock-persist t)
  (org-clock-persistence-insinuate)

  :bind (("C-c a" . org-agenda)
         ("C-c r" . org-remember)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link)
         ("<f9>" . org-agenda)
         ("<f7>" . org-time-stamp-inactive)
         ("C-c j" . org-clock-goto))

  :config
  (add-to-list 'org-modules 'org-habit)
  (org-load-modules-maybe t)
  
  (setq org-habit-graph-column 80)

  (setq my/agenda-working-contexts-alist '((personal . ("~/Dropbox/GTD2/"
                                                        "~/Dropbox/GTD2/projects/"
                                                        "~/Dropbox/GTD2/projects/HSKRK/"))
                                           (work . ("~/Dropbox/endsec/"))))
  
  (defun my/switch-agenda-working-context (context)
    (message "Switching agenda focus to %s." context)
    (setq org-agenda-files (cdr (assoc context my/agenda-working-contexts-alist))))

  ;; FIXME Should not be separate functions, but I cannot into Emacs Lisp.
  (defun my/agenda-personal-mode ()
    (interactive)
    (my/switch-agenda-working-context 'personal))
  (defun my/agenda-work-mode ()
    (interactive)
    (my/switch-agenda-working-context 'work))

  (my/switch-agenda-working-context 'personal)             ;default

  (bind-key "<f6> p" 'my/agenda-personal-mode)
  (bind-key "<f6> w" 'my/agenda-work-mode)

  ;; Some extra keybindings
  (bind-key "i" 'org-agenda-clock-in org-agenda-mode-map)
  (bind-key "o" 'org-agenda-clock-out org-agenda-mode-map)

  ;; Saving clocks to external file for display in StumpWM.
  (defun my/save-clock-if-any ()
    (with-temp-file "~/.org.clock"
      (if (org-clocking-p)
          (insert org-clock-heading)
        (insert "[N/A]"))))

  (add-hook 'org-clock-in-hook 'my/save-clock-if-any)
  (add-hook 'org-clock-out-hook 'my/save-clock-if-any)
  (add-hook 'org-clock-cancel-hook 'my/save-clock-if-any)
  )

;;; XXX not sure if this is the best way; maybe set up in org mode through org-modules instead?

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
  :ensure t
  :disabled t)

(use-package kanban
  :ensure t)

(use-package org-super-agenda
  :ensure t
  :config
  (org-super-agenda-mode))
  
(provide 'init-org-mode)
