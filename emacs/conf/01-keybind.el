
(use-package bind-key
  :config
  (bind-keys*
   ("C-c g" . goto-line)
   ("C-t" . other-window-or-split)
   ("C-c f" . fill-paragraph)
   ("C-c o" . helm-occur)
   ("C-c b" . browse-url-at-point)
   ("C-c r" . replace-string)
   ("C-c j" . eval-print-last-sexp)
   ("C-;" . helm-mini)
   ("M-x" . helm-M-x)
   ("C-c c" . term+mux-new)
   ("C-c z n" . open-junk-file)
   ("C-c , g" . open-my-calendar)
   ))

