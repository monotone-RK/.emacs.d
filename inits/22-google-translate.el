(require 'google-translate)

;; set default value for translate (ja -> en)（C-u == invalidate）
(custom-set-variables
 '(google-translate-default-source-language "ja")
 '(google-translate-default-target-language "en"))

;; display translating result on popup window
(push '("*Google Translate*") popwin:special-display-config)
