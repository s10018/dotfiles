
(use-package markdown-mode
  :mode
  (("\\.text\\'" . gfm-mode)
   ("\\.markdown\\'" . markdown-mode)
   ("\\.md\\'" . markdown-mode))
  :config
  (bind-key "C-j" 'eval-print-last-sexp markdown-mode-map))

(defun markdown-preview ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command
     (format "LC_ALL=ja_JP.UTF-8 flavor %s > /tmp/tmp.html && open /tmp/tmp.html"
             (shell-quote-argument (buffer-file-name)))))

