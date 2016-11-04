
(defun concat-emacs-directory (path)
  "concat emacs directory"
  (concat user-emacs-directory path))

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-vertically))
  (other-window 1))

;; I like vertically...
;; (defun other-window-or-split ()
;;   (interactive)
;;   (when (one-window-p)
;;     (split-window-horizontally))
;;   (other-window 1))


(setq my-tmpfile-directory (concat home-directory "/local/tmp/"))
(defun my-tmpfile-new (filename)
  "Make tmp file"
  (interactive "sfilename: ")
  (let ()
    (find-file (concat my-tmpfile-directory filename))))
(defun my-tmpfile-delete ()
  "Delete files in tmpfile directory"
  (interactive)
  (let ()
    (if (yes-or-no-p "DELETE all files in tempfile directory??")
        (insert "hoge")
      (insert "fuga"))))

(defun avg (lst)
  (let ((len (length lst)))
    (/ (reduce '+ lst) len)))

(defun f-value (p r)
  (/ (* 2 p r) (+ p r)))

(defun prec (tp fp)
  (/ tp (+ tp fp)))


(defvar volume-mac-default-channels
  '("output" "input" "alert")
  "The default value of `volume-mac-channels'.")

(defvar volume-mac-program
  "osascript" "The default value of `volume-mac-program'.")

(defun volume-mac-default-channel ()
  "The default value of `volume-mac-channel'."
  "output")

(defvar volume-mac-current-channel-val
  (volume-mac-default-channel) "mac default channel")

(defun volume-mac-current-channel ()
  volume-mac-current-channel-val)

(defun volume-mac-get-cmd (device)
  "volume-mac-get-cmd"
  (format "%s volume of (get volume settings)" device))

(defun volume-mac-set-cmd (device n)
  "volume-mac-set-cmd"
  (format "set Volume %s volume %d" device n))

(defun volume-mac-channels ()
  volume-mac-default-channels)

(defun volume-mac-call (&rest arguments)
  "Call amixer with ARGUMENTS and return the output."
  (apply 'volume-call-process-to-string volume-mac-program
         (cons "-e" arguments)))

(defun volume-mac-get ()
  "Return volume"
  (string-to-number
   (volume-mac-call (volume-mac-get-cmd (volume-current-channel)))))

(defun volume-mac-set (n)
  "Return volume"
  (progn
    (volume-mac-call
     (volume-mac-set-cmd (volume-current-channel) n))
    n))

(defun volume-mac-nudge (n)
  "Return volume"
  (let* ((now-val (volume-mac-get))
         (set-val
          (if (< (+ n now-val) 0)
              0
            (if (> (+ n now-val) 100)
                100 (+ n now-val)))))
    (volume-mac-call
     (volume-mac-set-cmd (volume-current-channel) set-val))
    set-val))

(defun volume-mac-channel-label (channel)
  "Return the name of CHANNEL."
  channel)

(defun volume-mac-switch-channel (channel)
  (setq volume-mac-current-channel-val channel))

(setq volume-mac-backend
      '((get . volume-mac-get)
        (set . volume-mac-set)
        (nudge . volume-mac-nudge)
        (current-channel . volume-mac-current-channel)
        (switch-channel . volume-mac-switch-channel)
        (default-channel . volume-mac-default-channel)
        (channel-label . volume-mac-channel-label)
        (channels . volume-mac-channels)))

(setq volume-backend 'volume-mac-backend)

(defun insert-buffer-name ()
  "insert buffer-name"
  (interactive)
  (insert (buffer-name)))

;; http://ynomura.dip.jp/archives/2010/07/emacs.html
(defun kill-ring-save-current-word ()
  "Save current word to kill ring as if killed, but don't kill it."
  (interactive)
  (kill-new (current-word)))

(global-set-key "\C-cw" 'kill-ring-save-current-word)
