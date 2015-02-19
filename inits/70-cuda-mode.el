;; cuda-mode
(require 'cuda-mode)
(setq auto-mode-alist
      (append
       '(
	 ("\\.cu$" . cuda-mode)
	 ("\\.cuh$" . cuda-mode)
	 )
       auto-mode-alist))
