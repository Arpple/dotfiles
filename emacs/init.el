;; use-package
(require 'use-package-ensure) ;; Load use-package-always-ensure
(setq use-package-always-ensure t) ;; Always ensures that a package is installed

(setq package-archives '(("melpa" . "https://melpa.org/packages/") ;; Sets default package repositories ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/"))) ;; For Eat Terminal

(setq package-quickstart t) ;; For blazingly fast startup times, this line makes startup miles faster

(defun open-note-file ()
  "Open the ~/temp.md file"
  (interactive)
  (find-file "~/temp.md"))

(defun kill-other-buffers ()
  "Kill all buffers but the current one.
  Doesn't mess with special buffers (buffers not associated with a file)."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer))
                (not (buffer-file-name buffer)))
      (kill-buffer buffer))))

(defun unindent-region-or-line ()
  "Unindent the selected region or the current line by one tab width."
  (interactive)
  (let ((beg (if (use-region-p) (region-beginning) (line-beginning-position)))
        (end (if (use-region-p) (region-end) (line-end-position))))
    (indent-rigidly beg end (- tab-width))))

;; defaults
(use-package emacs
  :custom
  (menu-bar-mode nil)         ;; Disable the menu bar
  (scroll-bar-mode nil)       ;; Disable the scroll bar
  (tool-bar-mode nil)         ;; Disable the tool bar
  ;;(inhibit-startup-screen t)  ;; Disable welcome screen

  (delete-selection-mode t)   ;; Select text and delete it by typing.
  (electric-indent-mode t)  ;; Turn off the weird indenting that Emacs does by default.
  (electric-indent-inhibit t)  ;; Turn off the weird indenting that Emacs does by default.
  (electric-pair-mode t)      ;; Turns on automatic parens pairing

  (blink-cursor-mode nil)     ;; Don't blink cursor
  (global-auto-revert-mode t) ;; Automatically reload file and show changes if the file has changed

  ;;(dired-kill-when-opening-new-dired-buffer t) ;; Dired don't create new buffer
  ;;(recentf-mode t) ;; Enable recent file mode

  (global-visual-line-mode nil)           ;; Enable truncated lines
  (display-line-numbers-type 'relative) ;; Relative line numbers
  (global-display-line-numbers-mode t)  ;; Display line numbers
  ;; (truncate-lines t)

  (mouse-wheel-progressive-speed nil) ;; Disable progressive speed when scrolling
  (scroll-margin 8)

  (indent-tabs-mode t)
  (tab-width 2)
  (evil-shift-width 2)

  (make-backup-files nil) ;; Stop creating ~ backup files
  (auto-save-default nil) ;; Stop creating # auto save files
  (dired-kill-when-opening-new-dired-buffer t)
  (split-height-threshold nil)
  (split-width-threshold 0)
  :hook
  (prog-mode . (lambda () (hs-minor-mode t))) ;; Enable folding hide/show globally
  :config
  ;; Move customization variables to a separate file and load it, avoid filling up init.el with unnecessary variables
  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)
  :bind (
         ([escape] . keyboard-escape-quit) ;; Makes Escape quit prompts (Minibuffer Escape)
         ;; Zooming In/Out
         ("C-+" . text-scale-increase)
         ("C--" . text-scale-decrease)
         ("<C-wheel-up>" . text-scale-increase)
         ("<C-wheel-down>" . text-scale-decrease)
         )
  )

;; evil
(use-package evil
  :init
  (evil-mode)
  :config
  (evil-set-initial-state 'eat-mode 'insert) ;; Set initial state in eat terminal to insert mode
  :custom
  (evil-want-keybinding nil)    ;; Disable evil bindings in other modes (It's not consistent and not good)
  (evil-want-C-u-scroll t)      ;; Set C-u to scroll up
  (evil-want-C-i-jump nil)      ;; Disables C-i jump
  (evil-undo-system 'undo-redo) ;; C-r to redo
  (evil-auto-indent t)
  ;; Unmap keys in 'evil-maps. If not done, org-return-follows-link will not work
  :bind
  (:map evil-motion-state-map
        ("SPC" . nil)
        ("RET" . nil)
        ("TAB" . nil))

  (:map evil-normal-state-map
        ("RET" . nil)
        ("TAB" . nil)
        ("K" . eldoc-doc-buffer)
        ("M-l" . centaur-tabs-forward)
        ("M-h" . centaur-tabs-backward)
        )

  (:map evil-insert-state-map
        ("C-SPC" . completion-at-point)
        ("TAB" . tab-to-tab-stop)
        ("<backtab>" . unindent-region-or-line)))

(use-package evil-collection
  :after evil
  :config
  ;; Setting where to use evil-collection
  (setq evil-collection-mode-list '(dired ibuffer magit corfu vertico consult info))
  (evil-collection-init))

(use-package evil-goggles
  :ensure t
  :custom
  (evil-goggles-duration 0.075) ;; default is 0.200
  :config
  (evil-goggles-mode)

  ;; optionally use diff-mode's faces; as a result, deleted text
  ;; will be highlighed with `diff-removed` face which is typically
  ;; some red color (as defined by the color theme)
  ;; other faces such as `diff-added` will be used for other actions
  (evil-goggles-use-diff-faces))

(use-package evil-commentary
  :ensure t
  :after evil
  :config
  (evil-commentary-mode 1))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; General Keybinds
(use-package general
  :config
  (general-evil-setup) ;; <- evil
  (general-def 'normal
    "g r" 'xref-find-references
    )


  ;; Set up 'C-SPC' as the leader key
  (general-create-definer start/leader-keys
    :states '(normal visual motion) ;; <- evil
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "SPC") ;; Set global leader key so we can access our keybindings from any state

  (start/leader-keys
    "TAB" '(comment-line :wk "Comment lines")
    ;;"q" '(flymake-show-buffer-diagnostics :wk "Flymake buffer diagnostic")
    "SPC" '(execute-extended-command :wk "Execute command")
    "/" '(consult-ripgrep :wk "Search with ripgrep")
    )

  (start/leader-keys
    "f" '(:ignore t :wk "File")
    "f f" '(find-file :wk "Find file")
    "f c" '((lambda () (interactive) (find-file "~/.config/emacs/init.el")) :wk "Find emacs Config")
    "f r" '(consult-recent-file :wk "Find Recent files")
    "f s" '(consult-fd :wk "File Search")
    )

  (start/leader-keys
    "s" '(:ignore t :wk "Search")
    "s f" '(consult-fd :wk "Search files with fd")
    "s g" '(consult-ripgrep :wk "Search with ripgrep")
    "s b" '(consult-line :wk "Search Buffer")
    "s i" '(consult-imenu :wk "Search Imenu buffer locations") ;; This one is really cool
    )

  (start/leader-keys
    "b" '(:ignore t :wk "Buffers & Dired")
    "b b" '(consult-buffer :wk "Switch buffer")
    "b d" '(kill-current-buffer :wk "Delete current buffer")
    "b i" '(ibuffer :wk "Ibuffer")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previous buffer")
    "b r" '(revert-buffer :wk "Reload buffer")
    "b v" '(dired :wk "Open dired")
    "b j" '(dired-jump :wk "Dired jump to current")
    "b x" '(open-note-file :wk "Note file")
    "b o" '(kill-other-buffers :wk "kill Other buffer")
    )

  (start/leader-keys
    "e" '(treemacs :wk "Explorer (Treemacs)"))

  (start/leader-keys
    "c" '(:ignore t :wk "Code")
    "c r" '(eglot-rename :wk "Rename")
    "c d" '(eldoc-doc-buffer :wk "Document")
    )

  (start/leader-keys
    "o" '(:ignore t :wk "Open")
    "o t" '(eat :wk "Terminal (Eat)")
    )

  (start/leader-keys
    "t" '(:ignore t :wk "Toggle")
    "t t" '(toggle-truncate-lines :wk "Truncate (Line wrap)")
    "t h" '(treemacs-hide-gitignored-files-mode :wk "Hidden gitignored file")
    )

  (start/leader-keys
    "g" '(:ignore t :wk "Git")
    "g g" '(magit-status :wk "Magit status")
    )

  (start/leader-keys
    "h" '(:ignore t :wk "Help") ;; To get more help use C-h commands (describe variable, function, etc.)
    "h q" '(save-buffers-kill-emacs :wk "Quit Emacs and Daemon")
    "h r" '((lambda () (interactive)
              (load-file "~/.config/emacs/init.el"))
            :wk "Reload Emacs config")
    "h v" '(helpful-variable :wk "Variable")
    "h h" '(helpful-at-point :wk "Help at point")
    "h c" '(describe-char :wk "Char")
    )

  (start/leader-keys
    "t" '(:ignore t :wk "Toggle")
    "t t" '(toggle-truncate-lines :wk "Toggle truncated lines (wrap)")
    "t l" '(display-line-numbers-mode :wk "Toggle line numbers")
    )

  (start/leader-keys
    "w" '(:ignore t :wk "Window")
    "w d" '(delete-window :wk "Delete window")
    "w h" '(evil-window-left :wk "Move left")
    "w j" '(evil-window-down :wk "Move down")
    "w k" '(evil-window-up :wk "Move up")
    "w l" '(evil-window-right :wk "Move right")
    "w v" '(evil-window-vsplit :wk "Vertical split")
    "w s" '(evil-window-split :wk "Horizontal split")
    )

  (start/leader-keys
    "q" '(:ignore t :wk "Quit")
    "q q" '(evil-quit :wk "QUIT!")
    )

  (start/leader-keys
    "p" '(:ignore t :wk "Project")
    "p a" '(treemacs-add-project-to-workspace :wk "Add to workspace")
    "p d" '(treemacs-remove-project-from-workspace :wk "Delete from workspace")
    "p p" '(projectile-switch-project :wk "open Project")
    "p f" '(projectile-find-file :wk "Find file")
    )
  )



;; Fix general.el leader key not working instantly in messages buffer with evil mode
;; (use-package emacs
;;   :ghook ('after-init-hook
;;           (lambd  xa (&rest _)
;;             (when-let ((messages-buffer (get-buffer "*Messages*")))
;;               (with-current-buffer messages-buffer
;;                 (evil-normalize-keymaps))))
;;           nil nil t)
;;   )

;; Theme
;; (use-package gruvbox-theme
;;   :config
;;   (setq gruvbox-bold-constructs t)
;;   (load-theme 'gruvbox-dark-medium t)) ;; We need to add t to trust this package

(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")
(load-theme 'arplette t)

(set-face-attribute 'default nil
                    :font "SauceCodeProNerdFontMono-13" ;; Set your favorite type of font or download JetBrains Mono
                    :weight 'bold)
;; This sets the default font on all graphical frames created after restarting Emacs.
;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
;; are not right unless I also add this method of setting the default font.

;;(add-to-list 'default-frame-alist '(font . "JetBrains Mono")) ;; Set your favorite font
(setq-default line-spacing 0.12)
(setq-default sideline-truncate nil)
(setq-default truncate-partial-width-windows nil)
(setq-default truncate-lines nil)

;; Doom Modeline
(use-package doom-modeline
  :custom
  (doom-modeline-height 25) ;; Set modeline height
  :hook (after-init . doom-modeline-mode))

;; Nerd Icons
(use-package nerd-icons
  :if (display-graphic-p))

(use-package nerd-icons-dired
  :hook (dired-mode . (lambda () (nerd-icons-dired-mode t))))

(use-package nerd-icons-ibuffer
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

;; Projectile
(use-package projectile
  :config
  (projectile-mode)
  :custom
  ;; (projectile-auto-discover nil) ;; Disable auto search for better startup times ;; Search with a keybind
  (projectile-run-use-comint-mode t) ;; Interactive run dialog when running projects inside emacs (like giving input)
  (projectile-switch-project-action #'projectile-dired) ;; Open dired when switching to a project
  (setq projectile-completion-system 'vertico)
  (projectile-project-search-path '("~/projects/" "~/work/" ("~/github" . 1)))) ;; . 1 means only search the first subdirectory level for projects

;; Eglot
(use-package eglot
  :ensure nil ;; Don't install eglot because it's now built-in
  :hook
  ((c-mode
    c++-mode ;; Autostart lsp servers for a given mode
    lua-mode
    typescript-ts-mode
    tsx-ts-mode) . eglot-ensure)
  :custom
  ;; Good default
  (eglot-events-buffer-size 0) ;; No event buffers (LSP server logs)
  (eglot-autoshutdown t);; Shutdown unused servers.
  (eglot-report-progress nil) ;; Disable LSP server logs (Don't show lsp messages at the bottom, java)
  ;; Manual lsp servers
  ;;:config
  (add-to-list 'eglot-server-programs
              `((typescript-ts-mode tsx-ts-mode) . ("typescript-langauge-server" "--stdio")))
  )

;; flymake
(use-package sideline-flymake
  :hook (flymake-mode . sideline-mode)
  :custom
  (sideline-flymake-display-mode 'line) ;; Show errors on the current line
  (sideline-backends-right '(sideline-flymake)))

;; Tree-sitter
(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (cmake "https://github.com/uyha/tree-sitter-cmake")
        (c "https://github.com/tree-sitter/tree-sitter-c")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (make "https://github.com/alemuller/tree-sitter-make")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (rust "https://github.com/tree-sitter/tree-sitter-rust")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(setq treesit-font-lock-level 4)

(defun start/install-treesit-grammars ()
  "Install missing treesitter grammars"
  (interactive)
  (dolist (grammar treesit-language-source-alist)
    (let ((lang (car grammar)))
      (unless (treesit-language-available-p lang)
        (treesit-install-language-grammar lang)))))

;; Call this function to install missing grammars
(start/install-treesit-grammars)

;; Optionally, add any additional mode remappings not covered by defaults
(setq major-mode-remap-alist
      '((yaml-mode . yaml-ts-mode)
        (sh-mode . bash-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (css-mode . css-ts-mode)
        (python-mode . python-ts-mode)
        (mhtml-mode . html-ts-mode)
        (javascript-mode . js-ts-mode)
        (json-mode . json-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (conf-toml-mode . toml-ts-mode)
        (yaml-mode . yaml-ts-mode)
        ))

;; Or if there is no built in mode
(use-package cmake-ts-mode :ensure nil :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))
(use-package go-ts-mode :ensure nil :mode "\\.go\\'")
(use-package go-mod-ts-mode :ensure nil :mode "\\.mod\\'")
(use-package rust-ts-mode :ensure nil :mode "\\.rs\\'")
(use-package typescript-ts-mode :ensure nil :mode "\\.ts\\'")
(use-package tsx-ts-mode :ensure nil :mode "\\.tsx\\'")
(use-package yaml-ts-mode
  :ensure nil
  :mode ("\\.ya?ml\\'" . yaml-ts-mode)
  :custom
  (yaml-ts-indent-offset 2)
  :config
  (add-to-list 'major-mode-remap-alist '(yaml-mode . yaml-ts-mode)))

;;-- Org Mode
(use-package org
  :ensure nil
  :custom
  (org-edit-src-content-indentation 4) ;; Set src block automatic indent to 4 instead of 2.
  (org-return-follows-link t)   ;; Sets RETURN key in org-mode to follow links
  :hook
  (org-mode . org-indent-mode) ;; Indent text
  ;; The following prevents <> from auto-pairing when electric-pair-mode is on.
  ;; Otherwise, org-tempo is broken when you try to <s TAB...
  ;;(org-mode . (lambda ()
  ;;              (setq-local electric-pair-inhibit-predicate
  ;;                          `(lambda (c)
  ;;                             (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))
  )

(use-package toc-org
  :commands toc-org-enable
  :hook (org-mode . toc-org-mode))

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode))

(use-package org-tempo
  :ensure nil
  :after org)

;;-- Terminal
(use-package eat
  :hook ('eshell-load-hook #'eat-eshell-mode))

;;-- Magit
(use-package magit
  :defer
  :custom
  (magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (magit-bury-buffer-function #'magit-restore-window-configuration)
  :config
  (define-key transient-map (kbd "<escape>") 'transient-quit-one) ;; Make escape quit magit prompts
  (defun my/magit-commit-fullframe ()
    (when (derived-mode-p 'magit-status-mode 'magit-log-mode 'magit-diff-mode)
      (delete-other-windows)))
  (add-hook 'magit-commit-mode-hook #'my/magit-commit-fullframe)
  ;; Doom-like section visibility
  (magit-add-section-hook 'magit-status-sections-hook
                          'magit-insert-unpushed-to-upstream-or-recent
                          'magit-insert-unpushed-to-pushremote t)
  )

(use-package diff-hl
  :hook ((dired-mode         . diff-hl-dired-mode-unless-remote)
         (magit-pre-refresh . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  (unless (display-graphic-p)
    (diff-hl-margin-mode))
  :init (global-diff-hl-mode))

;;-- Corfu
(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-auto-prefix 2)          ;; Minimum length of prefix for auto completion.
  (corfu-popupinfo-mode t)       ;; Enable popup information
  (corfu-popupinfo-delay 0.5)    ;; Lower popup info delay to 0.5 seconds from 2 seconds
  (corfu-separator ?\s)          ;; Orderless field separator, Use M-SPC to enter separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin
  (completion-ignore-case t)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent t)

  (corfu-preview-current nil) ;; Don't insert completion without confirmation
  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode))

(use-package nerd-icons-corfu
  :after corfu
  :init (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

;;-- Cape
(use-package cape
  :after corfu
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.  The order of the functions matters, the
  ;; first function returning a result wins.  Note that the list of buffer-local
  ;; completion functions takes precedence over the global list.

  ;; The functions that are added later will be the first in the list
  (add-hook 'completion-at-point-functions #'cape-dabbrev) ;; Complete word from current buffers
  (add-hook 'completion-at-point-functions #'cape-dict) ;; Dictionary completion
  (add-hook 'completion-at-point-functions #'cape-file) ;; Path completion
  (add-hook 'completion-at-point-functions #'cape-elisp-block) ;; Complete elisp in Org or Markdown mode
  (add-hook 'completion-at-point-functions #'cape-keyword) ;; Keyword completion

  ;;(add-hook 'completion-at-point-functions #'cape-abbrev) ;; Complete abbreviation
  ;;(add-hook 'completion-at-point-functions #'cape-history) ;; Complete from Eshell, Comint or minibuffer history
  ;;(add-hook 'completion-at-point-functions #'cape-line) ;; Complete entire line from current buffer
  ;;(add-hook 'completion-at-point-functions #'cape-elisp-symbol) ;; Complete Elisp symbol
  ;;(add-hook 'completion-at-point-functions #'cape-tex) ;; Complete Unicode char from TeX command, e.g. \hbar
  ;;(add-hook 'completion-at-point-functions #'cape-sgml) ;; Complete Unicode char from SGML entity, e.g., &alpha
  ;;(add-hook 'completion-at-point-functions #'cape-rfc1345) ;; Complete Unicode char using RFC 1345 mnemonics
  )


;;-- Orderless
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion))))
)

;;-- Vertico
(use-package vertico
  :init
  (vertico-mode)
  :bind
  (:map vertico-map
        ("C-j" . vertico-next)
        ("C-k" . vertico-previous))
  )

(savehist-mode) ;; Enables save history mode

(use-package marginalia
  :after vertico
  :init
  (marginalia-mode))

(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  :hook
  ('marginalia-mode-hook . 'nerd-icons-completion-marginalia-setup))


;;-- Consult
(use-package consult
  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :config
  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))

  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  ;; (consult-customize
  ;; consult-theme :preview-key '(:debounce 0.2 any)

  ;; consult-ripgrep consult-git-grep consult-grep
  ;; consult-bookmark consult-recent-file consult-xref
  ;; consult--source-bookmark consult--source-file-register
  ;; consult--source-recent-file consult--source-project-recent-file
  ;; :preview-key "M-."
  ;; :preview-key '(:debounce 0.4 any))

  ;; By default `consult-project-function' uses `project-root' from project.el.
  ;; Optionally configure a different project root function.
   ;;;; 1. project.el (the default)
  ;; (setq consult-project-function #'consult--default-project--function)
   ;;;; 2. vc.el (vc-root-dir)
  ;; (setq consult-project-function (lambda (_) (vc-root-dir)))
   ;;;; 3. locate-dominating-file
  ;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
   ;;;; 4. projectile.el (projectile-project-root)
  (autoload 'projectile-project-root "projectile")
  (setq consult-project-function (lambda (_) (projectile-project-root)))
   ;;;; 5. No project support
  ;; (setq consult-project-function nil)

  (define-key minibuffer-local-map (kbd "C-j") 'next-line)
  (define-key minibuffer-local-map (kbd "C-k") 'previous-line)
  (define-key minibuffer-local-filename-completion-map (kbd "C-j") #'next-line)
  (define-key minibuffer-local-filename-completion-map (kbd "C-k") #'previous-line)
  (define-key minibuffer-local-completion-map (kbd "C-j") #'next-line)
  (define-key minibuffer-local-completion-map (kbd "C-k") #'previous-line)
  (define-key completion-list-mode-map (kbd "C-j") #'next-line)
  (define-key completion-list-mode-map (kbd "C-k") #'previous-line)
  )

;;-- Help
(use-package helpful
  :bind
  ;; Note that the built-in `describe-function' includes both functions
  ;; and macros. `helpful-function' is functions only, so we provide
  ;; `helpful-callable' as a drop-in replacement.
  ("C-h f" . helpful-callable)
  ("C-h v" . helpful-variable)
  ("C-h k" . helpful-key)
  ("C-h x" . helpful-command)
  )

;;-- Which key
(use-package which-key
  :ensure nil ;; Don't install which-key because it's now built-in
  :init
  (which-key-mode 1)
  :diminish
  :custom
  (which-key-side-window-location 'bottom)
  (which-key-sort-order #'which-key-key-order-alpha) ;; Same as default, except single characters are sorted alphabetically
  (which-key-sort-uppercase-first nil)
  (which-key-add-column-padding 1) ;; Number of spaces to add to the left of each column
  (which-key-min-display-lines 6)  ;; Increase the minimum lines to display because the default is only 1
  (which-key-idle-delay 0.8)       ;; Set the time delay (in seconds) for the which-key popup to appear
  (which-key-max-description-length 25)
  (which-key-allow-imprecise-window-fit nil)) ;; Fixes which-key window slipping out in Emacs Daemon


;;-- WS Butler = remove white space
(use-package ws-butler
  :init (ws-butler-global-mode))

;; editorconfig
(use-package editorconfig
  :ensure t
  :config
  ;; Enable globally (applies to all buffers)
  (editorconfig-mode 1)
  ;; Optional: Use Emacs Lisp core for property parsing (no external binary needed)
  (setq editorconfig-get-properties-function #'editorconfig-core-get-properties-hash)
  ;; Optional: Integrate with ws-butler for trimming trailing whitespace
  (setq editorconfig-trim-whitespaces-mode 'ws-butler-mode)
  ;; Optional: For Elisp files, use default indent (avoids misalignment)
  (setq editorconfig-lisp-use-default-indent t))

;;-- hl-line
(use-package hl-line
  :ensure nil  ;; Built-in, no installation needed
  :hook
  ((prog-mode text-mode) . hl-line-mode)  ;; Enable in programming and text modes
  :config
  ;; Optional: Ensure highlight spans entire line width
  (setq hl-line-sticky-flag t)  ;; Highlight persists in inactive windows
  (setq global-hl-line-sticky-flag t))

;; optimize
;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
;; Increase the amount of data which Emacs reads from the process
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(use-package autothemer
  :ensure t)


(use-package paren-face
  :ensure t
  :hook
  ((emacs-lisp-mode lisp-mode prog-mode) . paren-face-mode)
  :config
  (setq paren-face-mode t)
  )

(use-package rainbow-mode
  :ensure t
  )

(use-package whitespace-mode
  :ensure nil
  :hook
  ((prog-mode text-mode) . whitespace-mode)
  :custom
  (whitespace-style '(face tabs tab-mark trailing))
  (whitespace-display-mappings '((tab-mark 9 [124 9] [92 9])))
  :config
  (global-whitespace-mode)
)

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-buffer-name-function            #'treemacs-default-buffer-name
          treemacs-buffer-name-prefix              " *Treemacs-Buffer-"
          treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                2000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-files-by-mouse-dragging    t
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          t
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-project-follow-into-home        nil
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      -0.1
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  )

(add-hook 'treemacs-mode-hook (lambda () (setq-local truncate-lines t)))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package eldoc
  :init
  (global-eldoc-mode))

;; === Transient (popup interface) - Doom uses level 3+
(use-package transient
  :ensure t
  :custom
  (transient-default-level 5)
  (transient-enable-popup-navigation t)
  :config
  ;; Show more commands in popups
  (transient-bind-q-to-quit))

(use-package centaur-tabs
  :demand t
  :hook
  (dired-mode . centaur-tabs-local-mode)
  (treemacs-mode . centaur-tabs-local-mode)
  (dashboard-mode . centaur-tabs-local-mode)
  :init
  (setq centaur-tabs-enable-key-bindings t)

  :config
  (setq centaur-tabs-style                "box"
        centaur-tabs-height               27
        centaur-tabs-set-icons            t
        centaur-tabs-icon-type            'nerd-icons
        centaur-tabs-gray-out-icons       'buffer
        centaur-tabs-set-bar              'under
        x-underline-at-descent-line       t
        centaur-tabs-set-modified-marker  t
        centaur-tabs-modified-marker      "•"
        centaur-tabs-label-fixed-length   25
        centaur-tabs-excluded-prefixes '("*"
                                         "magit")
        )

  ;; (centaur-tabs-group-by-projectile-project)
  (setq centaur-tabs-hide-tabs-hooks '(custom-centaur-tabs-hide-tab))

  (defun custom-centaur-tabs-hide-tab (x)
    "Do no to show buffer X in tabs."
    (let ((name (format "%s" x)))
      (or
       ;; Buffer name not match below blacklist.
       (string-prefix-p "*" name)

       ;; Is not magit buffer.
       (and (string-prefix-p "magit" name)
            (not (file-name-extension name)))
      )))

  (centaur-tabs-headline-match)
  (centaur-tabs-mode t)

  :bind
  ("C-[" . centaur-tabs-backward)
  ("C-]" . centaur-tabs-forward))

(use-package yaml-mode
  :mode ("\\.ya?ml\\'" . yaml-mode)
  :hook (yaml-mode . (lambda () (setq tab-width 2))))  ; YAML convention: 2 spaces


(load-file "~/.emacs-local.el")
