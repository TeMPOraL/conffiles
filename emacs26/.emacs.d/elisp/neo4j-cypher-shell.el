;;;; neo4j comint-based cypher-shell handler
;;;; Based on: https://www.masteringemacs.org/article/comint-writing-command-interpreter

;; (defconst cypher-shell-keywords
;;   '("assume" "connect" "consistencylevel" "count" "create column family"
;;     "create keyspace" "del" "decr" "describe cluster" "describe"
;;     "drop column family" "drop keyspace" "drop index" "get" "incr" "list"
;;     "set" "show api version" "show cluster name" "show keyspaces"
;;     "show schema" "truncate" "update column family" "update keyspace" "use"))

;; (defvar cypher-shell-font-lock-keywords
;;   (list
;;    ;; highlight all the reserved commands.
;;    `(,(concat "\\_<" (regexp-opt cassandra-keywords) "\\_>") . font-lock-keyword-face))
;;   "Additional expressions to highlight in `cypher-shell-mode'.")


(defvar cypher-shell-cli-file-path "/home/temporal/Downloads/neo4j-enterprise-3.1.3t/bin/cypher-shell"
  "Path to the program used by `run-cypher-shell'")

(defvar cypher-shell-cli-arguments '()
  "Commandline arguments to pass to `cypher-shell-cli'")

(defvar cypher-shell-mode-map
  (let ((map (nconc (make-sparse-keymap) comint-mode-map)))
    ;; example definition
    (define-key map "\t" 'completion-at-point)
    map)
  "Basic mode map for `run-cypher-shell'")

(defvar cypher-shell-prompt-regexp "\\(?:neo4j>\\)"
  "Prompt for `run-cypher-shell'.")

(defun run-cypher-shell ()
  "Run an inferior instance of `cypher-shell-cli' inside Emacs."
  (interactive)
  (let* ((cypher-shell-program cypher-shell-cli-file-path)
         (buffer (comint-check-proc "Cypher Shell")))
    ;; pop to the "*Cassandra*" buffer if the process is dead, the
    ;; buffer is missing or it's got the wrong mode.
    (pop-to-buffer-same-window
     (if (or buffer (not (derived-mode-p 'cypher-shell-mode))
             (comint-check-proc (current-buffer)))
         (get-buffer-create (or buffer "*Cypher Shell*"))
       (current-buffer)))
    ;; create the comint process if there is no buffer.
    (unless buffer
      (apply 'make-comint-in-buffer "Cypher Shell" buffer
             cypher-shell-program cypher-shell-cli-arguments)
      (cypher-shell-mode))))

(defun cypher-shell--initialize ()
  "Helper function to initialize Cypher Shell"
  (setq comint-process-echoes t)
  (setq comint-use-prompt-regexp t))

(define-derived-mode cypher-shell-mode comint-mode "Cypher Shell"
  "Major mode for `run-cypher-shell'.

\\<cypher-shell-mode-map>"
  nil "Cypher Shell"
  ;; this sets up the prompt so it matches things like: [foo@bar]
  (setq comint-prompt-regexp cypher-shell-prompt-regexp)
  ;; this makes it read only; a contentious subject as some prefer the
  ;; buffer to be overwritable.
  (setq comint-prompt-read-only t)
  ;; this makes it so commands like M-{ and M-} work.
  (set (make-local-variable 'paragraph-separate) "\\'")
  ;;(set (make-local-variable 'font-lock-defaults) '(cypher-shell-font-lock-keywords t))
  (set (make-local-variable 'paragraph-start) cypher-shell-prompt-regexp))

;; this has to be done in a hook. grumble grumble.
(add-hook 'cypher-shell-mode-hook 'cypher-shell--initialize)

(provide 'neo4j-cypher-shell)
