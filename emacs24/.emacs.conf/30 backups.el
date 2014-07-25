;;; Backups file - make some order in this mess of EMACS backup files
;;; Based on http://snarfed.org/gnu_emacs_backup_files

;;; Store files in a per-user directory structure.
(defconst trc-backups-root-dir "~/.emacs.backup/" "Root of directory structure for backup and autosave files.")
(defconst trc-backup-dir (concat trc-backups-root-dir "backup/") "Backup directory.")
(defconst trc-autosave-dir (concat trc-backups-root-dir "autosave/") "Autosave directory")

;;; Store backup files in proper location
(setq backup-directory-alist (list (cons "." trc-backup-dir)))

;;; Store autosave files in proper location
(make-directory trc-autosave-dir t)

;; FIXME There are sometimes filenames like `static/js/.#trc-table.js', ie. not `#file#', but `.#file'.
;; These should also be stored elsewhere.
(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat trc-autosave-dir
	  (if buffer-file-name
	      (concat "#" (file-name-nondirectory buffer-file-name) "#")
	    (expand-file-name
	     (concat "#%" (buffer-name) "#")))))
