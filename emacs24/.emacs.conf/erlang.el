;;; Default UNIX installation of Erlang should provide Erlang mode. Otherwise,
;;; a local preconfig should specify local-erlang-root-dir,
;;; local-erlang-exec-dir and local-erlang-mode-dir

;;; TODO

(try-load-and-configure-library 'erlang-start nil)