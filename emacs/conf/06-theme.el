
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
(require 'cl)
(setq added-color-theme-path
      (list
        (concat el-get-dir "/replace-colorthemes")
        (concat el-get-dir "/base16")
        (concat el-get-dir "/smyx")
        ))
(loop for x in added-color-theme-path
      do (add-to-list 'custom-theme-load-path x))

(load-theme 'smyx t)

;; (load-theme 'julie t t)
;; (enable-theme 'julie) ;;'jonadabian-slate)

;; ;; highlight indent
(use-package indent-guide-global-mode
  :init
  (indent-guide-global-mode)
  (set-face-background 'indent-guide-face "dimgray")
  )

(global-hl-line-mode 1)

;; (use-package highlight-indentation
;;   :config
;;   (set-face-background 'highlight-indentation-face "#7d6000")
;;   (set-face-background 'highlight-indentation-current-column-face "#8d7070")
;;   (global-hl-line-mode)
;;   )

