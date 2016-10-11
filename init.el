(when (>= emacs-major-version 24)
  ;; initialize package manager
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize)

  ;; load solarized theme
  ;; original: http://ethanschoonover.com/solarized
  ;; emacs implementation: https://github.com/sellout/emacs-color-theme-solarized
  ;; my fork: https://github.com/Kaze3/emacs-color-theme-solarized
  ;; (add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized/")
  ;; (require 'color-theme-solarized)
  (load-theme 'solarized t)

  ;; automatically add matching brackets
  (electric-pair-mode 1)

  (require 'ivy)
  (ivy-mode 1)
  (global-set-key (kbd "C-s") 'swiper))

(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load custom-file))

;; (setq sml/theme 'powerline)
;; (sml/setup)
;; (set-face-attribute 'mode-line nil
;;                     :foreground "Green"
;;                     :background "DarkOrange"
;;                     :box nil)

(require 'powerline)
(powerline-default-theme)

;; auto-complete
;; http://auto-complete.org/
;; https://github.com/auto-complete/auto-complete
(ac-config-default)

;; yasnippet: https://github.com/capitaomorte/yasnippet
(yas-global-mode 1)

;; neotree: https://github.com/jaypei/emacs-neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

;; indent with spaces and set indentation levels
(setq-default indent-tabs-mode nil)
(setq tab-width 2
      js-indent-level 2
      sass-indent-offset 2)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; web-mode: http://web-mode.org/
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))

;; hooks for web-mode
(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

;; store backup and auto-save files in user dir
(setq autosave-dir "~/.emacs-backup/autosave/")
(setq backup-dir "~/.emacs-backup/backup/")
(unless (file-exists-p autosave-dir)
        (make-directory autosave-dir t))
(unless (file-exists-p backup-dir)
        (make-directory backup-dir t))
(setq backup-by-copying t
      backup-directory-alist `((".*" . ,backup-dir))
      auto-save-file-name-transforms `((".*" ,autosave-dir t)))

;; remove scrollbar, menubar, and toolbar
(menu-bar-mode -1)
(when (display-graphic-p)
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

;; highlight current line
;(global-hl-line-mode 1)

;; highlight corresponding parentheses when cursor is on one
(show-paren-mode 1)

;; highlight tabulations
(setq-default highlight-tabs t)

;; show trailing whitespace
(setq-default show-trailing-whitespace t)

;; remove useless whitespace before saving
(add-hook 'before-save-hook 'whitespace-cleanup)

;; don't show startup message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
