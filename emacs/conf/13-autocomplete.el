
(use-package auto-complete-config
  :if (require 'cl)
  :init
  :config
  (bind-keys :map ac-completing-map
             ("C-g" . ac-stop))
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/share/ac-dict")
  (setq ac-comphist-file "~/.emacs.d/cached/ac-comphist.dat"
        ac-ignore-case nil)
  (ac-config-default)
  (delq 'ac-source-yasnippet ac-sources)
  (global-auto-complete-mode t)
  ;; http://d.hatena.ne.jp/IMAKADO/20090813/1250130343
  (defadvice ac-candidate-words-in-buffer (after remove-word-contain-japanese activate)
    (let ((contain-japanese (lambda (s) (string-match (rx (category japanese)) s))))
      (setq ad-return-value
            (remove-if contain-japanese ad-return-value)))))

