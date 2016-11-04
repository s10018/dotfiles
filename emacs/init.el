;;
;; Settings until starting loading conf/*.el
;;

(setq debug-on-error t)

(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d/"))
(setq load-path (cons (expand-file-name "~/.emacs.d/elisp") load-path))
(setq home-directory (getenv "HOME"))

(setq max-lisp-eval-depth 50000)
(setq max-specpdl-size 60000)

(setenv "TERM" "xterm")
(setq load-file-name nil)
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))


(let ((versioned-dir (locate-user-emacs-file (concat "el-get" "/" emacs-version))))
  (setq el-get-dir (expand-file-name "el-get" versioned-dir)
        package-user-dir (expand-file-name "elpa" versioned-dir)))

;; el-get setting
(add-to-list 'load-path (concat el-get-dir "/" "el-get"))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))


(when (require 'el-get nil t)
  (setq el-get-user-package-directory (locate-user-emacs-file "init"))
  (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/recipe")
  (load (locate-user-emacs-file "ElBundle"))
  (el-get-bundle tarao/el-get-lock)
  (el-get-lock)
)

;; Cask setting
;; (when (require 'cask nil t)
;;  (cask-initialize)
;;  (when (require 'pallet nil t)
;;    (pallet-mode t)))

;; package
(when (require 'package nil t)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives
               '("ELPA" . "http://tromey.com/elpa/"))
  (add-to-list 'package-archives
               '("gnu" . "http://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize))


(unless (require 'use-package nil t)
  (defmacro use-package (&rest args)))


(when (require 'init-loader nil t)
  (setq init-loader-show-log-after-init t)
  (setq init-loader-byte-compile t)
  (init-loader-load (format "%sconf" user-emacs-directory)))

;; (require 'cask nil t)
;; (setq magit-last-seen-setup-instructions "1.4.0")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(recentf-auto-cleanup 10)
 '(recentf-auto-save-timer (run-with-idle-timer 30 t (quote recentf-save-list)) t)
 '(recentf-max-saved-items 500)
 '(recentf-save-file (concat user-emacs-directory "etc/recentf-list.el"))
 '(safe-local-variable-values
   (quote
    ((reftex-default-bibliography . ref)
     (zotero-collection . "1")
     (pyvenv-workon))))
 '(yas-prompt-functions (quote (my-yas/prompt))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
