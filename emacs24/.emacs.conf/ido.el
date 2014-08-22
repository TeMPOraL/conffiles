(try-load-and-configure-library
 'ido
 (ido-mode 1)

 (try-load-and-configure-library
  'flx-ido
  (flx-ido-mode 1)

  (setq ido-use-faces nil))

 (try-load-and-configure-library
  'ido-ubiquitous
  (ido-ubiquitous-mode 1))

 (try-load-and-configure-library
  'ido-vertical-mode
  (ido-vertical-mode)))
