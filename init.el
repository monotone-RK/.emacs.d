(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'cl)

(defvar installing-package-list
  '(
    init-loader
    popwin
    auto-highlight-symbol
    highlight-symbol
    undo-tree
    auto-complete
    fuzzy
    google-translate
    google-c-style
    cuda-mode
    php-mode
    anzu
    flycheck
    flymake
    flymake-cursor
    markdown-mode
    markdown-mode+
    gtags
    python-mode
    epc
    python-environment
    jedi
    jinja2-mode
    go-mode
    go-autocomplete
    scala-mode
    haskell-mode
    gnuplot-mode
    rainbow-delimiters
    volatile-highlights
    smartparens
    expand-region
    exec-path-from-shell
    region-bindings-mode
    multiple-cursors
    phi-search
    replace-from-region
    dirtree
    migemo
    helm
    helm-swoop
    helm-migemo
    helm-gtags
    ace-isearch
    opencl-mode
    lua-mode
    yatex
    hlinum
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
