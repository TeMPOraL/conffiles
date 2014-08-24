(try-load-and-configure-library
 'key-chord
 (key-chord-mode 1)
 (key-chord-define-global "uu" 'undo)
 (key-chord-define-global "hd" 'helm-dash-at-point)
 (key-chord-define-global ",." "<>\C-b"))

