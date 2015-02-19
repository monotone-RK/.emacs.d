;; counter-measures to voiced sound isolation when copy & paste from preview(mac's app)
;; correct voiced sound isolation by ucs-normalize-NFC-region
;; correct voiced sound isolation within entire buffer 
;; by typing M-x ucs-normalize-NFC-buffer or "C-x RET u" 
;; Reference
;; http://d.hatena.ne.jp/nakamura001/20120529/1338305696 
;; http://www.sakito.com/2010/05/mac-os-x-normalization.html
(require 'ucs-normalize)
(prefer-coding-system 'utf-8-hfs)
(setq file-name-coding-system 'utf-8-hfs)
(setq locale-coding-system 'utf-8-hfs)
(defun ucs-normalize-NFC-buffer ()
  (interactive)
  (ucs-normalize-NFC-region (point-min) (point-max))
  )
(global-set-key (kbd "C-x RET u") 'ucs-normalize-NFC-buffer)
