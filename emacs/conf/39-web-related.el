
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

(use-package search-web
  :config
  (bind-key* "C-c w" (lambda () (interactive) (search-web-dwim "google")))
  (bind-key* "C-c C-w" (lambda () (interactive) (search-web-dwim "weblio")))
  (add-to-list 'search-web-engines
               '("weblio" "http://ejje.weblio.jp/content/%s" nil))
  )

