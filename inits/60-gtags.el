;; GNU Global
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         ;; (local-set-key "\M-t" 'gtags-find-tag)
         ;; (local-set-key "\M-r" 'gtags-find-rtag)
         ;; (local-set-key "\M-s" 'gtags-find-symbol)
         ;; (local-set-key "\C-t" 'gtags-pop-stack)
	 (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
	 (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
	 (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
	 (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)
         ))

;; (setq gtags-select-mode-hook
;;       '(lambda ()
;; 	 (local-set-key "\C-m" 'gtags-select-tag)
;; 	 ))

(add-hook 'c-mode-common-hook
          '(lambda()
             (gtags-mode 1)
             (gtags-make-complete-list)
             ))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
