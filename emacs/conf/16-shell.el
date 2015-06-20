

(defvar auto-sh-set-shell-alist
  '(("\\(?:[.]?bashrc\\|[.]bash_profile\\)\\>" . "bash")
    ("\\(?:\\(?:csh\\)?[.]\\(?:cshrc\\|log\\(?:in\\|out\\)\\)\\|[.]tcshrc\\)\\>" . "csh")
    ("\\(?:[.]zsh\\|[.]?z\\(?:profile\\|log\\(?:in\\|out\\)\\|sh\\(?:env\\|rc\\)\\)\\)\\>" . "zsh")))

(defun my/sh-mode ()
    "my sh-mode"
    (progn
      (auto-complete-mode 1)
      (flycheck-select-checker 'sh-zsh)))

(use-package sh-script
  :if (require 'flycheck nil t)
  :config
  (add-hook 'sh-mode-hook 'flycheck-mode)
  (add-hook 'sh-mode-hook 'my/sh-mode))
