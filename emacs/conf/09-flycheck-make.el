
;; http://d.hatena.ne.jp/sugyan/20100705/1278306885
(defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
  (setq flymake-check-was-interrupted t))
(ad-activate 'flymake-post-syntax-check)

(defvar auto-sh-set-shell-alist '(("\\(?:[.]?bashrc\\|[.]bash_profile\\)\\>" . "bash")
                                  ("\\(?:\\(?:csh\\)?[.]\\(?:cshrc\\|log\\(?:in\\|out\\)\\)\\|[.]tcshrc\\)\\>" . "csh")
                                  ("\\(?:[.]zsh\\|[.]?z\\(?:profile\\|log\\(?:in\\|out\\)\\|sh\\(?:env\\|rc\\)\\)\\)\\>" . "zsh")))
(use-package sh-script
  :commands sh-mode
  :mode (("\\(?:[.]zsh\\|[.]?z\\(?:profile\\|log\\(?:in\\|out\\)\\|sh\\(?:env\\|rc\\)\\)\\)\\'" . sh-mode))
  :config
  (progn
    (defun sh-set-shell-advice (forig &rest args)
      (let ((shell (pop args)))
        (when (and (not (called-interactively-p 'any))
                   (or (string= "sh" shell) (string= sh-shell-file shell)))
          (setq shell (or (assoc-default buffer-file-name auto-sh-set-shell-alist #'string-match) "sh")))
        (apply forig (cons shell args))))
    (advice-add 'sh-set-shell :around #'sh-set-shell-advice)))

(setq flycheck-disabled-checkers '(sh-shellscript sh-bash sh-zsh))

;; (flycheck-define-checker sh-shellcheck
;;   "A shell script syntax and style checker using Shellcheck.

;; See URL `https://github.com/koalaman/shellcheck/'."
;;   :command ("shellcheck" "-f" "checkstyle"
;;             "-s" (eval (symbol-name sh-shell))
;;             source)
;;   :modes sh-mode
;;   :error-parser flycheck-parse-checkstyle)

;; (flycheck-add-next-checker 'sh-zsh '(warning . sh-shellcheck))

(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
