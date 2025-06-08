(setq gc-cons-threshold #x40000000)
(setq read-process-output-max (* 1024 1024 4))
(setq package-enable-at-startup nil)
(setq auto-save-file-name-transforms
 '((".*" "~/.emacs.d/.cache/autosave/" t)))
(setq backup-directory-alist '((".*" . "~/.emacs.d/.cache/backup")))
(make-directory "~/.emacs.d/.cache/backup" t)
(make-directory "~/.emacs.d/.cache/autosave" t)
(set-face-attribute
 'default nil :family "JetBrainsMono Nerd Font"  :height 160)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode 1)
(windmove-default-keybindings)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(use-package dashboard
  :straight t
  :config
  (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
  (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t)
  (setq dashboard-startup-banner "~/.emacs.d/doom.png")
  )

(use-package doom-themes
  :ensure t
  :straight t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (nerd-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package consult
  :ensure t
  :straight t
  :defer t
  :init
  ;; Enhance register preview with thin lines and no mode line.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult for xref locations with a preview feature.
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref))

(use-package undo-tree
  :defer t
  :ensure t
  :straight t
  :hook
  (after-init . global-undo-tree-mode)
  :init
  (setq undo-tree-visualizer-timestamps t
        undo-tree-visualizer-diff t
          undo-limit 800000
        undo-strong-limit 12000000 
        undo-outer-limit 120000000)
  :config
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/.cache/undo"))))

(use-package evil
  :ensure t
  :straight t
  :defer t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
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
  (evil-define-key 'normal 'global (kbd "<leader> x x") 'vterm)
  (evil-define-key 'normal 'global (kbd "<leader> w") 'save-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> ;") 'dashboard-open)
  (evil-define-key 'normal 'global (kbd "<leader> q") 'evil-quit)

  ;; Keybindings for searching and finding files.
  (evil-define-key 'normal 'global (kbd "<leader> t f") 'consult-find)
  (evil-define-key 'normal 'global (kbd "<leader> t g") 'consult-grep)
  (evil-define-key 'normal 'global (kbd "<leader> t r") 'consult-ripgrep)
  (evil-define-key 'normal 'global (kbd "<leader> t h") 'consult-info)
  (evil-define-key 'normal 'global (kbd "<leader> /") 'consult-line)
  )

(use-package evil-surround
  :ensure t
  :straight t
  :config
  (global-evil-surround-mode 1))

(use-package evil-collection
  :defer t
  :straight t
  :ensure t
  :init
  (evil-collection-init))

(use-package treesit-auto
  :ensure t
  :straight t
  :after emacs
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode t))

(use-package flycheck
  :straight t
  :init (global-flycheck-mode))

(use-package flycheck-clj-kondo
  :straight t)

(use-package clojure-mode
  :straight t
  :config
  (require 'flycheck-clj-kondo))

(use-package cider
  :defer t
  :straight t
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
  :straight t
  :defer t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package paredit
  :straight t
  :defer t
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
    (add-hook 'clojure-mode-hook 'paredit-mode)
    (add-hook 'clojurescript-mode-hook 'paredit-mode)
    (add-hook 'clojurec-mode-hook 'paredit-mode)
    (add-hook 'cider-repl-mode-hook 'paredit-mode)))

(use-package all-the-icons
  :ensure t
  :straight t)

(use-package doom-modeline
  :ensure t
  :straight t
  :init (doom-modeline-mode 1))

(use-package vterm
  :straight t
  :ensure t)

(use-package markdown-mode
  :defer t
  :straight t
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)           
  :init (setq markdown-command "multimarkdown"))
