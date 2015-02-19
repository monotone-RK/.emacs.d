(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
;; customize
(setq ac-auto-start 2)         ; start to complete when more than 2
(setq ac-delay 0.05)           ; start to complete n-seconds later
(setq ac-use-fuzzy t)          
(setq ac-use-comphist t)       ; enable to predict completion function
(setq ac-auto-show-menu 0.05)  ; display completion menu n-seconds later
(setq ac-quick-help-delay 0.5) ; display quick help n-seconds later
(setq ac-ignore-case nil)      ; divide large and small char
;; prohibit involving Japanese word in auto-complete candidates
;; http://d.hatena.ne.jp/IMAKADO/20090813/1250130343
(defadvice ac-word-candidates (after remove-word-contain-japanese activate)
  (let ((contain-japanese (lambda (s) (string-match (rx (category japanese)) s))))
    (setq ad-return-value
          (remove-if contain-japanese ad-return-value))))

(require 'auto-complete-latex)
(setq ac-l-dict-directory "~/.emacs.d/site-lisp/ac-l-dict/")
(add-to-list 'ac-modes 'latex-mode)
(add-hook 'latex-mode-hook 'ac-l-setup)
;; for YaTeX
(when (require 'auto-complete-latex nil t)
  (setq ac-l-dict-directory "~/.emacs.d/site-lisp/ac-l-dict/")
  (add-to-list 'ac-modes 'yatex-mode)
              (add-hook 'yatex-mode-hook 'ac-l-setup))
