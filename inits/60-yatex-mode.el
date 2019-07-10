;; install YaTeX
(setq auto-mode-alist
     (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;; set external commands
(setq tex-command "platex -interaction=nonstopmode")
(setq bibtex-command "pbibtex")
(setq dvi2-command "open -a PictPrinter")
(setq dviprint-command-format "dvipdfmx %s")

;; set kanji-code of YaTeX
;; - nil = continue to use current character code
;; - 0   = no-converion -> character code that is used in the emacs (Emacs23:utf-8-emacs)
;; - 1   = Shift_JIS
;; - 2   = JIS (ISO-2022-JP)(default)
;; - 3   = EUC-JP
;; - 4   = UTF-8
(setq YaTeX-kanji-code 0) 

;; set other parameters
(setq YaTeX-latex-message-code 'utf-8)

;; turn on RefTex automatically
(add-hook 'yatex-mode-hook 'turn-on-reftex)
