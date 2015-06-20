
(defun my/python-mode-hook ()
  (setq python-indent 4)
  (setq python-indent-list-length 4)             
  (setq python-continuation-offset 4)
  (setq indent-tabs-mode nil)
  (key-combo-define-local (kbd ":") '(":" ": "))
  (key-combo-define-local (kbd ",") '(", " ","))
  (key-combo-define-local (kbd "=") '(" = " "=" " == "))
  (key-combo-define-local (kbd "<") '(" < " "<"))
  (key-combo-define-local (kbd ">") '(" > " ">"))
  )

(use-package elpy
  :if (require 'python nil t)
  :config
  ;; (setenv "PYENV_ROOT" "/Users/mai-om/.anyenv/envs/pyenv")
  (setenv "PATH"
          (concat "/Users/mai-om/.anyenv/envs/pyenv/shims:/Users/mai-om/.anyenv/envs/pyenv/bin:"
                  (getenv "PATH")))
  (setq exec-path (parse-colon-path (getenv "PATH")))
  (add-hook 'python-mode-hook 'my/python-mode-hook)
  (elpy-enable)
  (setq elpy-modules '(elpy-module-sane-defaults
                          elpy-module-company
                          elpy-module-eldoc
                          elpy-module-highlight-indentation
                          elpy-module-pyvenv
                          elpy-module-yasnippet))
  (add-hook 'python-mode-hook 'flycheck-mode)
  (elpy-use-ipython)
)

