(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Performance
(setq gc-cons-threshold #x40000000)
(setq read-process-output-max (* 1024 1024 4))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package flycheck
  :init (global-flycheck-mode))

(use-package flycheck-clj-kondo)

(use-package clojure-mode
  :config
  (require 'flycheck-clj-kondo))

(use-package cider
  :defer t
  :init
  (progn
    (add-hook 'clojure-mode-hook 'cider-mode)
    (add-hook 'clojurescript-mode-hook 'cider-mode)
    (add-hook 'clojurec-mode-hook 'cider-mode)
    (add-hook 'cider-repl-mode-hook 'cider-mode))
  :config
  (setq cider-repl-display-help-banner nil)
  (setq cider-auto-mode nil))

(use-package rainbow-delimiters
  :defer t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package paredit
  :defer t
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
    (add-hook 'clojure-mode-hook 'paredit-mode)
    (add-hook 'clojurescript-mode-hook 'paredit-mode)
    (add-hook 'clojurec-mode-hook 'paredit-mode)
    (add-hook 'cider-repl-mode-hook 'paredit-mode)))
