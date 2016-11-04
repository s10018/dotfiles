
(defun my/c++-mode-hook ()
  (setq indent-tabs-mode nil)
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)
  (add-hook 'c++-mode-hook 'flycheck-mode)
  (add-hook 'c-mode-common-hook 'flycheck-mode)
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (semantic-mode 1)
  (add-to-list 'ac-sources 'ac-source-semantic)
  (key-combo-define-local (kbd ":") '("::" ":"))
  (setq flycheck-clang-include-path
        (mapcar 'expand-file-name (split-string (getenv "C_INCLUDE_PATH") ":")))
  (setq c-basic-offset 4)
  )

(add-hook 'c++-mode-hook 'my/c++-mode-hook)
