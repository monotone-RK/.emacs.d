(require 'popwin)

(cond ((string-match "24." emacs-version) ;;; For Emacs 24
       (setq display-buffer-function 'popwin:display-buffer)
       (setq popwin:popup-window-position 'bottom)

       ;; cf: https://github.com/emacs-jp/issues/issues/2
       (setq popwin:close-popup-window-timer-interval 0.5)

       (push '("*Occur*") popwin:special-display-config))
      (t                                  ;;; Others
       (popwin-mode 1)
       (setq pop-up-windows nil)
       (setq anything-samewindow nil)
       (push '("anything" :regexp t :height 0.5) popwin:special-display-config)
       (push '("helm" :regexp t :height 0.5) popwin:special-display-config)
       (push '("*Completions*" :height 0.4) popwin:special-display-config)
       (push '("*compilation*" :height 0.4 :noselect t :stick t) popwin:special-display-config)
       (push '("*Help*" :height 0.5 :noselect t :stick t) popwin:special-display-config))
)
