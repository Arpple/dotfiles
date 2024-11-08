;;; doom-molokai-theme.el --- inspired by Tomas Restrepo's Molokai -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: September 15, 2016 (32f8b5ae5feb)
;; Author: Henrik Lissner <https://github.com/hlissner>
;; Maintainer:
;; Source: https://github.com/tomasr/molokai
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-molokai-theme nil
  "Options for the `doom-molokai' theme."
  :group 'doom-themes)

(defcustom doom-molokai-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-molokai-theme
  :type 'boolean)

(defcustom doom-molokai-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-molokai-theme
  :type 'boolean)

(defcustom doom-molokai-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-molokai-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-molokai-custom
  "A dark, vibrant theme inspired by Textmate's Monokai."

  ;; name        gui       256       16
  ((bg         '("#111111" "black"   "black"))
   (fg         '("#ffffff" "#dfdfdf" "brightwhite"))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#111111" "black"   "black"))
   (fg-alt     '("#555555" "#4d4d4d" "white"))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#111111" "black"   "black"))
   (base1      '("#151515" "#151515" "brightblack"))
   (base2      '("#191919" "#191919" "brightblack"))
   (base3      '("#222222" "#222222" "brightblack"))
   (base4      '("#4e4e4e" "#454545" "brightblack"))
   (base5      '("#555556" "#6b6b6b" "brightblack"))
   (base6      '("#767679" "#7b7b7b" "brightblack"))
   (base7      '("#cfc0c5" "#c1c1c1" "brightblack"))
   (base8      '("#ffffff" "#ffffff" "brightwhite"))

   (grey       '("#525254" "#515154" "brightblack"))
   (red        '("#f92672" "#e74c3c" "red"))
   (orange     '("#fd971f" "#fd971f" "brightred"))
   (green      '("#a6ff2e" "#b6e63e" "green"))
   (teal       '("#3bdaaf" "#3bdaaf" "teal"))
   (yellow     '("#e6db74" "#e2c770" "yellow"))
   (bright-yellow     '("#ffff00" "#ffff00" "brightyellow"))
   (blue       '("#268bd2" "#2686D6" "brightblue"))
   (dark-blue  '("#66d9ef" "#727280" "blue"))
   (magenta    '("#fb2874" "#fb2874" "magenta"))
   (violet     '("#9c91e4" "#9c91e4" "brightmagenta"))
   (cyan       '("#66d9ef" "#66d9ef" "brightcyan"))
   (dark-cyan  '("#8fa1b3" "#8FA1B3" "cyan"))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      orange)
   (vertical-bar   (doom-lighten bg 0.1))
   (selection      base5)
   (builtin        orange)
   (comments       (if doom-molokai-brighter-comments violet base5))
   (doc-comments   (if doom-molokai-brighter-comments
                       (doom-lighten violet 0.1)
                     (doom-lighten base5 0.25)))
   (constants      orange)
   (functions      green)
   (keywords       magenta)
   (methods        cyan)
   (operators      violet)
   (type           cyan)
   (strings        yellow)
   (variables      orange)
   (numbers        violet)
   (region         base4)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    cyan)
   (vc-added       (doom-darken green 0.15))
   (vc-deleted     red)

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg          fg)
   (modeline-fg-alt      base4)
   (modeline-bg          (if doom-molokai-brighter-modeline base4 base3))
   (modeline-bg-inactive (doom-darken (if doom-molokai-brighter-modeline
                                          base3
                                        base2)
                                      0.2))
   (org-quote `(,(doom-lighten (car bg) 0.05) "#1f1f1f"))

   (-modeline-pad
    (when doom-molokai-padded-modeline
      (if (integerp doom-molokai-padded-modeline) doom-molokai-padded-modeline 4))))


  ;;;; Base theme face overrides
  ((cursor :background magenta)
   (lazy-highlight :background violet :foreground base0 :distant-foreground base0 :bold bold)
   ((line-number &override) :foreground base5 :distant-foreground 'unspecified)
   ((line-number-current-line &override) :foreground base7 :distant-foreground 'unspecified)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color modeline-bg-inactive)))
   (isearch :foreground base0 :background green)

   ;;;; centaur-tabs
   (centaur-tabs-active-bar-face :background green)
   (centaur-tabs-modified-marker-selected :inherit 'centaur-tabs-selected :foreground green)
   (centaur-tabs-modified-marker-unselected :inherit 'centaur-tabs-unselected :foreground green)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground keywords)
   ;;;; doom-modeline
   (doom-modeline-bar :background green)
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'bold :foreground green)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)
   (doom-modeline-buffer-modified :inherit 'bold :foreground orange)
   ;;;; ediff <built-in>
   (ediff-fine-diff-A :background (doom-blend magenta bg 0.3) :weight 'bold)
   ;;;; evil
   (evil-search-highlight-persist-highlight-face :background violet)
   ;;;; evil-snipe
   (evil-snipe-first-match-face :foreground base0 :background green)
   (evil-snipe-matches-face     :foreground green :underline t)
   ;;;; flycheck
   (flycheck-error   :underline `(:style wave :color ,red)    :background base3)
   (flycheck-warning :underline `(:style wave :color ,yellow) :background base3)
   (flycheck-info    :underline `(:style wave :color ,green)  :background base3)
   ;;;; helm
   (helm-swoop-target-line-face :foreground magenta :inverse-video t)
   ;;;; ivy
   (ivy-current-match :background base3)
   (ivy-minibuffer-match-face-1 :background base1 :foreground base4)
   ;;;; markdown-mode
   (markdown-blockquote-face :inherit 'italic :foreground dark-blue)
   (markdown-list-face :foreground magenta)
   (markdown-pre-face  :foreground cyan)
   (markdown-link-face :inherit 'bold :foreground blue)
   ((markdown-code-face &override) :background (doom-lighten base2 0.045))
   ;;;; neotree
   (neo-dir-link-face   :foreground cyan)
   (neo-expand-btn-face :foreground magenta)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground magenta)
   ((outline-2 &override) :foreground orange)
   ;;;; org <built-in>
   (org-ellipsis :foreground orange)
   (org-tag :foreground yellow :bold nil)
   ((org-quote &override) :foreground base7)
   (org-todo :foreground yellow :bold 'inherit)
   (org-list-dt :foreground yellow)

   ;;;; rainbow-delimiters
   ;; (rainbow-delimiters-depth-1-face :foreground grey)
   ;; (rainbow-delimiters-depth-2-face :foreground grey)
   ;; (rainbow-delimiters-depth-3-face :foreground grey)
   ;; (rainbow-delimiters-depth-4-face :foreground grey)
   ;; (rainbow-delimiters-depth-5-face :foreground grey)
   ;; (rainbow-delimiters-depth-6-face :foreground grey)
   ;; (rainbow-delimiters-depth-7-face :foreground grey)

  ;;;; Base theme variable overrides
   (elixir-atom-face :inherit 'font-lock-constant-face)
   (font-lock-comment-face :foreground bright-yellow)
   (font-lock-constant-face :foregorund violet)
   (font-lock-function-name-face :foreground green)
   (font-lock-variable-name-face :foreground teal)
   (font-lock-operator-face :foreground orange)
   (hl-fill-column-face :background grey)
   (hl-line :background base2)
   (treemacs-git-ignore-face :foreground grey)
   (treemacs-git-untracked-face :inherit 'font-lock-doc-face :foreground "chartreuse1")

   (tree-sitter-hl-face:function.call :inherit 'font-lock-function-name-face)
   (tree-sitter-hl-face:punctuation :foreground grey)
   (tree-sitter-hl-face:punctuation.bracket :foreground grey)
   (tree-sitter-hl-face:punctuation.delimiter :foreground grey)
   (tree-sitter-hl-face:punctuation.special :inherit 'font-lock-operator-face)
   (tree-sitter-hl-face:operator :inherit 'font-lock-operator-face)
   (tree-sitter-hl-face:type.builtin :inherit 'font-lock-type-face)
   (tree-sitter-hl-face:number :inherit 'font-lock-number-face)
   (tree-sitter-hl-face:property :inherit 'font-lock-variable-name-face)
   (tree-sitter-hl-face:variable.parameter :foreground fg)
   (tree-sitter-hl-face:property.definition :inherit 'font-lock-variable-name-face)

   (clojure-keyword-face :inherit 'font-lock-builtin-face)))
;;; doom-molokai-custom-theme.el ends here
