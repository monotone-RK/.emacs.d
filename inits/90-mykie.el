;; Install
(require 'mykie)
(setq mykie:use-major-mode-key-override t)
(mykie:initialize)

;; settings
; cut / copy one line
(mykie:set-keys nil
  "C-w"
  :default     (kill-region (line-beginning-position)(line-end-position))
  :region      kill-region
  "M-w"
  :default     (kill-ring-save (line-beginning-position)(line-end-position))
  :region      kill-ring-save 
  )

; move one line or multiple lines
(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1)
      )
    (forward-line -1)
    (move-to-column col)))

(defun move-region-down ()
  (interactive)
  (let ((col (current-column)))
    (kill-region (region-beginning) (region-end))
    (forward-line 1)
    (yank)
    (set-mark  (region-beginning) (region-end))
    (move-to-column col)))

(defun move-region-up ()
  (interactive)
  (let ((col (current-column)))
    (kill-region (region-beginning) (region-end))
    (forward-line -1)
    (yank)
    (set-mark (region-beginning) (region-end))
    (move-to-column col)))

(mykie:set-keys nil
  "M-P" ;; ここでキーバインドを設定 上へ移動
  :default     move-line-up
  :region      move-region-up
  "M-N" ;; ここでキーバインドを設定 下へ移動
  :default     move-line-down
  :region      move-region-down
  )
