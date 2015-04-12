
(defun my-cperl-mode-hook ()
  (interactive)
  (require 'perl-completion nil t)
  (require 'auto-complete nil t)
  (add-to-list 'ac-sources 'ac-source-my-perl-completion))

(use-package cperl-mode
  :init
  :config
  (bind-keys :map cperl-mode-map
             ("C-c ;" . cperl-comment-region))
  (defalias 'perl-mode 'cperl-mode)
  (setq cperl-electric-keywords nil
        cperl-hairy nil
        cperl-electric-parens nil
        cperl-indent-level 2
        cperl-close-paren-offset -2
        cperl-continued-statement-offset 2
        cperl-indent-parens-as-block t
	cperl-tab-always-indent nil
	cperl-highlight-variables-indiscriminately nil))

(use-package flycheck
  :config
  (add-hook 'cperl-mode-hook 'flycheck-mode))
