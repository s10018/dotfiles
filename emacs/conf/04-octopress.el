
(defvar octopress-root-path
  (concat home-directory "/Documents/parsonal/octopress"))

(defun octopress-rake (command)
  "run rake commands"
  (shell-command-to-string
   (format
    "bash -l -c 'eval \"$(rbenv init -)\" && cd %s && rbenv shell `cat .ruby-version` && rake %s'"
    octopress-root-path command)))

(defun octopress-new (class title)
  (let* ((command-str (format "new_%s[\"%s\"]" class title))
         (command-result (octopress-rake command-str))
         (regexp-str (format "Creating new %s: " class))
         (filename))
    (progn
      (setq filename
            (concat octopress-root-path "/"
                    (replace-regexp-in-string 
                     regexp-str ""
                     (car (cdr (reverse (split-string command-result "\n")))))))
      (find-file filename))))

(defun octopress-new-post (title)
  "begin a new post in source/_posts"
  (interactive "MTitle: ")
  (octopress-new "post" title))

(defun octopress-gen-deploy ()
  "generate website and deploy"
  (interactive)
  (octopress-rake "gen_deploy")
  (message "Generate and Deploy OK"))

(defun octopress-preview ()
  "preview the site in a web browser"
  (interactive)
  (octopress-rake "preview"))

(defun decode-my-post-file-name (path)
  "Decode my octopress file name"
  (let ((postlist (substring (shell-command-to-string (mapconcat 'identity (list "ls" path) " ")) 0 -1))
        (filenames '()))
    (dolist (file-name (split-string postlist "\n"))
      (setq filenames (append filenames
                              (list (concat path file-name)))))
      filenames))

(defun get-title (filename)
  (with-temp-buffer
    (insert-file-contents filename)
    (setq content (buffer-string))
    (string-match "title: \\(.*\\)" content)
    (cons (replace-regexp-in-string "\"" "" (match-string 1 content)) filename)))

(defun get-title-list (root)
  (mapcar 'get-title
          (reverse (sort
                    (decode-my-post-file-name root) 'string<))))

(defun helm-octopress-postlist ()
  (interactive)
  (helm :sources `((name . "Octopress post list")
                   (candidates . , (get-title-list (concat octopress-root-path "/source/_posts/")))
                   (action . find-file))))
