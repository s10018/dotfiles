
(defun my/sh-mode ()
    "my sh-mode"
  (progn
    (flycheck-select-checker 'sh-shellcheck)
    (auto-complete-mode 1)))

(use-package sh-script
  :if (require 'flycheck nil t)
  :config
  (add-hook 'sh-mode-hook 'flycheck-mode)
  (add-hook 'sh-mode-hook 'my/sh-mode))
