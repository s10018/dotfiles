
;; reference: http://qiita.com/okonomi/items/f18c9221420eca47ebc6
;; reference: http://qiita.com/catatsuy/items/ae9875706769d4f02317

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)

(require 'google-translate)
(require 'google-translate-default-ui)
(global-set-key "\C-xt" 'google-translate-at-point)
(global-set-key "\C-xT" 'google-translate-query-translate)

;; 翻訳のデフォルト値を設定(ja -> en)（無効化は C-u する）
(setq google-translate-default-source-language "ja"
      google-translate-default-target-language "en")

;; google-translate.elの翻訳バッファをポップアップで表示させる
(push '("*Google Translate*") popwin:special-display-config)

;;; 翻訳結果をkill-ringに保存するアドバイス
(defadvice google-translate-paragraph (before
                      google-translate-paragraph-before)
  (when (equal 'google-translate-translation-face (ad-get-arg 1))
    (let ((text (ad-get-arg 0)))
      (kill-new text nil nil))))

(ad-activate 'google-translate-paragraph)
