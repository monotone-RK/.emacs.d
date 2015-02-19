;; Verilog-mode
(setq auto-mode-alist (cons '("\\.v\\'" . verilog-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.vh\\'" . verilog-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.tb\\'" . verilog-mode) auto-mode-alist))
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(add-hook 'verilog-mode-hook '(lambda () (setq indent-tabs-mode nil) (font-lock-mode 1)))
(setq verilog-indent-level             2 ; indent level 2 (default:4)
      verilog-indent-level-module      2
      verilog-indent-level-declaration 2
      verilog-indent-level-behavioral  2
      verilog-indent-level-directive   2
      verilog-case-indent              2 
      verilog-auto-newline             nil
      verilog-auto-indent-on-newline   t
      verilog-tab-always-indent        t
      verilog-auto-endcomments         nil
      verilog-minimum-comment-distance 40
      verilog-indent-begin-after-if    t
      verilog-auto-lineup              nil)
(font-lock-add-keywords
 'verilog-mode
 '(("\\(\\<[1-9][0-9_]*\\)?'h[0-9_a-fxz]+\\>" . font-lock-string-face)   
   ("\\(\\<[1-9][0-9_]*\\)?'d[0-9_xz]+\\>"    . font-lock-string-face)   
   ("\\(\\<[1-9][0-9_]*\\)?'o[0-7_xz]+\\>"    . font-lock-string-face)   
   ("\\(\\<[1-9][0-9_]*\\)?'b[01_xz]+\\>"     . font-lock-string-face)   
   ("\\<[0-9][0-9_]*\\>"                      . font-lock-string-face)))
