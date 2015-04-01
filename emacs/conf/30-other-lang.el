
;; 設定が長くない言語モード 長くなったら移行

(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; scala
(when (require 'scala-mode2 nil t)
  (when (require 'ensime nil t)
    (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)))

;; scheme (gosh)
(when (require 'scheme nil t)
  (setq process-coding-system-alist
        (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
  (setq scheme-program-name "gosh -i"))

;; sgml-mode setting (XML)
(when (require 'sgml-mode nil t)
  (define-key sgml-mode-map (kbd "C-c C-p") 'sgml-pretty-print)
  (add-to-list 'auto-mode-alist '("\\.xml$" . sgml-mode))
  (remove-hook 'sgml-mode-hook #'turn-on-auto-fill))
(put 'upcase-region 'disabled nil)

;; php-mode
(when (require 'php-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
  (add-hook 'php-mode-hook
            (lambda ()
              (setq php-mode-force-pear t))))

;; octave mode
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

;; apples-mode for apple-script
(autoload 'apples-mode "apples-mode" "Happy AppleScripting!" t)
(add-to-list 'auto-mode-alist '("\\.\\(applescri\\|sc\\)pt\\'" . apples-mode))

