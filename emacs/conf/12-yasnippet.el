
(defun my-yas/prompt (prompt choices &optional display-fn)
  (let* ((names (loop for choice in choices
                      collect (or (and display-fn (funcall display-fn choice))
                                  coice)))
         (selected (helm-other-buffer
                    `(((name . ,(format "%s" prompt))
                       (candidates . names)
                       (action . (("Insert snippet" . (lambda (arg) arg))))))
                    "*helm yas/prompt*")))
    (if selected
        (let ((n (position selected names :test 'equal)))
          (nth n choices))
      (signal 'quit "user quit!"))))

(use-package yasnippet
  :bind
  (("C-c y" . yas/insert-snippet))
  :config
  (setq yas/trigger-key (kbd "C-."))
  (setq yas/snippet-dirs (list (concat user-emacs-directory "share/snippets")))
  (unbind-key "<tab>" yas-minor-mode-map)
  (unbind-key "TAB" yas-minor-mode-map)
  (bind-keys :map yas-minor-mode-map
             ("C-." . yas-expand))
  (setq yas-new-snippet-default "\
# -*- mode: snippet -*-
# name: $1
# key: ${2:${1:$(yas--key-from-desc yas-text)}}
# --
$0")
  (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))
  (add-to-list 'yas-snippet-dirs (concat user-emacs-directory "share/yasnippet-snippets"))
  (yas/global-mode 1))
