
(defun my/c++-mode-hook ()
  (setq indent-tabs-mode nil)
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)
  (add-hook 'c++-mode-hook 'flycheck-mode)
  (add-hook 'c-mode-common-hook 'flycheck-mode)
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (semantic-mode 1)
  (add-to-list 'ac-sources 'ac-source-semantic)
  (key-combo-define-local (kbd ":") '("::" ":"))

;;   (eval-after-load 'flycheck
;;     '(progn
;;        (flycheck-define-checker c/c++-clang
;;          "A C/C++ syntax checker using Clang.

;; See URL `http://clang.llvm.org/'."
;;          :command ("clang"
;;                    "-fsyntax-only"
;;                    "-fno-color-diagnostics"    ; Do not include color codes in output
;;                    "-fno-caret-diagnostics"    ; Do not visually indicate the source
;;                                         ; location
;;                    "-fno-diagnostics-show-option" ; Do not show the corresponding
;;                                         ; warning group
;;                    (option "-std=" flycheck-clang-language-standard)
;;                    (option-flag "-fno-rtti" flycheck-clang-no-rtti)
;;                    (option-list "-include" flycheck-clang-includes)
;;                    (option-list "-W" flycheck-clang-warnings s-prepend)
;;                    (option-list "-D" flycheck-clang-definitions s-prepend)
;;                    (option-list "-I" flycheck-clang-include-path)
;;                    "-x" (eval
;;                          (cl-case major-mode
;;                            (c++-mode "c++")
;;                            (c-mode "c"))) source-inplace)
;;          :error-patterns
;;          ((warning line-start (file-name) ":" line ":" column
;;                    ": warning: " (message) line-end)
;;           (error line-start (file-name) ":" line ":" column
;;                  ": " (or "fatal error" "error") ": " (message) line-end))
;;          :modes (c-mode c++-mode)
;;          :next-checkers ((warnings-only . c/c++-cppcheck)))

       ;; (require 'flycheck-google-cpplint)
       ;; ;; Add Google C++ Style checker.
       ;; ;; In default, syntax checked by Clang and Cppcheck.
       ;; (flycheck-add-next-checker 'c/c++-clang
       ;;                            '(warnings-only . c/c++-googlelint))))
  
  ;; http://qiita.com/akisute3@github/items/6fb94c30f92dae2a24ee
  ;; (flycheck-define-checker c/c++
  ;;   "A C/C++ checker using g++."
  ;;   :command ("g++" "-Wall" "-Wextra" source)
  ;;   :error-patterns  ((error line-start
  ;;                            (file-name) ":" line ":" column ":" " エラー: " (message)
  ;;                            line-end)
  ;;                     (warning line-start
  ;;                              (file-name) ":" line ":" column ":" " 警告: " (message)
  ;;                              line-end))
  ;;   :modes (c-mode c++-mode))
  ;; (add-to-list 'flycheck-checkers 'c/c++) ;; http://flycheck.readthedocs.org/en/0.17/manual/extending.html
  ;; (flycheck-select-checker 'c/c++)
  (setq flycheck-clang-include-path
        (mapcar 'expand-file-name (split-string (getenv "C_INCLUDE_PATH") ":"))))

(add-hook 'c++-mode-hook 'my/c++-mode-hook)
