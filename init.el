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

;; tern auto complete
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; init.el ends here
