;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms
   '(("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'" "~/.emacs.d/autosave" t)))
 '(backup-directory-alist '(("." . "~/.emacs.d/backup")))
 '(current-language-environment "Brazilian Portuguese")
 '(custom-enabled-themes '(doom-one))
 '(custom-safe-themes
   '("0325a6b5eea7e5febae709dab35ec8648908af12cf2d2b569bedc8da0a3a81c1"
     "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
     "9b9d7a851a8e26f294e778e02c8df25c8a3b15170e6f9fd6965ac5f2544ef2a9"
     default))
 '(dashboard-center-content t)
 '(dashboard-startup-banner '("~/.emacs.d/doom.png" . ""))
 '(evil-mode t)
 '(evil-undo-system 'undo-redo)
 '(fido-mode t)
 '(global-display-line-numbers-mode t)
 '(global-tab-line-mode t)
 '(global-tree-sitter-mode t)
 '(global-treesit-auto-mode t)
 '(ido-mode 'both nil (ido))
 '(menu-bar-mode nil)
 '(package-archives
   '(("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
 '(package-enable-at-startup t)
 '(package-load-list '(all))
 '(package-selected-packages
   '(all-the-icons cider clojure-mode company consult dashboard
		   doom-modeline doom-themes evil evil-surround
		   flycheck flycheck-clj-kondo paredit
		   rainbow-delimiters treesit-auto which-key-posframe))
 '(repeat-mode t)
 '(scroll-bar-mode nil)
 '(tab-line-tabs-function 'tab-line-tabs-mode-buffers)
 '(tool-bar-mode nil)
 '(which-key-mode t)
 '(windmove-default-keybindings '([ignore] control)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#282c34" :foreground "#bbc2cf" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 158 :width normal :foundry "JB" :family "JetBrainsMono Nerd Font")))))
