(try-load-and-configure-file
 "minimap.el"
 
 ;; Add minimap toggling
 (defun minimap-toggle ()
   "Show minimap if hidden, hide if present."
   (interactive)
   (if (and minimap-bufname
	    (get-buffer minimap-bufname)
	    (get-buffer-window (get-buffer minimap-bufname)))
       (minimap-kill)
     (minimap-create)))

 ;; Bind it to F11
 (global-set-key (kbd "<f11>") 'minimap-toggle)

 ;; Make it a little bit smaller
 (setq minimap-width-fraction 0.15))
