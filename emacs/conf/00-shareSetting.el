;; 
;; 00-shareSetting.el
;;
(setq user-full-name "s10018")
(setq user-mail-address "shiyuuzi99@gmail.com")

;; (guru-global-mode -1)


(defun copy-server-file (lst)
  "copy file the server in the lst"
  (dolist (l lst)
    (copy-file "~/.emacs.d/server/server"
               (concat "/ssh:" l ":.emacs.d/server/server") t))
  )

(setq server-use-tcp t
      server-port    9999)
(server-start)
(copy-server-file '("pine14")) ;; "mednlp"))

;; setting PATH
(use-package exec-path-from-shell
  :config
  (setq exec-path-from-shell-arguments '("-l"))
  (setq exec-path-from-shell-variables
        '("LD_LIBRARY_PATH" "PATH" "MANPATH" "PYENV_ROOT"
          "PYTHONPATH" "DYLD_LIBRARY_PATH" "PYENV_ROOT" "INFOPATH" "C_INCLUDE_PATH"))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "SHELL")
  (exec-path-from-shell-copy-env "C_INCLUDE_PATH")
  (exec-path-from-shell-copy-env "PYENV_ROOT")
)

;; adding info path
(use-package info
  :defer t
  :config
  (add-to-list 'Info-directory-list (concat user-emacs-directory "share/info"))
  (add-to-list 'Info-directory-list (concat home-directory "/local/share/info")))

;; 'C-x C-q' switch viwe-mode
(setq view-read-only t)
(setq inhibit-startup-message t) ;; do not show start-up window
(setq transient-mark-mode t)
(column-number-mode 1) ;; show column-number
(setq ring-bell-function 'ignore) ;; cannot ring bell
;; display time
(setq
 display-time-24hr-format t
 display-time-day-and-date t) ;; format 24h, not 12h
(display-time-mode t)
;; don't show scroll-bar
(scroll-bar-mode 0)
(tool-bar-mode 0) ;; hide tool-bar!
(display-battery-mode -1) ;; show battery pacent
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq completion-ignore-case t)

(use-package ediff
  :config
  ;; コントロール用のバッファを同一フレーム内に表示
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  ;; diffのバッファを上下ではなく左右に並べる
  (setq ediff-split-window-function 'split-window-horizontally))

;; if it is script file, make the file executable after saved
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; tab setting
(setq tab-width 2)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list '(2 4 6 8 10 12 14 16 18))
(setq-default truncate-lines nil)
(setq delete-by-moving-to-trash t)
(show-paren-mode t)
(global-linum-mode t)
(setq save-interprogram-paste-before-kill nil)

;; Auto-save-buffers
(use-package auto-save-buffers-enhanced
  :init
  (setq auto-save-list-file-prefix nil)
  :config
  (setq auto-save-buffers-enhanced-save-scratch-buffer-to-file-p t)
  (setq auto-save-buffers-enhanced-file-related-with-scratch-buffer
        (locate-user-emacs-file "scratch"))
  (auto-save-buffers-enhanced t)
  (add-hook 'makefile-mode-hook
            (function (lambda ()
                        (fset 'makefile-warn-suspicious-lines 'ignore)))))

;; cua-mode
(use-package cua-base
  :bind
  (("C-x SPC" . cua-set-rectangle-mark))
  :config
  (cua-mode t)
  (setq cua-enable-cua-keys nil))

;; (use-package magit
;;   :config
;;  )

(use-package popwin
  :config
  (defvar display-buffer-function 'popwin:display-buffer)
  (push '("*my helm*") popwin:special-display-config))

(use-package tramp
  :config
  (setq tramp-default-method "scp"))

(use-package open-junk-file
  :config
  (setq open-junk-file-format "~/local/tmp/%Y-%m-%d-%H%M%S."))


(defun ask-user-about-supersession-threat (fn)
  "blatantly ignore files that changed on disk"
  )
(defun ask-user-about-lock (file opponent)
  "always grab lock"
  t)

(use-package volume
  )

(use-package ace-isearch
  :config
  ;; (setq ace-isearch-use-function-from-isearch nil)
  ;; (define-key isearch-mode-map (kbd "M-o") 'helm-multi-swoop-all-from-isearch)
  (global-ace-isearch-mode 1))

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-M-c") 'mc/edit-lines)
  (global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)
  (global-unset-key "\C-t")
  )

(use-package smartrep
  :config
  (declare-function smartrep-define-key "smartrep")
  (smartrep-define-key global-map "C-t"
    '(("C-t"      . 'mc/mark-next-like-this)
      ("n"        . 'mc/mark-next-like-this)
      ("p"        . 'mc/mark-previous-like-this)
      ("m"        . 'mc/mark-more-like-this-extended)
      ("u"        . 'mc/unmark-next-like-this)
      ("U"        . 'mc/unmark-previous-like-this)
      ("s"        . 'mc/skip-to-next-like-this)
      ("S"        . 'mc/skip-to-previous-like-this)
      ("*"        . 'mc/mark-all-like-this)
      ("d"        . 'mc/mark-all-like-this-dwim)
      ("i"        . 'mc/insert-numbers)
      ("o"        . 'mc/sort-regions)
      ("O"        . 'mc/reverse-regions)))
  )
