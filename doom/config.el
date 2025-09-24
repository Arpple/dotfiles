;;; .doom.d/config.el -*- lexical-binding: t; -*-

(setq shell-file-name (executable-find "bash"))

;; style
(setq display-line-numbers-type 'relative
      doom-font (font-spec :family "SauceCodeProNerdFontMono" :size 17 :weight 'bold)
      doom-theme 'doom-molokai-custom
      doom-modeline-indent-info t
      tab-width 2
      line-spacing 1)

;; Japanese font
(set-fontset-font t 'japanese-jisx0208 (font-spec :family "HackGen"))

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

(map! :leader
      ;; spacemacs style double space execute command
      :desc "execute command"
      "SPC" #'execute-extended-command

      :desc "explorer"
      "e" #'+treemacs/toggle)


;; centaur tabs
(setq centaur-tabs-set-bar 'under
 centaur-tabs-modified-marker "!"
 centaur-tabs-excluded-prefixes (list "*" "Treemacs Update"))

;; key
(map! :n "s-s" #'save-buffer)

;; evil-snipe
(after! evil-snipe
  (setq evil-snipe-scope 'whole-buffer))

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

;; gleam
;; (use-package gleam-mode :load-path "~/utils/gleam-mode")

;; clojure
(add-hook 'clojure-mode-hook
      (lambda ())
      (custom-set-variables)
      '(font-lock-doc-face ((t (:foreground "yellow")))))

;; (use-package! corfu
;;   :config
;;   (setq completion-styles '(orderless-initialism basic))
;;   (map! :i "C-SPC" #'completion-at-point))  ;; Bind Ctrl + Space in insert mode

;; debugger
(use-package! dap-mode
  :after lsp-mode
  :config
  (dap-auto-configure-mode)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (dap-ui-controls-mode 1)

  (require 'dap-gdb-lldb)

  (map! :leader
        (:prefix-map ("d" . "debug")
         :desc "Debug" "d" #'dap-debug
         :desc "Breakpoint toggle" "b" #'dap-breakpoint-toggle
         :desc "Step over (Next)" "n" #'dap-next
         :desc "Step into" "i" #'dap-step-in
         :desc "Continue" "c" #'dap-continue
         :desc "Disconnect (Quit)" "q" #'dap-disconnect)))

(setq! vterm-shell "/usr/bin/fish")

;; C
;; (use-package! eglot
;;   :config
;;   (setq eglot-ignored-server-capabilities '(:inlayHintProvider)))

;; (set-eglot-client! 'c-mode '("clangd"
;;                              "--background-index"
;;                              "--header-insertion=never"
;;                              "--completion-style=detailed"
;;                              "--fallback-style=llvm"
;;                              "--function-arg-placeholders=0"))

(after! lsp-clangd
  (setq lsp-clients-clangd-args '("--header-insertion=never"
                                  "--background-index"
                                  "--function-arg-placeholders=0")))

;; zig
(after! lsp-mode
  (setq lsp-zig-zig-lib-path "/usr/lib/zig"))

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property pos 'read-face-name)
                  (get-char-property pos 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(after! treesit
  (setq treesit-font-lock-level 4))

(after! zig-ts-mode
  (setq zig-ts-mode-indent-offset 2))

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
