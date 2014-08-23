(try-load-and-configure-library
 'key-chord
 (key-chord-mode 1)
 (key-chord-define-global "uu" 'undo)
 (key-chord-define-global ",." "<>\C-b"))

