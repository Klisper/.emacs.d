;; -*- lexical-binding: t; -*-

;; 1. Package Management (Must be done first)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; 2. UI Elements & Shell
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq explicit-shell-file-name "powershell.exe")
(setq explicit-powershell.exe-args '("-NoExit" "-Command" "-"))
(setq make-backup-files nil)

;; 3. Recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 4. Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((recents . 10)
                          (bookmarks . 5))))
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

;; 5. Elcord
(use-package elcord
  :ensure t
  :config
  (elcord-mode))

;; 6. Load Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'handmade t)

;; 7. Fonts
(set-face-attribute 'default nil 
                    :font "Iosevka" 
                    :height 130 
                    :weight 'regular)
(set-face-attribute 'fixed-pitch nil 
                    :font "Iosevka" 
                    :height 1.0)

;; 8. UI Fixes (Mode-line and Fringes)
;; These are now AFTER the theme loads so they actually apply.
(set-face-attribute 'fringe nil :background (face-background 'default))

(set-face-attribute 'mode-line nil
                    :background "#2b2b2b" 
                    :foreground "#a0a0a0"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :background "#1e1e1e"
                    :foreground "#505050"
                    :box nil)

;; 9. Custom variables (Cleaned up to remove the Adwaita override)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 '(package-selected-packages '(dashboard elcord)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 )