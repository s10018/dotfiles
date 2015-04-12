
;; helm-filelist
(use-package helm-mode
  :if (and (require 'helm-filelist nil t) (require 'helm-ls-git nil t))
  :config
  (setq helm-filelist-file-name "/tmp/filelist"
        helm-filelist-grep-command "ag --no-numbers"
        helm-source-filelist-d (helm-source-filelist))
  (helm-mode 1)
  (setq helm-mini-default-sources '(helm-source-buffers-list
                                    helm-source-ls-git
                                    helm-source-recentf
                                    helm-source-buffer-not-found
                                    helm-source-filelist-d))
  (bind-key* "M-y" 'helm-show-kill-ring)
  (bind-key* "C-;" 'helm-mini))

;; recentf settings
(use-package recentf
  :config
  (setq recentf-exclude '(".recentf" ".howm" "DS_Store" "Makefile" "recentf-list" ".git"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
)

(use-package recentf-ext
  :config
  (custom-set-variables
     '(recentf-save-file (concat user-emacs-directory "etc/recentf-list.el"))
     '(recentf-max-saved-items 500)
     '(recentf-auto-cleanup 10)
     '(recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))))

(use-package helm-descbinds
  :config
  (helm-descbinds-mode))

(use-package helm-swoop
  :bind
  (("M-i" . helm-swoop)
   ("M-I" . helm-swoop-back-to-last-point)
   ("C-c M-i" . helm-multi-swoop)
   ("C-x M-i" . helm-multi-swoop-all)))
