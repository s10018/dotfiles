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
  
;; Cask setting
(require 'cask (concat home-directory "/.cask/cask.el"))
(when (require 'cask nil t)
  (cask-initialize)
  (require 'pallet)
  (pallet-mode t))

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

(use-package init-loader
  :config
  (setq init-loader-show-log-after-init t)
  (setq init-loader-byte-compile t)
  (init-loader-load (format "%sconf" user-emacs-directory)))

(use-package el-get
  :config
  (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/recipe")
  (el-get 'sync '(howm replace-colorthemes jazzradio helm-filelist)))

