;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; display setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; unenable to display startup page
(setq inhibit-startup-message t)

;; unenable to display menu-bar and tool-bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; frame setting 
(setq default-frame-alist
      (append (list
               ;; size, position
               '(width . 120)  ; width  (number of characters)
               '(height . 50)  ; height (number of rows)
               '(top . 0)      ; frame upper left corner (y-coordinate)
               '(left . 0)     ; frame upper left corner (x-coordinate)
               )
              default-frame-alist))

;; color up characters
(global-font-lock-mode t)
(require 'font-lock)
(if window-system (progn
;; set colors of characters
(add-to-list 'default-frame-alist '(foreground-color . "white"))
;; set background color
(add-to-list 'default-frame-alist '(background-color . "black"))
;; set the cursor's color
(add-to-list 'default-frame-alist '(cursor-color . "red"))
))

;; unenable to blink the cursor
(blink-cursor-mode 0)

;; display line number on the left side
(require 'linum)
(global-linum-mode t)
(setq linum-format "%4d ")

;; visualize region
(setq transient-mark-mode t)

;; display tab and full-width space
(defvar my-face-b-1'my-face-b-1)
(defvar my-face-b-2'my-face-b-2)
(defvar my-face-u-1'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
	("　" 0 my-face-b-2 append)
	("[ \t]+$" 0 my-face-u-1 append)
	)))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; display current row
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "gray7"))
    (((class color)
      (background light))
     (:background "gray7"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; display how many characters position of the cursor is
(column-number-mode t)

;; display file and directory name on title bar
(setq frame-title-format "%b")

;; display clock
(setq display-time-day-and-date t)
(display-time)

;; hilight brackets
(show-paren-mode t)

;; change ID of buffer when opened files' names are same
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; operating settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; wdired
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; unenable beap 
(setq visible-bell t)

;; prevent Japanese-info from unintelligible sequence of characters
(auto-compression-mode t)

;; Don't distinguish between A-Z and a-z at completion
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; move the cursor to a place that you have edited before
(load "saveplace")
(setq-default save-place t)

;; Don't make backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; delete row by typing C-k 
(setq kill-whole-line t)
