(try-load-and-configure-library
 'org-install

 ;; Constants
 ;; Should help for now, but in the future we need to get them out to local configuration somehow.
 (defconst +trc-org-feeds-file+ "C:/Users/TeMPOraL/My Dropbox/GTD/feeds.org")

 ;; Org Babel
 (setq org-ditaa-jar-path "C:/TRC/programy/ditaa0_9/ditaa0_9.jar")

 (org-babel-do-load-languages
  'org-babel-load-languages
  '((ditaa . t)))

 ;; Org Habits
 (setq org-habit-following-days 14)
 (setq org-habit-preceding-days 56)

 ;; Org Agenda fun
 ;; (stolen from http://nakkaya.com/2010/03/19/org-mode-in-your-pocket-setting-up-mobileorg/)
 (setq org-agenda-custom-commands
       '(("w" todo "TODO")
         ("h" agenda "" ((org-agenda-show-all-dates nil)))
         ("W" agenda "" ((org-agenda-ndays 21)
                         (org-agenda-show-all-dates nil)))
         ("A" agenda ""
          ((org-agenda-ndays 1)
           (org-agenda-overriding-header "Today")))))

 ;; Capture
 (setq org-default-notes-file "C:/Users/TeMPOraL/My Dropbox/GTD/capture.org")

 (setq org-capture-templates
	   '(("t" "TODO" entry
		  (file+headline "C:/Users/TeMPOraL/My Dropbox/GTD/stuff.org" "Tasks")
		  "* TODO %?\n  %i\n  %a")
		 ("j" "Journal" entry
		  (file+headline "C:/Users/TeMPOraL/My Dropbox/GTD/journal.org" "Quick Notes")
		  "* %T\n  %i\n  %?")
		 ("w" "Web link" entry
		  (file+headline "C:/Users/TeMPOraL/My Dropbox/GTD/stuff.org" "RnR Web link")
		  "* TODO %c\n  %?")
		 ("b" "Bookmark" entry
		  (file "C:/Users/TeMPOraL/My Dropbox/GTD/bookmarks.org")
		  "* %c\n  %T\n  %?")
		 ("n" "Note" entry
		  (file+headline "C:/Users/TeMPOraL/My Dropbox/GTD/stuff.org" "Notes")
		  "* %T\n  %i\n   %?")
		 ("q" "Question" entry
		  (file+headline "C:/Users/TeMPOraL/My Dropbox/GTD/stuff.org" "Questions")
		  "* TODO Question: %?")
		 ("u" "Quote" entry
		  (file "C:/Users/TeMPOraL/My Dropbox/GTD/quotes.org")
		  "* %c\n  %?")
		 ("l" "Blacklist" entry
		  (file "C:/Users/TeMPOraL/My Dropbox/GTD/blacklist.org")
		  "* %c\n   %T\n   %?")))

 ;; Feeds ^^
 (setq org-feed-alist
	   `(("HN"
		  "http://news.ycombinator.com/rss"
		  ,+trc-org-feeds-file+
		  "Hacker News")
		 ("FTP@Stosowana"
		  "http://temporal.pr0.pl/stosowana.php"
		  ,+trc-org-feeds-file+
		  "FTP @ Stosowana")
		 ("Harry Potter and the Methods of Rationality"
		  "http://demented.no-ip.org/~feep/rss_proxy.cgi?5782108"
		  ,+trc-org-feeds-file+
		  "Harry Potter and the Methods of Rationality")
		 ("Wawszczak Techblog"
		  "http://wawszczak.pr0.pl/feed/"
		  ,+trc-org-feeds-file+
		  "Wawszczak Techblog")
		 ("Adam Sawicki"
		  "http://asawicki.info/news_rss.php5"
		  ,+trc-org-feeds-file+
		  "Adam Sawicki")
		 ("Biblioteczka TeMPOraL'a"
		  "http://page2rss.com/rss/02ff3baa21be15d58d9e4cad87d9a25a"
		  ,+trc-org-feeds-file+
		  "Biblioteczka TeMPOraL'a")))


 ;; Key bindings
 (global-set-key "\C-ca" 'org-agenda)
 (global-set-key "\C-cr" 'org-remember)
 (global-set-key "\C-cc" 'org-capture))