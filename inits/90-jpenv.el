;; set used language to Japanese
(set-language-environment "Japanese")

;; set utf-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; font's setting (Ricty 12 point)
;; default
(set-face-attribute 'default nil
				:family "Ricty"
				:height 120)

;; Japanese
(set-fontset-font "fontset-default"
                  'japanese-jisx0208
                  '("Ricty"))
;; half-width kana
(set-fontset-font "fontset-default"
                  'katakana-jisx0201
                  '("Ricty"))
