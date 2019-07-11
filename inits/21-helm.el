;; helm
(when (require 'helm-config nil t)
  (helm-mode 1)

  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

  ;; Disable helm in some functions
  (add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))

  ;; Emulate 'kill-line in helm minibuffer
  (setq helm-delete-minibuffer-contents-from-point t)
  (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
    "Emulate `kill-line' in helm minibuffer"
    (kill-new (buffer-substring (point) (field-end))))

  (defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
    "Execute command only if CANDIDATE exists"
    (when (file-exists-p candidate)
      ad-do-it))

  (defadvice helm-ff-transform-fname-for-completion (around my-transform activate)
    "Transform the pattern to reflect my intention"
    (let* ((pattern (ad-get-arg 0))
           (input-pattern (file-name-nondirectory pattern))
           (dirname (file-name-directory pattern)))
      (setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
      (setq ad-return-value
            (concat dirname
                    (if (string-match "^\\^" input-pattern)
                        ;; '^' is a pattern for basename
                        ;; and not required because the directory name is prepended
                        (substring input-pattern 1)
                      (concat ".*" input-pattern)))))))


;; helm-swoop
(require 'helm-swoop)
(setq helm-swoop-pre-input-function (lambda () ""))

;; helm-migemo
(require 'helm-migemo)
(eval-after-load "helm-migemo"
  '(defun helm-compile-source--candidates-in-buffer (source)
     (helm-aif (assoc 'candidates-in-buffer source)
	 (append source
		 `((candidates
		    . ,(or (cdr it)
			   (lambda ()
			     ;; Do not use `source' because other plugins
			     ;; (such as helm-migemo) may change it
			     (helm-candidates-in-buffer (helm-get-current-source)))))
		   (volatile) (match identity)))
       source)))

;; helm-ag
(require 'helm-ag)
(when (executable-find "rg") ; if command exists
  (setq helm-ag-base-command "rg -S --vimgrep --no-heading")
  )

;; helm-flycheck
(require 'helm-flycheck) ;; Not necessary if using ELPA package
