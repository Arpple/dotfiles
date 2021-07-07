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

(add-to-list 'default-frame-alist '(alpha . 95))

;; key
(map! :ni "s-F" #'+ivy/project-search
      :n "<f12>" #'+lookup/definition
      :g "C-`" nil
      :g "M-q" #'evil-force-normal-state)

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

(map! :n "s-]" #'centaur-tabs-forward
      :n "s-[" #'centaur-tabs-backward
      :n "s-s" #'save-buffer)


;; treemacs
(setq treemacs-width 30)

(after! treemacs
  (treemacs-follow-mode))


;; indium
(use-package! indium)


(add-hook! 'typescript-mode-hook
  ;; use eslint for typescript
  (flycheck-select-checker 'javascript-eslint)
  (map! :n "<f2>" #'tide-rename-symbol))


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

;; personal dir
(defun arp/dir ()
  "open .arpple dir"
  (interactive)
  (let ((dir (expand-file-name ".arpple" projectile-project-root)))
    (if (file-exists-p dir)
	(counsel-find-file dir)
	(print! "no .arpple dir created"))))


(defun arp/ansi-term-toggle ()
  "Toggle ansi-term window on and off with the same command."
  (interactive)
  (defvar my--ansi-term-name "ansi-term-popup")
  (defvar my--window-name (concat "*" my--ansi-term-name "*"))
  (cond ((get-buffer-window my--window-name)
         (ignore-errors (delete-window
                         (get-buffer-window my--window-name))))
        (t (split-window-below)
           (other-window 1)
           (cond ((get-buffer my--window-name)
                  (switch-to-buffer my--window-name))
                 (t (ansi-term "bash" my--ansi-term-name))))))

(map! :leader
      :desc "open secret .arpple dir"
      :prefix "f"
      "a" #'arp/dir)

(map! :leader
      :desc "Terminal"
      :prefix "t"
      "t" #'arp/ansi-term-toggle)

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
