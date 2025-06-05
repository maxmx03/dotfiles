(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Performance
(setq gc-cons-threshold #x40000000)
(setq read-process-output-max (* 1024 1024 4))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package consult
  :ensure t
  :defer t
  :init
  ;; Enhance register preview with thin lines and no mode line.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult for xref locations with a preview feature.
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref))

(use-package evil
  :ensure t
  :defer t
  :hook
  (after-init . evil-mode)
  :config
  (evil-set-undo-system 'undo-tree) ;; Uses the undo-tree package as the default undo system
  
  ;; Set the leader key to space for easier access to custom commands. (setq evil-want-leader t)
  (setq evil-leader/in-all-states t) ;; Make the leader key available in all states.
  (setq evil-want-fine-undo t) ;; Evil uses finer grain undoing steps

  ;; Define the leader key as Space
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader 'visual (kbd "SPC"))

  (evil-define-key 'normal 'global (kbd "C-e") 'evil-scroll-up)

  (evil-define-key 'normal 'global (kbd "<leader> e") 'dired)

  ;; Keybindings for searching and finding files.
  (evil-define-key 'normal 'global (kbd "<leader> t f") 'consult-find)
  (evil-define-key 'normal 'global (kbd "<leader> t g") 'consult-grep)
  (evil-define-key 'normal 'global (kbd "<leader> t r") 'consult-ripgrep)
  (evil-define-key 'normal 'global (kbd "<leader> t h") 'consult-info)
  (evil-define-key 'normal 'global (kbd "<leader> /") 'consult-line)
  )


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

(use-package all-the-icons
  :if (display-graphic-p))

(require 'doom-modeline)
(doom-modeline-mode 1)

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))
