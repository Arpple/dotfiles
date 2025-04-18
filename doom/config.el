;;; .doom.d/config.el -*- lexical-binding: t; -*-

(setq shell-file-name (executable-find "bash"))

;; style
(setq display-line-numbers-type 'relative
      doom-font (font-spec :family "Source Code Pro" :size 17 :weight 'bold)
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
;; (use-package gleam-mode :load-path "~/utils/gleam-mode")

;; clojure
(add-hook 'clojure-mode-hook
      (lambda ())
      (custom-set-variables)
      '(font-lock-doc-face ((t (:foreground "yellow")))))

;; fix fly check hook
;; (remove-hook 'doom-first-buffer-hook 'global-flycheck-mode)



;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
;;  '(warning-suppress-types '((lsp-mode) (lsp-mode) (defvaralias))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(elixir-atom-face ((t (:inherit font-lock-constant-face :foreground "#BD63C5"))))
;;  '(font-lock-comment-face ((t (:foreground "yellow" :slant italic))))
;;  '(font-lock-constant-face ((t (:foreground "#BD63C5"))))
;;  '(font-lock-function-name-face ((t (:foreground "#A6FF2E"))))
;;  '(font-lock-variable-name-face ((t (:foreground "#3BDAAF"))))
;;  '(hl-fill-column-face ((t (:background "#ee7600"))))
;;  '(hl-line ((t (:background "#353535"))))
;;  '(treemacs-git-ignored-face ((t (:foreground "gray45"))))
;;  '(treemacs-git-untracked-face ((t (:inherit (variable-pitch font-lock-doc-face) :foreground "chartreuse1"))))
;;  '(ts-fold-replacement-face ((t (:foreground unspecified :box nil :inherit font-lock-comment-face :weight light)))))
