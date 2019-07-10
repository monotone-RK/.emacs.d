(mapc
 (lambda (hook)
   (add-hook hook 'flyspell-prog-mode))
 '(
   c++-mode-hook
   css-mode-hook
   cuda-mode-hook
   emacs-lisp-mode-hook
   go-mode-hook
   gfm-mode-hook
   html-mode-hook
   lua-mode-hook
   python-mode-hook
   sh-mode-hook
   tcl-mode-hook
   verilog-mode-hook
   vhdl-mode-hook
   nxml-mode-hook
   ))
(mapc
 (lambda (hook)
   (add-hook hook
             '(lambda () (flyspell-mode 1))))
 '(
   yatex-mode-hook
   bibtex-mode-hook
   ))
