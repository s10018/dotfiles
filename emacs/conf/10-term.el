
;; (require 'term+)
;; (require 'xterm-256color)
;; (require 'term+mux)

;; (define-key term+char-map (kbd "C-a") #'beginning-of-line)
;; (define-key term-raw-map "\C-a" 'move-beginning-of-line)
;; (setq term+mux-char-prefix "C-f")
;; (setq term+mux-line-prefix "C-x f")
;; (when term+mux-char-prefix
;;   (term+mux-with-prefix (prefix term+mux-char-prefix)
;;     (define-key term+char-map prefix term+mux-map)))
;; (when term+mux-line-prefix
;;   (term+mux-with-prefix (prefix term+mux-line-prefix)
;;     (define-key term+line-map prefix term+mux-map)))

;; http://d.hatena.ne.jp/syohex/20111026/1319606395
;; .emacs等設定ファイルに追加
;; Improve at 2013年 9月 14日
(defun elscreen-get-current-directory (buf)
  (with-current-buffer buf
    (aif (buffer-file-name)
        (file-name-directory it)
      default-directory)))

(defun non-elscreen-current-directory ()
  (let* ((bufsinfo (cadr (cadr (current-frame-configuration))))
         (bufname-list (assoc-default 'buffer-list bufsinfo)))
    (loop for buf in bufname-list
          for file = (or (buffer-file-name buf)
                         (with-current-buffer buf
                           (when (eq major-mode 'dired-mode)
                             dired-directory)))
          when (buffer-file-name buf)
          return (file-name-directory it))))
