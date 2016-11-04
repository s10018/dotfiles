
(defun my/python-mode-hook ()
  (setq python-indent 4)
  (setq python-indent-list-length 4)             
  (setq python-continuation-offset 4)
  (setq indent-tabs-mode nil)
  (key-combo-define-local (kbd ":") '(":" ": "))
  (key-combo-define-local (kbd ",") '(", " ","))
  (key-combo-define-local (kbd "=") '(" = " "=" " == "))
  (key-combo-define-local (kbd "<") '(" < " "<"))
  (key-combo-define-local (kbd ">") '(" > " ">"))
  (flyspell-prog-mode)
  (defun flycheck-python-setup ()
    (flycheck-mode))
  (add-hook 'python-mode-hook #'flycheck-python-setup)
  (flycheck-add-next-checker 'python-flake8 'python-pylint)

)

(use-package elpy
  :if (require 'python nil t)
  :config
  ;; (setenv "PYENV_ROOT" "/Users/mai-om/.anyenv/envs/pyenv")
  (setenv "PATH"
          (concat "/Users/mai-om/.anyenv/envs/pyenv/shims:/Users/mai-om/.anyenv/envs/pyenv/bin:"
                  (getenv "PATH")))
  (setq exec-path (parse-colon-path (getenv "PATH")))
  (add-hook 'python-mode-hook 'my/python-mode-hook)
  (elpy-enable)
  (setq elpy-modules '(elpy-module-sane-defaults
                       elpy-module-company
                       elpy-module-eldoc
                       elpy-module-highlight-indentation
                       elpy-module-pyvenv
                       elpy-module-yasnippet))
  (add-hook 'python-mode-hook 'flycheck-mode)
  (elpy-use-ipython)
)


(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             ;;入力されたタグの定義元へジャンプ
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             ;;入力タグを参照する場所へジャンプ
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)  
             ;;入力したシンボルを参照する場所へジャンプ
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
             ;;タグ一覧からタグを選択し, その定義元にジャンプする
             (local-set-key (kbd "M-l") 'helm-gtags-select)
             ;;ジャンプ前の場所に戻る
             (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))


(use-package helm-gtags
  :config
  (add-hook 'python-mode-hook 'helm-gtags-mode)
  )

