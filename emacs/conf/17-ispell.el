
(use-package flyspell
  :init
  (setq ispell-program-name "aspell"
        ispell-grep-command "grep"
        flyspell-issue-welcome-flag nil
        flymake-gui-warnings-enabled nil)
  (eval-after-load "ispell"
    '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]")))
  (unbind-key "C-j" flyspell-mode-map))
