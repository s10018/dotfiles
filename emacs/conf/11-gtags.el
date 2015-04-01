
(defun my/helm-gtags-mode ()
    (local-set-key (kbd "M-g") 'helm-gtags-dwim)
    (local-set-key (kbd "M-s") 'helm-gtags-show-stack)
    (local-set-key (kbd "M-p") 'helm-gtags-previous-history)
    (local-set-key (kbd "M-n") 'helm-gtags-next-history))

(use-package helm-gtags
  :config
  (setq helm-gtags-path-style 'root)
  (setq helm-gtags-auto-update nil)
  (add-hook 'go-mode-hook (lambda () (helm-gtags-mode)))
  (add-hook 'python-mode-hook (lambda () (helm-gtags-mode)))
  (add-hook 'ruby-mode-hook (lambda () (helm-gtags-mode)))                         
  (add-hook 'sh-mode-hook (lambda () (helm-gtags-mode)))                         
  (add-hook 'helm-gtags-mode-hook 'my/helm-gtags-mode))
