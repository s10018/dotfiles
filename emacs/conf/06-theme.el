
;; change font to Ricty
(set-face-attribute 'default nil
                   :family "Ricty"
                   :height 240)
(set-fontset-font nil 'japanese-jisx0208
                  (font-spec :family "Ricty"))

;; color theme
(add-to-list 'custom-theme-load-path
             (concat user-emacs-directory "el-get/replace-colorthemes"))
(load-theme 'solarized-dark t)
(enable-theme 'solarized-dark)

;; (load-theme 'julie t t)
;; (enable-theme 'julie) ;;'jonadabian-slate)

;; highlight indent
(use-package highlight-indentation
  :init
  (set-face-background 'highlight-indentation-face "#664D2A")
  (set-face-background 'highlight-indentation-current-column-face "#664D2A"))

;; hight line
(defface hlline-face
  '(
    (((class color)
      (background dark))
     (:background "#623e3e"))
    (((class color)
      (background light))
     (:background  "#623e3e"))
    (t
     ()))
  "*Face used by hl-line." :group 'hline-face-group)
(defvar hl-line-face 'hlline-face)
(global-hl-line-mode)
