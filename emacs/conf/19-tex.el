;; auctex-mode

(defun my/latex-mode-hook ()
  (require 'auto-complete-auctex)

  ;; http://tex.stackexchange.com/questions/119253/cleveref-auctex-and-reftex-set-up
  (add-to-list
   'reftex-ref-style-alist
   '("Cleveref" "cleveref"
     (("\\cref" ?c) ("\\Cref" ?C) ("\\cpageref" ?d) ("\\Cpageref" ?D))))

  (add-to-list 'reftex-ref-style-default-list "Cleveref")

  (TeX-add-symbols
   '("cref" TeX-arg-ref)
   '("Cref" TeX-arg-ref)
   '("cpageref" TeX-arg-ref)
   '("Cpageref" TeX-arg-ref))

  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-source-correlate-start-server t)
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (setq TeX-default-mode 'japanese-latex-mode)
  (setq japanese-LaTeX-default-style "jsarticle")
  (setq japanese-LaTeX-command-default "pLaTeX")
  (setq LaTeX-top-caption-list (list "table"))
  (setq TeX-engine-alist '((ptex "pTeX" "eptex" "platex" "eptex")
                           (uptex "upTeX" "euptex" "uplatex" "euptex")))
  (TeX-source-correlate-mode 1)
  (setq LaTeX-indent-level 2)
  (setq LaTeX-item-indent 2)
  (setq TeX-engine 'ptex)
  (setq TeX-source-correlate-start-server t)
  (setq text-mode-hook 'turn-on-auto-fill)
  (outline-minor-mode t)
  (auto-fill-mode 1)
  (setq fill-column 90)
  (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))
  (add-to-list 'TeX-command-list
               '("OMake" "/usr/local/bin/omake"
                 TeX-run-TeX nil (latex-mode) :help "Run OMake"))
  (add-to-list 'TeX-command-list
               '("XeLaTeX" "/usr/texbin/xelatex -src-specials %t"
                 TeX-run-TeX nil (latex-mode) :help "Run XeLaTeX"))
  (add-to-list 'TeX-command-list
               '("pLaTeX" "/usr/texbin/platex -src-specials %t"
                 TeX-run-TeX nil (latex-mode) :help "Run e-pLaTeX"))
  (add-to-list 'TeX-command-list
               '("pdfpLaTeX" "/usr/texbin/platex -synctex=1 %t && dvipdfmx %d"
                 TeX-run-TeX nil (latex-mode) :help "Run e-pLaTeX and dvipdfmx"))
  (add-to-list 'TeX-command-list
               '("pdfopen" "/usr/bin/open -a \"Preview.app\" %s.pdf"
                 TeX-run-discard-or-function t t
                 :help "Run Preview.app"))
  (add-to-list 'TeX-command-list
               '("pBibTeX" "pbibtex -kanji=utf8 %s"
                 TeX-run-BibTeX nil t :help "Run pBibTeX")))

(add-hook 'LaTeX-mode-hook 'my/latex-mode-hook)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-to-list 'ac-modes 'LaTeX-mode)

;; Flymake for LaTeX
(defun flymake-get-tex-args (file-name)
  (list "/usr/texbin/platex" (list "-file-line-error" "-interaction=nonstopmode" file-name)))
(setq ispell-parser 'tex)

(add-hook 'LaTeX-mode-hook 'flymake-mode-on)

(use-package zotelo
  :config
  (add-hook 'LaTeX-mode-hook 'zotelo-minor-mode)
  (setq zotelo-translators '())
  (add-to-list 'zotelo-translators 
               '(Better-BibLaTeX "f895aa0d-f28e-47fe-b247-2ea77c6ed583" "bib"))
  (setq zotelo-default-translator 'Better-BibLaTeX))


(setq org-latex-pdf-process '("latexmk -pdfdvi %f" "xelatex -interaction nonstopmode %f"))
(setq org-latex-classes '())
(add-to-list 'org-latex-classes '("jsarticle"
                         "\\documentclass[a4paper]{jsarticle}
\\usepackage[deluxe,expert]{otf}
\\usepackage[dvipdfmx]{graphicx}
\\usepackage{hyperref}
\\usepackage{txfonts}
 [NO-DEFAULT-PACKAGES]
 [PACKAGES]
 [EXTRA]"
                         ("\\section{%s}" . "\\section*{%s}")
                         ("\\subsection{%s}" . "\\subsection*{%s}")
                         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                         ("\\paragraph{%s}" . "\\paragraph*{%s}")
                         ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-latex-default-class "jsarticle")

