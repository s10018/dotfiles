

(use-package key-combo
  :config
  (key-combo-mode 1)
  ;; (add-to-list 'key-combo-common-mode-hooks 'python-mode-hook)
  (key-combo-load-default)
  ;; (key-combo-define-hook 
  ;;  'python-mode-hook
  ;;  'key-combo-property-default
  ;;  '((":"  . (":" ": "))
  ;;    ("," . (", " ","))
  ;;    ("=" . (" = " "=" " == "))
  ;;    ("<" . (" < " "<"))
  ;;    (">" . (" > " "<"))
  ;;    )
  ;;  )
  ;; (key-combo-define-hook 'c++-mode-hook
  ;;                        'key-combo-property-default
  ;;                        '((":"  . ("::" ":"))))
  )


;; (defun smartchr-keybindings-basic ()
;;   (local-set-key (kbd ",")  (smartchr '(", " ",")))
;;   (local-set-key (kbd "=")  (smartchr '(" = " " == " "=")))
;;   (local-set-key (kbd "+")  (smartchr '(" + " " += " "+")))
;;   (local-set-key (kbd "-")  (smartchr '(" - " " -= " "-")))
;;   (local-set-key (kbd ">")  (smartchr '(" > " " => " " >= " ">")))
;;   (local-set-key (kbd "%")  (smartchr '(" % " " %= " "%")))
;;   (local-set-key (kbd "!")  (smartchr '(" != " " !~ " "!")))
;;   (local-set-key (kbd "&")  (smartchr '(" & " " && " "&")))
;;   (local-set-key (kbd "*")  (smartchr '(" * " "**" "*")))
;;   (local-set-key (kbd "<")  (smartchr '(" < " " << " " <= " "<"))))

;; (defun smartchr-keybindings-ruby ()
;;   (local-set-key (kbd ",")  (smartchr '(", " ",")))
;;   (local-set-key (kbd "=")  (smartchr '(" = " " == " " === " "=")))
;;   (local-set-key (kbd "~")  (smartchr '(" =~ " "~")))
;;   (local-set-key (kbd "+")  (smartchr '(" + " " += " "+")))
;;   (local-set-key (kbd "-")  (smartchr '(" - " " -= " "-")))
;;   (local-set-key (kbd ">")  (smartchr '(">" " > " " => " " >= ")))
;;   (local-set-key (kbd "%")  (smartchr '(" % " " %= " "%")))
;;   (local-set-key (kbd "!")  (smartchr '(" != " " !~ " "!")))
;;   (local-set-key (kbd "&")  (smartchr '(" & " " && " "&")))
;;   (local-set-key (kbd "*")  (smartchr '(" * " "**" "*")))
;;   (local-set-key (kbd "<")  (smartchr '(" < " " << " " <= " "<")))
;;   (local-set-key (kbd "|")  (smartchr '("|`!!'|" " ||= " " || " "|")))
;;   (local-set-key (kbd "/")  (smartchr '("/" "/`!!'/" " / " "// ")))
;;   (local-set-key (kbd "#")  (smartchr '("#{`!!'}" "#")))
;;   (local-set-key (kbd "(")  (smartchr '("(`!!')" "(")))
;;   (local-set-key (kbd "[")  (smartchr '("[`!!']" "[")))
;;   (local-set-key (kbd "{")  (smartchr '("{`!!'}" "{|`!!'|  }" "{")))
;;   (local-set-key (kbd "'")  (smartchr '("'`!!''" "'")))
;;   (local-set-key (kbd "\"") (smartchr '("\"`!!'\"" "\""))))

;; (defun smartchr-keybindings-python ()
;;   (local-set-key (kbd ",")  (smartchr '(", " ",")))
;;   (local-set-key (kbd "=")  (smartchr '(" = " " == " "=")))
;;   (local-set-key (kbd "~")  (smartchr '(" =~ " "~")))
;;   (local-set-key (kbd "+")  (smartchr '(" + "  "+" " += ")))
;;   (local-set-key (kbd "-")  (smartchr '(" - "  "-" " -= ")))
;;   (local-set-key (kbd ">")  (smartchr '(">" " > " " => " " >= ")))
;;   (local-set-key (kbd "%")  (smartchr '(" % " " %= " "%")))
;;   (local-set-key (kbd "!")  (smartchr '(" != " " !~ " "!")))
;;   (local-set-key (kbd "&")  (smartchr '(" & " " && " "&")))
;;   (local-set-key (kbd "*")  (smartchr '(" * " "**" "*")))
;;   (local-set-key (kbd "<")  (smartchr '(" < " " << " " <= " "<")))
;;   (local-set-key (kbd "|")  (smartchr '("|`!!'|" " ||= " " || " "|")))
;;   (local-set-key (kbd "/")  (smartchr '("/" "/`!!'/" " / " "// ")))
;;   (local-set-key (kbd "#")  (smartchr '("# " "#")))
;;   (local-set-key (kbd "(")  (smartchr '("(`!!')" "(")))
;;   (local-set-key (kbd "[")  (smartchr '("[`!!']" "[")))
;;   (local-set-key (kbd "{")  (smartchr '("{`!!'}" "{|`!!'|  }" "{")))
;;   (local-set-key (kbd "'")  (smartchr '("'`!!''" "'''" "'")))
;;   (local-set-key (kbd "\"") (smartchr '("\"`!!'\"" "\""))))

;; (add-hook 'python-mode-hook 'smartchr-keybindings-basic)
;; (add-hook 'python-mode-hook 'smartchr-keybindings-python)
;; (add-hook 'ruby-mode-hook 'smartchr-keybindings-basic)
;; (add-hook 'ruby-mode-hook 'smartchr-keybindings-ruby)

;; (key-combo-load-default-1 (current-global-map)
;;                           key-combo-global-default)
;; (key-combo-define-hook key-combo-common-mode-hooks
;;                        'key-combo-common-load-default
;;                        key-combo-common-default)
;; (key-combo-define-hook key-combo-lisp-mode-hooks
;;                        'key-combo-lisp-load-default
;;                        key-combo-lisp-default)
;; (key-combo-define-hook '(c-mode-hook c++-mode-hook)
;;                        'key-combo-pointer-load-default
;;                        key-combo-pointer-default)
;; (key-combo-define-hook '(cperl-mode-hook perl-mode-hook)
;;                        'key-combo-pointer-load-default
;;                        key-combo-perl-default)
;; (key-combo-define-hook 'objc-mode-hook
;;                        'key-combo-objc-load-default
;;                        (append key-combo-pointer-default
;;                                '(("@"  . "@\"`!!'\""))))
;; (key-combo-define-hook 'org-mode-hook
;;                        'key-combo-org-load-default
;;                        key-combo-org-default)
;; (key-combo-define-hook '(html-mode-hook
;;                          css-mode-hook
;;                          javascript-mode-hook
;;                          js-mode-hook
;;                          makefile-mode-hook
;;                          js2-mode-hook)
;;                        'key-combo-property-default
;;                        '((":"  . ": ")))
