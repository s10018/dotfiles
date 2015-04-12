
;; http://tototoshi.hatenablog.com/entry/20100630/1277897703
(defun browse-url-at-point ()
  "can open url at point"
  (interactive)
  (let ((url-region (bounds-of-thing-at-point 'url)))
    (when url-region
      (browse-url (buffer-substring-no-properties (car url-region)
						  (cdr url-region))))))
(bind-key* "C-c C-o" 'browse-url-at-point)

;; search-web
;; reference: http://qiita.com/akisute3@github/items/8deb54b75b48e8b04cb0
;; trainsient-region-active-p define here http://philippewang.info/emacsel/site-lisp/ac-mode.el ... ??

(defun transient-region-active-p ()
  (and (boundp 'transient-mark-mode)
       transient-mark-mode
       (boundp mark-active)
       mark-active))

;; (defun search-web-dwim (&optional arg-engine)
;;   "transient-mark-mode がオンの時はリージョンを，
;; オフの時はカーソル位置の単語を検索する．"
;;   (interactive)
;;   (cond
;;    ((transient-region-active-p)
;;     (search-web-region arg-engine))
;;    (t
;;     (search-web-at-point arg-engine))))

;; (defun search-web-at-point (&optional arg-engine)
;;   (interactive)
;;   (message "sw: %s" arg-engine)
;;   (let* ((completion-ignore-case t)
;;          (search-word (substring-no-properties (thing-at-point 'word)))
;;          (engine (or arg-engine (completing-read (format "[%s] Search Engine: " search-word)
;;                                                  (make-search-engine-name-list) nil t))))
;;     (search-web engine search-word)))

;; (defun search-web-region (&optional arg-engine)
;;   (interactive)
;;   (let* ((completion-ignore-case t)
;;          (beg (mark))
;;          (end (point))
;;          (search-word (buffer-substring-no-properties beg end))
;;          (engine (or arg-engine (completing-read (format "[%s] Search Engine: " search-word)
;;                                                  (make-search-engine-name-list) nil t))))
;;     (search-web engine search-word)))

;; (defun search-google ()
;;   (interactive)
;;   (search-web-dwim "google"))

(use-package search-web
  :config
  (bind-key* "C-c w" (lambda () (interactive) (search-web-dwim "google")))
  (bind-key* "C-c C-w" (lambda () (interactive) (search-web-dwim)))
  )

