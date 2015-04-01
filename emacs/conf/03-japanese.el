
;; Japanese setting
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-input-method "MacOSX")

;; migemo
(use-package migemo
  :if (executable-find "cmigemo")
  :config
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (load-library "migemo")
  (migemo-init))
