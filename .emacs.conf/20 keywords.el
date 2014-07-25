;;; color words TODO, FIXME, NOTE, ect.
(defconst trc-comment-keywords "\\<\\(FIXME\\|TODO\\|BUG\\|HACK\\|NOTE\\|WARNING\\|ERROR\\)")

;; UNUSED handy tool
;; from: Trey Jackson, http://stackoverflow.com/questions/2242572/emacs-todo-indicator-at-left-side/2242801#2242801
(defun annotate-todo ()
  "put fringe marker on TODO: lines in the curent buffer"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward trc-comment-keywords nil t)
      (let ((overlay (make-overlay (- (point) 5) (point))))
        (overlay-put overlay 'before-string (propertize "A"
                                                        'display '(left-fringe right-triangle)))))))
;; Install the word coloring
(defun add-comment-keywords ()
  (font-lock-add-keywords nil
			  `((,trc-comment-keywords 1 font-lock-warning-face t))))

(add-hook 'find-file-hooks 'add-comment-keywords t)
(set-face-underline 'font-lock-warning-face "yellow") ; Just make sure we'll see it

(defun grab-current-line ()
  (buffer-substring-no-properties (line-beginning-position) (line-end-position)))

;; TODO make the buffer visible along with current
;; TODO one entry per one line (in case of multiple TODO/FIXME/HACKs)
;; TODO make the buffer killable by q (?not sure if needed)
;; FIXME make this function ignore non-keyword presence of words, like NOTE in notes.
(defun list-comment-notes ()
  "List all TODO/FIXME/HACK, itp. in a new buffer for reference."
    (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((collected-lines '()))
      (while (re-search-forward trc-comment-keywords nil t)
        ;; collect lines
        (setq collected-lines (cons 
                               (format "%d: %s" (line-number-at-pos) (grab-current-line))
                               collected-lines)))

      ;; generate a new buffer
      (let ((notes-buffer (generate-new-buffer (concat (buffer-name) "-comment-notes"))))
        (set-buffer notes-buffer)
        ;; dump collected stuff to here.
        (dolist (a-line collected-lines)
          (insert a-line)
          (insert "\n"))))))
