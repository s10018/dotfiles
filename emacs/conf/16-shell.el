

(defvar auto-sh-set-shell-alist
  '(("\\(?:[.]?bashrc\\|[.]bash_profile\\)\\>" . "bash")
    ("\\(?:\\(?:csh\\)?[.]\\(?:cshrc\\|log\\(?:in\\|out\\)\\)\\|[.]tcshrc\\)\\>" . "csh")
    ("\\(?:[.]zsh\\|[.]?z\\(?:profile\\|log\\(?:in\\|out\\)\\|sh\\(?:env\\|rc\\)\\)\\)\\>" . "zsh")))

(defun my/sh-mode ()
    "my sh-mode"
    (progn
      (auto-complete-mode 1)))

(defun my/sh-flycheck-mode ()
    "my sh-mode"
    (progn
      (add-hook 'sh-mode-hook 'flycheck-mode)
      (defun sh-set-shell-advice (forig &rest args)
        (let ((shell (pop args)))
          (when (and (not (called-interactively-p 'any))
                     (or (string= "sh" shell) (string= sh-shell-file shell)))
            (setq shell (or (assoc-default buffer-file-name auto-sh-set-shell-alist #'string-match) "sh")))
          (apply forig (cons shell args))))
      (advice-add 'sh-set-shell :around #'sh-set-shell-advice)))



(use-package sh-script
  :if (require 'flycheck nil t)
  :mode (("\\(?:[.]zsh\\|[.]?z\\(?:profile\\|log\\(?:in\\|out\\)\\|sh\\(?:env\\|rc\\)\\)\\)\\'" . sh-mode))
  :config
  (add-hook 'sh-mode-hook 'flycheck-mode)
  (add-hook 'sh-mode-hook 'my/sh-mode)
  (add-hook 'sh-mode-hook 'my/sh-flycheck-mode)
  )
