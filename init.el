;;; init --- Ben Kinsey's emacs 24.3.1 javascript init.el file

;;; Commentary:

;;; sudo npm install -g tern jshint

;;; on ubuntu you may have to run this command to get tern to work:
;;; sudo ln -s /usr/bin/nodejs /usr/bin/node

;;; use melpa to install auto-complete, tern, and flycheck

;;; Code:

;; fullscreen mode for emacs uber-geeks.
;; you're a pro: learn the damn keyboard shortcuts already!
(tool-bar-mode -1)
(menu-bar-mode -99)
(scroll-bar-mode -1)

;; personally i like tab-width of 2
;; http://emacswiki.org/emacs/TabsAreEvil
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2) ; or any other preferred value
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(defvaralias 'js-indent-level 'tab-width)
(defvaralias 'css-indent-offset 'tab-width)

;; package manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; auto-complete
(ac-config-default)

;; tern
(add-to-list 'load-path "/usr/local/lib/node_modules/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/scss-mode-20150107.1400"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; tern auto complete
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; If use bundled typescript.el,
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(add-hook 'typescript-mode-hook
          (lambda ()
            (flycheck-mode t)))

(require 'tss)

;; Key binding
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
(setq tss-implement-definition-key "C-c i")

;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "tss")

;; Do setting recommemded configuration
(tss-config-default)

;; 10 pt font
(set-face-attribute 'default nil :height 100)

;;; init.el ends here
