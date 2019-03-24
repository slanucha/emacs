;; Startup
(package-initialize)
(setq use-package-always-ensure t)

;; Personal Information
(setq user-full-name "Szymon Lanucha"
      user-mail-address "slanucha@outlook.com")

;; Additional package sources
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t))

;; Nyan Cat :3 
(add-to-list 'load-path "~/.emacs.packages/nyan-mode")
(require 'nyan-mode)
(nyan-mode)

;; Use-Package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

;; Backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; History
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; Sentences end with a single space
(setq sentence-end-double-space nil)

;; Whitespace mode
(global-whitespace-mode 1)
(setq whitespace-style (quote (face spaces tabs space-mark tab-mark)))

;; Autocomplete
(use-package company
  :config (add-hook 'prog-mode-hook 'company-mode))

;; Custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (cmake-mode company use-package spacemacs-theme auto-compile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:inherit default :background "gray17" :foreground "MediumOrchid3")))))
 
;; Display and theme options
(unless (package-installed-p 'spacemacs-theme)
  (package-install 'spacemacs-theme))
(load-theme 'spacemacs-dark)
(global-display-line-numbers-mode)
(tool-bar-mode -1)
(menu-bar-mode -1)
(display-time-mode 1)
