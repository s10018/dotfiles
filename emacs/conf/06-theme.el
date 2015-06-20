
;; change font to Ricty
(set-face-attribute 'default nil
                    :family "Ricty Discord"
                    :height 240)
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (cons "Ricty Discord" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0212
                  (cons "Ricty Discord" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  (cons "Ricty Discord" "iso10646-1"))

;; color theme
;; (add-to-list 'custom-theme-load-path
;;              (concat user-emacs-directory "el-get/replace-colorthemes"))
;; (load-theme 'solarized-dark t)
;; (enable-theme 'solarized-dark)

(use-package flatui-theme
  :config
  (load-theme 'flatui t)
  (enable-theme 'flatui))

;; (load-theme 'julie t t)
;; (enable-theme 'julie) ;;'jonadabian-slate)

;; ;; highlight indent
(use-package highlight-indentation
  :config
  (set-face-background 'highlight-indentation-face "#7d7000")
  (set-face-background 'highlight-indentation-current-column-face "#7d7d7d")
  (global-hl-line-mode))


