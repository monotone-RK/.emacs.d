(load "autoinsert")
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory "~/.emacs.d/template/")
(setq auto-insert-alist
      (append
       '(
         ("\\.c" . "template.c")
         ("\\.v" . "template.v")
         ("\\.py" . "template.py")
         ("\\.tex" . "template.tex")
         )
       auto-insert-alist))
