
;; when mac system

(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))
(define-key global-map [ns-drag-file] 'ns-find-file)
(setq mac-pass-control-to-system nil)
(setq mac-pass-command-to-system nil)
(setq mac-pass-option-to-system nil)

(setq initial-frame-alist
      (append (list
	       '(width . 55)
	       '(height . 35)
	       '(top . 100)
	       '(left . 100)
	       )
	      initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

(when (require 'ucs-normalize nil t)
  (setq file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

;; dictionary
;; http://d.hatena.ne.jp/tomoya/20100103/1262482873
(defvar dict-bin (concat home-directory "/local/bin/dict")
  "dict 実行ファイルのパス")

(defun temp-cancel-read-only (function &optional jaspace-off)
  "eval temporarily cancel buffer-read-only
&optional t is turn of jaspace-mode"
  (let ((read-only-p nil)
	(jaspace-mode-p nil))
    (when jaspace-off
      (when jaspace-mode
	(jaspace-mode)
	(setq jaspace-mode-p t)))
    (when buffer-read-only
      (toggle-read-only)
      (setq read-only-p t))
    (eval function)
    (when read-only-p
      (toggle-read-only))
    (when jaspace-mode-p
      (jaspace-mode))))

(defun ns-popup-dictionary ()
   "マウスカーソルの単語を Mac の辞書でひく"
   (interactive)
   (let ((word (substring-no-properties (thing-at-point 'word)))
	 (old-buf (current-buffer))
	 (dict-buf (get-buffer-create "*dictionary.app*"))
	 (dict))
     (when (and mark-active transient-mark-mode)
       (setq word (buffer-substring-no-properties (region-beginning) (region-end))))
     (set-buffer dict-buf)
     (erase-buffer)
     (call-process dict-bin
		   nil "*dictionary.app*" t word
		   "Japanese-English" "Japanese" "Japanese Synonyms")
     (setq dict (buffer-string))
     (set-buffer old-buf)
     (when (not (eq (length dict) 0))
       (temp-cancel-read-only '(popup-tip dict :margin t :scroll-bar t)))))

;; (defvar dict-timer nil)
;; (defvar dict-delay 1.0)
;; (defun dict-timer ()
;;   (when (and (not (minibufferp))
;; 	     (and mark-active transient-mark-mode))
;;     (ns-popup-dictionary)))
;; (setq dict-timer (run-with-idle-timer dict-delay dict-delay 'dict-timer))
;; (define-key global-map (kbd "C-c w") )

(defun ucs-normalize-NFC-buffer ()
  (interactive)
  (ucs-normalize-NFC-region (point-min) (point-max)))

(global-set-key (kbd "C-x RET u") 'ucs-normalize-NFC-buffer)

(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))

