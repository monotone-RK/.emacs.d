;; With either c/c++-clang or c/c++-gcc, and then with c/c++-cppcheck
(add-hook 'c++-mode-hook 'flycheck-mode)

;; With csslint, stylelint
(add-hook 'css-mode-hook 'flycheck-mode)

;; Checking syntax for CUDA C/C++ using the nvcc nvcc compiler bundled in the NVIDIA Toolkit.
(add-hook 'cuda-mode-hook 'flycheck-mode)

;; with emacs-lisp and then with emacs-lisp-checkdoc
(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)

;; Flycheck checks Go with the following checkers:
;; 1. go-gofmt
;; 2. go-golint
;; 3. go-vet
;; 4. go-build or go-test
;; 5. go-errcheck
;; 6. go-unconvert
;; 7. go-staticcheck
(add-hook 'go-mode-hook 'flycheck-mode)

;; With markdownlint-cli, markdownlint
(add-hook 'gfm-mode-hook 'flycheck-mode)

;; With Tidy HTML5
(add-hook 'html-mode-hook 'flycheck-mode)

;; With lua-luacheck, falling back to lua
(add-hook 'lua-mode-hook 'flycheck-mode)

;; Checking Python with python-flake8 or python-pylint, and falls back to python-pycompile if neither of those is available.
(add-hook 'python-mode-hook 'flycheck-mode)

;; Flycheck checks various shell scripting languages:
;; - Bash with sh-bash and sh-shellcheck
;; - POSIX shell (i.e. /bin/sh) with sh-posix-dash or sh-posix-bash
;; - Zsh with sh-zsh
(add-hook 'sh-mode-hook 'flycheck-mode)

;; With nagelfar
(add-hook 'tcl-mode-hook 'flycheck-mode)

;; ;; With verilator
;; (add-hook 'verilog-mode-hook 'flycheck-mode)

;; With ghdl
(add-hook 'vhdl-mode-hook 'flycheck-mode)

;; with xml-xmlstarlet or xml-xmllint
(add-hook 'nxml-mode-hook 'flycheck-mode)

;; With tex-lacheck
(add-hook 'yatex-mode-hook 'flycheck-mode)
