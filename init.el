(when (>= emacs-major-version 24)
  ;; initialize package manager
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize)

  (setq monokai-background "#282C34")
  (load-theme 'monokai t)

  ;; automatically add matching brackets
  (electric-pair-mode 1)

  (require 'ivy)
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (global-set-key (kbd "\C-s") 'swiper)
  (global-set-key (kbd "\C-x \C-f") 'counsel-find-file)
  (global-set-key (kbd "\M-x") 'counsel-M-x)
)

(when (>= emacs-major-version 26)
  (global-display-line-numbers-mode))

(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load custom-file))

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

;; nginx-mode
(require 'nginx-mode)

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
(setq autosave-dir "~/.emacs/autosave")
(setq backup-dir "~/.emacs/backup")
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
(global-hl-line-mode 1)

;; highlight corresponding parentheses when cursor is on one
(show-paren-mode 1)

;; highlight tabulations
(setq-default highlight-tabs t)

;; show trailing whitespace
(setq-default show-trailing-whitespace t)

;; remove useless whitespace before saving
;; remove empty from default whitespace-style
(add-hook 'before-save-hook 'whitespace-cleanup)
(setq whitespace-style (quote
   (face tabs spaces trailing lines space-before-tab newline indentation space-after-tab space-mark tab-mark newline-mark)))

;; don't show startup message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(setq visible-bell 1)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
