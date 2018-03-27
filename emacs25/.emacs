;;; My new init file.
;;; A lot of ideas stolen from https://github.com/howardabrams/dot-files/.

;;; Locations.
(defconst trc/emacs-directory (concat (getenv "HOME") "/.emacs.d/"))
(defun trc/emacs-subdirectory (subdir) (expand-file-name subdir trc/emacs-directory))

;;; Directory structure bootstrap (on first run).
(let* ((subdirs '("elisp" "backups" "autosave"))
       (fulldirs (mapcar (lambda (d) (trc/emacs-subdirectory d)) subdirs)))
  (dolist (dir fulldirs)
    (when (not (file-exists-p dir))
      (message "Creating directory: %s" dir)
      (make-directory dir))))

;;; Custom customizations file, to avoid clutter.
(setq custom-file (expand-file-name "custom.el" trc/emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;; For parts of the configuration splitted out into other files, and for code not available in package manager.
(add-to-list 'load-path (trc/emacs-subdirectory "elisp"))

;;; Backup and autosave directories.
(setq backup-directory-alist `(("." . ,(expand-file-name (trc/emacs-subdirectory "backups")))))
(setq tramp-backup-directory-alist backup-directory-alist)

(add-to-list 'auto-save-file-name-transforms `(".*" ,(expand-file-name (trc/emacs-subdirectory "autosave")) t))


;;; Personalization
(setq user-full-name "Jacek \"TeMPOraL\" Złydach"
      user-mail-address "temporal.pl@gmail.com")


;;; Emacs performance
(setq gc-cons-threshold 5000000)


;;; use-package bootstrap code
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))



;;; General behaviour
(require 'init-look-and-feel)
(require 'init-editing)
(require 'init-generic-modes)

;;; Programming
(require 'init-shell)
(require 'init-programming)
(require 'init-markup-modes)
(require 'init-webdev)
(require 'init-lisp)
(require 'init-rust)

;;; Org mode
(require 'init-org-mode)

;;; Random stuff
(require 'init-games)


;;; Finally, start up Emacs Daemon.
(server-start)


(provide 'init-main)

