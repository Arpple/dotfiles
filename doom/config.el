;;; .doom.d/config.el -*- lexical-binding: t; -*-

(setq shell-file-name (executable-find "bash"))

;; style
(setq display-line-numbers-type 'relative
      doom-font (font-spec :family "Source Code Pro for Powerline" :size 17 :weight 'bold)
      doom-theme 'doom-molokai-custom
      doom-modeline-indent-info t
      tab-width 2)

;; (custom-set-faces!
;;   '(hl-line :background "#353535")
;;   '(hl-fill-column-face :background "#ee7600"))

(setq-default tab-width 2
              indent-tabs-mode t
              standard-indent 2
              fill-column 100)

(add-to-list 'default-frame-alist '(alpha . 98))

(after! indent-bars
  (setq indent-bars-color '("dimgray")
        indent-bars-pattern "."
        indent-bars-width-frac 0.1
        indent-bars-pad-frac 0.1
        indent-bars-zigzag nil
        indent-bars-color-by-depth nil
        indent-bars-highlight-current-depth nil
        indent-bars-display-on-blank-lines nil))

;; key
(map! :g "C-`" nil
 :g "M-q" #'evil-force-normal-state
 :n "M-h" #'centaur-tabs-backward
 :n "M-l" #'centaur-tabs-forward)

;; spacemacs style double space execute command
(map! :leader
 :desc "execute command"
 "SPC" #'execute-extended-command)

;; centaur tabs
(setq centaur-tabs-set-bar 'under
 centaur-tabs-modified-marker "!"
 centaur-tabs-excluded-prefixes (list "*" "Treemacs Update"))

;; key
(map! :n "s-s" #'save-buffer)

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

;; typescript
(add-hook! 'typescript-mode-hook
;; use eslint for typescript
;; (flycheck-select-checker 'javascript-eslint)
 (map! :n "<f2>" #'tide-rename-symbol)
 (setq js-indent-level 'tab-width))

(add-hook! 'js-mode-hook
        (setq js-indent-level 2))

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

;; gleam
(use-package gleam-mode :load-path "~/utils/gleam-mode")
