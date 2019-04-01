;;;; Startup
(package-initialize)
(setq use-package-always-ensure t)

;;;; Personal Information
(setq user-full-name "Szymon Lanucha"
      user-mail-address "slanucha@outlook.com")

;;;; Additional package sources
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t))

;;;; Nyan Cat :3 
(add-to-list 'load-path "~/.emacs.packages/nyan-mode")
(require 'nyan-mode)
(nyan-mode)

;;;; Use-Package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

;;;; Backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;;;; History
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;;;; Sentences end with a single space
(setq sentence-end-double-space nil)

;;;; Whitespace mode
(global-whitespace-mode 1)
(setq whitespace-style (quote (face spaces tabs space-mark tab-mark)))

;;;; Autocomplete
(use-package company
  :config (add-hook 'prog-mode-hook 'company-mode))

;;;; Helm config
(use-package helm
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0
          helm-input-idle-delay 0.01
          helm-yas-display-key-on-candidate t
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t)
    (helm-mode))
  :bind (("C-c h" . helm-mini)
         ("C-h a" . helm-apropos)
         ("C-x C-b" . helm-buffers-list)
         ("C-x b" . helm-buffers-list)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-x c o" . helm-occur)
         ("C-x c s" . helm-swoop)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c b" . my/helm-do-grep-book-notes)
         ("C-c p s g" . helm-projectile-grep)
         ("C-c p s a" . helm-projectile-ack)
         ("C-c p s s" . helm-projectile-ag)
         ("C-x c SPC" . helm-all-mark-rings)))

;;;; Projects
(use-package projectile
  :diminish projectile-mode
  :init
  (progn
    (setq projectile-keymap-prefix (kbd "C-c p"))
    (setq projectile-completion-system 'default)
    (setq projectile-enable-caching t)
    (setq projectile-indexing-method 'alien))
    ;;(add-to-list 'projectile-globally-ignored-files "node-modules"))
  :config
  (projectile-global-mode))
(use-package helm-projectile
  :config
  (helm-projectile-toggle 1))

;;;; Custom variables
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
    (helm-ag cmake-mode company use-package spacemacs-theme auto-compile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:inherit default :background "gray17" :foreground "MediumOrchid3")))))

;;;; Display and theme options
(unless (package-installed-p 'spacemacs-theme)
  (package-install 'spacemacs-theme))
(load-theme 'spacemacs-dark)

(global-display-line-numbers-mode)
(tool-bar-mode -1)
(menu-bar-mode -1)
(display-time-mode 1)
