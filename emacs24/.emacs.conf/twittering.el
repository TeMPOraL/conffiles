(try-load-and-configure-library
 'twittering-mode
 (setq twittering-timeline-spec-alias
       '(("FRIENDS" . "my-account/friends-list")
         ("related-to" .
          (lambda (username)
            (if username
                (format ":search/to:%s OR from:%s OR @%s/"
                        username username username)
              ":home")))
         ("HSKRK" . "$related-to(hackerspace_krk)"))))
