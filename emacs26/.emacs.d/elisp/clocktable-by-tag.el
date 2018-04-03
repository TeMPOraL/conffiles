;;; Via https://gist.github.com/tsu-nera/d9ffa6a51a6e7bdb957b (and https://gist.github.com/ffevotte/5899058).

(require 'org-table)
(require 'org-clock)

(defun clocktable-by-tag/shift-cell (n)
  (let ((str ""))
    (dotimes (i n)
      (setq str (concat str "| ")))
    str))

(defun clocktable-by-tag/insert-tag (params)
  (let ((tag (plist-get params :tags)))
    (insert "|--\n")
    (insert (format "| %s | *Tag time* |\n" tag))
    (let ((total 0))
;;      (mapcar
      (mapc
       (lambda (file)
	 (let ((clock-data (with-current-buffer (find-file-noselect file)
			     (org-clock-get-table-data (buffer-name) params))))
	   (when (> (nth 1 clock-data) 0)
	     (setq total (+ total (nth 1 clock-data)))
	     (insert (format "| | File *%s* | %.2f |\n"
			     (file-name-nondirectory file)
			     (/ (nth 1 clock-data) 60.0)))
	     (dolist (entry (nth 2 clock-data))
	       (insert (format "| | . %s%s | %s %.2f |\n"
			       (org-clocktable-indent-string (nth 0 entry))
			       (nth 1 entry)
			       (clocktable-by-tag/shift-cell (nth 0 entry))
			       (/ (nth 3 entry) 60.0)))))))
       (org-agenda-files))
      (save-excursion
	(re-search-backward "*Tag time*")
	(org-table-next-field)
	(org-table-blank-field)
	(insert (format "*%.2f*" (/ total 60.0)))))
    (org-table-align)))

(defun org-dblock-write:clocktable-by-tag (params)
  (insert "| Tag | Headline | Time (h) |\n")
  (insert "|     |          | <r>  |\n")
  (let ((tags (plist-get params :tags)))
    (mapcar (lambda (tag)
	      (setq params (plist-put params :tags tag))
	      (clocktable-by-tag/insert-tag params))
	    tags)))

(provide 'clocktable-by-tag)
