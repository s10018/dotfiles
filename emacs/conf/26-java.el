

(defun my/java-mode-hook ()
  (require 'jdee)
  (flycheck-mode)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 2)
  (setq jdee-server-dir "/Users/mai-om/.emacs.d/server")
  )

(add-hook 'jde-mode-hook 'my/java-mode-hook)

;; (require 'malabar-mode)

;; (defun my/java-mode-hook ()
;;   (require 'malabar-mode)
;;   (flycheck-mode)
;;   ;; (load "malabar-flycheck")

;;   (defun malabar-flycheck-error-column (lines)
;;     "Find the column of the error by looking for the magic caret.  Expand tabs to 8 spaces."
;;     (let* ((caret-line (-first (lambda (s) (string-match "\\([\t ]*\\^\\).*" s)) lines))
;;            (g1 (when caret-line (match-string 1 caret-line)))
;;            (g2 (when g1 (replace-regexp-in-string " " "!" g1))))
;;       (when  g2 (length g2))))

;;   (defun malabar-flycheck-error-line? (line)
;;     "Look for the line that has the error line and message"
;;     (string-match "\\(.*\\):\\([0-9]+\\): *\\(.*\\):\\(.*\\)" line))
  
;;   (defun malabar-flycheck-error-create (lines)
;;     "Return the flycheck error"
;;     (let* ((first-line (car lines)))
      
;;       (if (malabar-flycheck-error-line? first-line)
;;           (let ((level (match-string 3 first-line)))
;;             (flycheck-error-new :line (string-to-number (match-string 2 first-line))
;;                                 :message (concat (match-string 4 first-line) " \n"
;;                                                  (mapconcat 'identity (cdr lines) " \n"))
;;                                 :level (intern level)
;;                                 :column (malabar-flycheck-error-column lines))))))
  
;;   (defun malabar-flycheck-error-parser (output checker buffer)
;;     "Look in OUTPUT for compiler errors.  
;; Return a list of `flycheck-error`, one for each error returned."
;;     (let* ((ss (split-string output "[\n\r]+"))
;;            (sss (-drop-while (lambda (s) (string-match "^\\[.*" s)) ss)))
;;       (-filter 'identity
;;                (mapcar 'malabar-flycheck-error-create 
;;                        (-partition-by-header 'malabar-flycheck-error-line? sss)))))
  
;;   (eval-after-load 'flycheck
;;     '(progn
;;        (flycheck-define-checker malabar-mode-javac
;;          "Syntax java code on the fly.  Unfortunately, with cygwin
;; the file name needs to be converted to something windows friendly."
;;          :command ("javac"
;;                    "-J-Duser.language=en"
;;                    "-d" (eval (car
;;                                (flycheck-substitute-argument 'temporary-directory nil)))
;;                    "-cp" (eval (malabar-classpath-test))
;;                    (eval 
;;                       (car (flycheck-substitute-argument 'source nil))))
;;          :error-parser malabar-flycheck-error-parser
;;          :modes malabar-mode)
;;        (flycheck-select-checker 'malabar-mode-javac)))
;;     ;; (add-to-list 'flycheck-checkers 'malabar-mode-javac)
;;   (add-hook 'malabar-mode-hook 'flycheck-mode)
;; )

;; (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))
;; (add-hook 'malabar-mode-hook 'my/java-mode-hook)
;; (remove-hook 'malabar-mode-hook 'my/java-mode-hook)

;; (add-hook 'java-mode-hook
;; 	  (lambda ()
;; 	    (setq indent-tabs-mode nil)
;; 	    (setq c-basic-offset 2)))

;; (defun my-java-flymake-init ()
;;   (list "javac" (list "-J-Dfile.encoding=utf-8" (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-with-folder-structure))))

;; (add-to-list 'flymake-allowed-file-name-masks '("\\.java$" my-java-flymake-init flymake-simple-cleanup))

;; (add-hook 'java-mode-hook 'flymake-mode-on)
