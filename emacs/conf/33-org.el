

(require 'org)
(setq org-directory "~/.emacs.d/share/org")
(setq org-capture-templates
      '(("m" "Memo" entry (file+headline "memo.org" "Memo")
         "** %U%?\n%i\n")
        ("e" "Movie" entry (file+headline "eiga.org" "Movie")
         "** %U%?\n%i\n")
        )
      )

(global-set-key (kbd "C-c C-z") 'org-capture)

(global-set-key
 (kbd "<f6>")
 (lambda () (interactive) (find-file "~/.emacs.d/share/org/daily-projects.org")))

