
(defun my/web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   2
        web-mode-css-offset    2
        web-mode-script-offset 2
        web-mode-php-offset    2
        web-mode-java-offset   2
        web-mode-asp-offset    2))

(defun my/js-hook ()
  ""
  (setq js2-auto-indent-p t
        js-indent-level 2
        js-expr-indent-offset 2
        indent-tabs-mode nil)
  (set (make-local-variable 'indent-line-function) 'js-indent-line))

(use-package web-mode
  :mode (("\\.phtml$"     . web-mode)
         ("\\.tpl\\.php$" . web-mode)
         ("\\.jsp$"       . web-mode)
         ("\\.as[cp]x$"   . web-mode)
         ("\\.erb$"       . web-mode)
         ("\\.html?$"     . web-mode))
  :config
  (add-hook 'web-mode-hook '(lambda () (flymake-mode t))))

(use-package js2-mode
  :if (require 'js nil t)
  :mode (("\\.js$" . js2-mode))
  :init
  (add-hook 'js2-mode-hook 'my/js-hook))

(use-package css-mode
  :mode (("\\.scss$" . css-mode))
  :config
  (setq css-indent-offset 2))
