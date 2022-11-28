;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; style
(setq display-line-numbers-type 'relative
      doom-font (font-spec :family "Source Code Pro for Powerline" :size 17 :weight 'bold)
      doom-theme 'doom-molokai
      doom-modeline-indent-info t
      tab-width 2)

(custom-set-faces!
  '(hl-line :background "#353535")
  '(hl-fill-column-face :background "#ee7600")
  )

(setq-default tab-width 2
	      indent-tabs-mode t
	      fill-column 100)

(add-to-list 'default-frame-alist '(alpha . 98))

;; key
(map! :ni "s-F" #'+ivy/project-search
      :n "<f12>" #'+lookup/definition
      :g "C-`" nil
      :g "M-q" #'evil-force-normal-state
      :n "M-h" #'centaur-tabs-backward
      :n "M-l" #'centaur-tabs-forward)

(map! :leader
      :desc "next buffer"
      "]" #'evil-next-buffer)

(map! :leader
      :desc "prev buffer"
      "[" #'evil-prev-buffer)

;; spacemacs style double space execute command
(map! :leader
      :desc "execute command"
      "SPC" #'execute-extended-command)


;; centaur tabs
(setq centaur-tabs-set-bar 'under
      centaur-tabs-modified-marker "!")

(map! :n "M-]" #'centaur-tabs-forward
      :n "M-[" #'centaur-tabs-backward
      :n "s-s" #'save-buffer)


;; treemacs
(setq treemacs-width 30)

(defface custom-line-highlight '((t (:background "#353535" :extend t))) "")
(add-hook
 'treemacs-mode-hook
 (defun channge-hl-line-mode ()
   (setq-local hl-line-face 'custom-line-highlight)
   (overlay-put hl-line-overlay 'face hl-line-face)
   (treemacs--setup-icon-background-colors)))

(after! treemacs
  (treemacs-follow-mode))


;; indium
(use-package! indium)


(add-hook! 'typescript-mode-hook
  ;; use eslint for typescript
  ;; (flycheck-select-checker 'javascript-eslint)
  (map! :n "<f2>" #'tide-rename-symbol)
  (setq js-indent-level 1))


;; open default file when switch project
(defvar project-file nil)
(put 'project-file 'safe-local-variable t)

(setq +workspaces-switch-project-function
      (lambda (dir)
	(let ((default-directory dir))
	  (hack-dir-local-variables-non-file-buffer)
	  (if (bound-and-true-p project-file)
	      (find-file (expand-file-name project-file dir))
	      (doom-project-find-file dir)))))


;; elixir
(after! alchemist
  (set-lookup-handlers! 'alchemist-mode :async t
    :definition #'alchemist-goto-definition-at-point
    :documentation #'alchemist-help-search-at-point))

;; Enable format and iex reload on save
(after! lsp
  (add-hook 'elixir-mode-hook
	    (lambda ()
	      (add-hook 'after-save-hook 'alchemist-iex-reload-module))))

;; elm
(setq elm-mode-hook '(elm-indent-simple-mode))

;; clojure
;; forward word search to treat kebab-case word as single word
;; (with-eval-after-load 'evil
;;   (defalias #'forward-evil-word #'forward-evil-symbol)
;;   (setq-default evil-symbol-word-search t))

;; personal dir
(defun arp/dir ()
  "open .arpple dir"
  (interactive)
  (let ((dir (expand-file-name ".arpple" projectile-project-root)))
    (if (file-exists-p dir)
	(counsel-find-file dir)
	(print! "no .arpple dir created"))))


(map! :leader
      :desc "open secret .arpple dir"
      :prefix "f"
      "a" #'arp/dir)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.  ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elixir-atom-face ((t (:inherit font-lock-constant-face :foreground "#BD63C5"))))
 '(font-lock-comment-face ((t (:foreground "yellow" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#BD63C5"))))
 '(font-lock-function-name-face ((t (:foreground "#A6FF2E"))))
 '(font-lock-variable-name-face ((t (:foreground "#3BDAAF"))))
 '(hl-fill-column-face ((t (:background "#ee7600"))))
 '(hl-line ((t (:background "#353535"))))
 '(treemacs-git-ignored-face ((t (:foreground "gray45"))))
 '(treemacs-git-untracked-face ((t (:inherit (variable-pitch font-lock-doc-face) :foreground "chartreuse1")))))
