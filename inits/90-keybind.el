;; basic
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-c\C-l" 'next-error)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-c;" 'comment-or-uncomment-region)

;; highlight-symbol
(global-set-key "\C-ch" 'highlight-symbol-at-point)
(global-set-key "\C-cg" 'highlight-symbol-remove-all)

;; undo-tree
(global-set-key "\M-/" 'undo-tree-redo)

;; google-translate
(global-set-key "\C-xt" 'google-translate-at-point)
(global-set-key "\C-xT" 'google-translate-query-translate)

;; expand-region
(global-set-key (kbd "C-,") 'er/expand-region)
(global-set-key (kbd "C-M-,") 'er/contract-region)

;; multiple-cursors
(define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
(define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
(define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)

;; phi-search
(define-key region-bindings-mode-map "s" 'phi-search)
(define-key region-bindings-mode-map "r" 'phi-search-backward)

;; replace-from-region
(define-key region-bindings-mode-map "q" 'query-replace-from-region)
(define-key region-bindings-mode-map "Q" 'query-replace)

;; helm
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)

;; helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
