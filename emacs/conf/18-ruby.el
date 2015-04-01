;; ruby-mode

(defun my/ruby-mode-hook ()
  (abbrev-mode 1)
  (electric-pair-mode t)
  (electric-indent-mode t)
  (electric-layout-mode t)
  (setq enh-ruby-deep-indent-paren nil)
  (setq 
   enh-ruby-comment-column 32
   enh-ruby-bounce-deep-indent t
   enh-ruby-deep-indent-paren t
   enh-ruby-hanging-brace-deep-indent-level 1
   enh-ruby-hanging-brace-indent-level 2
   enh-ruby-hanging-indent-level 2
   enh-ruby-hanging-paren-deep-indent-level 0
   enh-ruby-hanging-paren-indent-level 2
   enh-ruby-indent-level 2
   )
  (helm-gtags-mode))

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'yard-mode)

(when (require 'ruby-mode nil t)
	(require 'inf-ruby nil t)
  (when (require 'ruby-end nil t)
    (add-hook 'ruby-mode-hook 'my/ruby-mode-hook)))
(setq ruby-deep-indent-paren-style nil)

(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))
