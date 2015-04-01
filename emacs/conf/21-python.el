
(defun my/python-mode-hook ()
  (setq python-indent 4)
  (setq python-indent-list-length 4)             
  (setq python-continuation-offset 4)
  (setq indent-tabs-mode nil)
  (elpy-enable)
  (elpy-use-ipython)
  (key-combo-define-local (kbd ":") '(":" ": "))
  (key-combo-define-local (kbd ",") '(", " ","))
  (key-combo-define-local (kbd "=") '(" = " "=" " == "))
  (key-combo-define-local (kbd "<") '(" < " "<"))
  (key-combo-define-local (kbd ">") '(" > " ">"))
  )

(use-package elpy
  :if (require 'python nil t)
  :config
  (add-hook 'python-mode-hook 'my/python-mode-hook))
