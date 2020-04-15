;;; quasi-monochrome-theme.el --- High contrast quasi monochrome color theme

;; Copyright (C) 2015 Lorenzo Bolla

;; Author: Lorenzo Bolla <lbolla@gmail.com>
;; URL: https://github.com/lbolla/emacs-quasi-monochrome
;; Created: 28th July 2015
;; Version: 1.0
;; Keywords: color-theme, monochrome, high contrast
;; Package: quasi-monochhrome-theme

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation, either version 3 of the License,
;; or (at your option) any later version.

;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this file.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A high contrast quasi-monochrome color theme.

;;; Code:

(deftheme quasi-monochrome
  "quasi-monochrome emacs theme")

(defgroup quasi-monochrome-theme nil
  "quasi-monochhrome-theme customization options"
  :group 'local)

(defcustom quasi-monochrome-transparent-background nil
  "Make transparent background in terminal."
  :type 'boolean
  :group 'quasi-monochrome-theme)

(defvar quasi-monochrome-selected-window nil
  "Selected window.")

(defun quasi-monochrome--set-selected-window (&rest _)
  "Set the selected window."
  (let ((window (frame-selected-window)))
    (when (and (windowp window)
               (not (minibuffer-window-active-p window)))
      (setq quasi-monochrome-selected-window window))))

(defun quasi-monochrome--active-window-p ()
  "Return non-nil if the current window is active."
  (eq (selected-window) quasi-monochrome-selected-window))

(defun quasi-monochrome-face-when-active (face)
  "Return FACE if the window is active."
  (when (quasi-monochrome--active-window-p)
    face))

(add-hook 'window-configuration-change-hook #'quasi-monochrome--set-selected-window)
(add-hook 'focus-in-hook #'quasi-monochrome--set-selected-window)
(advice-add 'select-window :after #'quasi-monochrome--set-selected-window)
(advice-add 'select-frame  :after #'quasi-monochrome--set-selected-window)

;; TODO reduce number of color shades
;; TODO inherit from font-lock as much as possible
;; TODO quasi-monochrome light version
;; TODO ((class color) (min-colors 8))
;;   or ((class color) (type tty))
;;   -> only use: black, red, green, yellow, blue, magenta, cyan, white
;;   on ((class mono))
;;   -> only use :inverse :underline :bold etc.
(let (
      ;; TOOD fix min-colors classes (remove from below)
      ;; TODO light background, mono, tty, etc. classes
      ;; See help `defface`
      (class '((class color) (min-colors 256)))
      (tty '((class color) (type tty)))

      ;; Palette
      (qm-black (if (and quasi-monochrome-transparent-background
                         (not (display-graphic-p))
                         (eq system-type 'darwin))
                    "ARGBBB000000"
                  "black"))
      (qm-white "white")
      (qm-yellow-1 "yellow")
      (qm-yellow-2 "gold")
      (qm-yellow-3 "light yellow")
      (qm-red-1 "red")
      (qm-red-2 "red4")
      (qm-red-3 "firebrick")
      (qm-magenta "magenta")
      (qm-green-1 "forest green")
      (qm-green-2 "lime green")
      (qm-green-3 "spring green")
      (qm-green-4 "dark green")
      (qm-blue-1 "RoyalBlue3")
      (qm-gray "cyan")
      (qm-gray-1 "light gray")
      (qm-gray-2 "light slate gray")
      (qm-gray-3 "dim gray")
      (qm-gray-4 "gray20")
      (qm-gray-5 "gray15")
      (qm-gray-6 "gray30")
      (qm-gray-7 "gray50")
      (qm-gray-8 "gray55")
      (qm-gray-9 "gray10")
      (qm-gray-10 "gray5")

      ;; Org levels
      (ol1 `(:height 1.0 :weight bold))
      (ol2 `(:height 1.0))
      (ol3 `(:height 1.0 :slant italic))
      (ol4 `(:height 1.0 :slant italic))
      (ol5 `(:height 1.0 :slant italic))
      (ol6 `(:height 1.0 :slant italic))
      (ol7 `(:height 1.0 :slant italic))
      (ol8 `(:height 1.0 :slant italic)))

  (custom-theme-set-faces
   'quasi-monochrome
   `(button                              ((t (:inherit (link)))))
   `(cursor                              ((,tty (:background ,qm-yellow-1))
                                          (t (:background ,qm-yellow-1))))
   `(default                             ((t (:foreground ,qm-white :background ,qm-black))))
   `(bold                                ((,tty (:inherit (default) :weight normal :foreground ,qm-gray))
                                          (t (:inherit (default) :weight bold))))
   `(company-tooltip                     ((,tty (:foreground ,qm-white))))
   `(dired-directory                     ((t (:weight bold))))
   `(ediff-odd-diff-A                    ((t (:background ,qm-gray-6))))
   `(ediff-odd-diff-B                    ((t (:background ,qm-gray-6))))
   `(escape-glyph                        ((t (:foreground ,qm-gray-1))))
   `(fixed-pitch                         ((,tty (:foreground ,qm-gray))))
   `(flycheck-error                      ((,tty (:foreground ,qm-red-1))
                                          (t (:underline (:color ,qm-red-1 :style wave)))))
   `(flycheck-fringe-error               ((,tty (:foreground ,qm-red-1))
                                          (t (:underline (:color ,qm-red-1 :style wave)))))
   `(flycheck-warning                    ((,tty (:foreground ,qm-yellow-1))
                                          (t (:underline (:color ,qm-yellow-2 :style wave)))))
   `(flycheck-fringe-warning             ((,tty (:foreground ,qm-yellow-1))
                                          (t (:underline (:color ,qm-yellow-2 :style wave)))))
   `(flycheck-info                       ((t (:underline (:color ,qm-green-1 :style wave)))))
   `(flycheck-fringe-info                ((t (:underline (:color ,qm-green-1 :style wave)))))
   `(font-lock-builtin-face              ((,tty (:weight normal :foreground ,qm-gray))
                                          (t (:foreground ,qm-gray-1))))
   `(font-lock-comment-delimiter-face    ((t (:inherit (font-lock-comment-face)))))
   `(font-lock-comment-face              ((,tty (:foreground ,qm-blue-1))
                                          (t (:slant italic :foreground ,qm-gray-2))))
   `(font-lock-constant-face             ((,tty (:foreground ,qm-gray-1 :weight normal))
                                          (t (:foreground ,qm-gray-1 :weight bold))))
   `(font-lock-doc-face                  ((t (:inherit (font-lock-string-face)))))
   `(font-lock-function-name-face        ((t (:foreground ,qm-white))))
   `(font-lock-keyword-face              ((,tty (:weight normal :foreground ,qm-gray))
                                          (t (:weight bold :foreground ,qm-white))))
   `(font-lock-negation-char-face        ((t nil)))
   `(font-lock-preprocessor-face         ((t (:inherit (font-lock-builtin-face) :foreground ,qm-gray-2))))
   `(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
   `(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
   `(font-lock-string-face               ((,tty (:slant italic))
                                          (t (:foreground ,qm-gray-3))))
   ;; `(font-lock-type-face                 ((t (:foreground ,qm-gray-8 :weight normal))))
   ;; `(font-lock-variable-name-face        ((t (:foreground ,qm-gray-1))))
   `(font-lock-type-face                 ((,tty (:foreground ,qm-gray-8 :weight normal))
                                          (t (:foreground ,qm-gray-8 :weight bold))))
   `(font-lock-variable-name-face        ((t (:foreground ,qm-gray-8))))
   `(font-lock-warning-face              ((t (:foreground ,qm-yellow-2 :weight bold))))
   `(fringe                              ((,tty (:background ,qm-white))
                                          (t (:background ,qm-gray-4))))
   `(header-line                         ((t (:background ,qm-gray-5 :foreground ,qm-white))))
   `(help-argument-name                  ((,tty (:inherit (bold)))))
   `(highlight                           ((,tty (:inverse t))
                                          (t (:background ,qm-gray-4))))
   `(highlight-indentation-face          ((,tty (:inverse t))
                                          (t (:inherit (fringe) :background ,qm-gray-10))))
   `(hl-line                             ((,tty (:inverse-video nil))
                                          (t (:background ,qm-gray-4))))
   `(isearch                             ((t (:foreground ,qm-black :background ,qm-green-3))))
   `(isearch-fail                        ((t (:background ,qm-red-2))))
   `(lazy-highlight                      ((t (:foreground ,qm-black :background ,qm-green-2))))
   `(link                                ((t (:underline (:color foreground-color :style line) :foreground ,qm-gray-1))))
   `(link-visited                        ((t (:underline (:color foreground-color :style line) :foreground ,qm-gray-1))))
   `(lsp-ui-sideline-global              ((t (:background ,qm-gray-4))))
   `(magit-diff-added                    ((,tty (:foreground ,qm-green-1))))
   `(magit-diff-removed                  ((,tty (:foreground ,qm-red-1))))
   `(magit-diff-added-highlight          ((,tty (:foreground ,qm-green-1))))
   `(magit-diff-removed-highlight        ((,tty (:foreground ,qm-red-1))))
   `(magit-diff-hunk-heading             ((,tty (:inverse t))
                                          (t (:background ,qm-gray-4))))
   `(magit-diff-hunk-heading-highlight   ((,tty (:inverse t))
                                          (t (:background ,qm-gray-6))))
   `(magit-diff-file-heading             ((,tty (:weight bold :foreground ,qm-yellow-1 :background ,qm-black))))
   `(magit-diff-file-heading-highlight   ((,tty (:weight bold :foreground ,qm-black :background ,qm-yellow-1))))
   `(magit-hash                          ((,tty (:slant normal :foreground ,qm-red-1))
                                          (t (:foreground ,qm-gray-8))))
   `(magit-log-author                    ((,tty (:slant normal :foreground ,qm-yellow-1))
                                          (t (:foreground ,qm-gray-2))))
   `(magit-section-highlight             ((t (:background ,qm-gray-4))))
   `(magit-tag                           ((,tty (:inverse-video t :inherit (font-lock-warning-face)))
                                          (t (:inherit (font-lock-warning-face)))))

   `(Man-overstrike                      ((,tty (:inherit (bold) :foreground ,qm-red-1))))
   `(Man-underline                       ((,tty (:inherit (underline) :foreground ,qm-magenta))))
   `(markdown-header-face                ((,tty (:inherit (font-lock-function-name-face) :inverse-video t :weight normal))))
   `(match                               ((t (:background ,qm-blue-1))))
   `(minibuffer-prompt                   ((t (:weight bold :foreground ,qm-gray-1))))
   `(mode-line                           ((t (:box (:line-width 6 :color ,qm-gray-8) :foreground ,qm-black :background ,qm-gray-8 :height 0.9))))
   `(mode-line-buffer-id                 ((t (:weight bold))))
   `(mode-line-emphasis                  ((t (:weight bold))))
   `(mode-line-highlight                 ((t (:box (:line-width 2 :color ,qm-gray-2)))))
   `(mode-line-inactive                  ((,tty (:slant italic))
                                          (t (:box (:line-width 6 :color ,qm-gray-4) :foreground ,qm-black :background ,qm-gray-4 :height 0.9))))
   `(monky-diff-add                      ((t (:foreground ,qm-green-1))))
   `(mu4e-flagged-face                   ((,tty (:foreground ,qm-red-1))
                                          (t (:inherit (font-lock-constant-face) :foreground ,qm-red-3 :weight bold))))
   `(mu4e-header-face                    ((,tty (:slant italic))
                                          (t (:foreground ,qm-gray-7 :weight normal))))
   `(mu4e-header-highlight-face          ((t (:inherit (region) :weight bold :underline nil))))
   `(mu4e-header-key-face                ((t (:inherit (font-lock-type-face) :underline nil))))
   `(mu4e-header-value-face              ((t (:inherit (font-lock-warning-face) :weight normal))))
   `(mu4e-replied-face                   ((,tty (:foreground ,qm-gray))
                                          (t (:foreground ,qm-gray-8 :weight normal))))
   `(mu4e-unread-face                    ((t (:foreground ,qm-white :weight normal))))
   `(next-error                          ((t (:inherit (region)))))
   `(org-agenda-current-time             ((,tty (:foreground ,qm-gray))))
   `(org-agenda-done                     ((,tty (:slant italic))
                                          (t (:foreground ,qm-gray-7))))
   `(org-block                           ((t (:inherit (shadow) :background ,qm-gray-5))))
   `(org-block-begin-line                ((t (:inherit (org-meta-line) :background ,qm-gray-9))))
   `(org-block-end-line                  ((t (:inherit (org-meta-line) :background ,qm-gray-9))))
   `(org-block-background                ((t (:background ,qm-gray-4))))
   `(org-canc                            ((,tty (:inverse-video t :inherit (fringe)))
                                          (t (:inherit (fringe)))))
   `(org-defr                            ((,tty (:inverse-video nil :inherit (font-lock-comment-face)))
                                          (t (:inherit (font-lock-comment-face)))))
   `(org-delg                            ((,tty (:inverse-video nil :foreground ,qm-gray))
                                          (t (:inherit (font-lock-comment-face)))))
   `(org-done                            ((,tty (:inverse-video t :foreground ,qm-green-1 :weight bold))
                                          (t (:foreground ,qm-green-1 :weight bold))))
   `(org-level-1                         ((t ,ol1)))
   `(org-level-2                         ((t ,ol2)))
   `(org-level-3                         ((t ,ol3)))
   `(org-level-4                         ((t ,ol4)))
   `(org-level-5                         ((t ,ol5)))
   `(org-level-6                         ((t ,ol6)))
   `(org-level-7                         ((t ,ol7)))
   `(org-level-8                         ((t ,ol8)))
   `(org-meet                            ((t (:foreground ,qm-gray-7))))
   `(org-mode-line-clock                 ((t (:slant italic :weight bold))))
   `(org-mode-line-clock-overrun         ((t (:inherit (font-lock-warning-face) :slant italic :weight bold))))
   `(org-scheduled                       ((,tty (:foreground ,qm-white))
                                          (t (:foreground ,qm-gray-1 :weight normal))))
   `(org-scheduled-previously            ((,tty (:foreground ,qm-gray))
                                          (t (:foreground ,qm-gray-7 :weight normal))))
   `(org-scheduled-today                 ((,tty (:foreground ,qm-white))
                                          (t (:foreground ,qm-gray-1 :weight normal))))
   `(org-strt                            ((,tty (:inverse-video t :foreground ,qm-yellow-1))
                                          (t (:inherit (font-lock-keyword-face)))))
   `(org-time-grid                       ((,tty (:slant italic))
                                          (t (:foreground ,qm-gray-7 :weight normal))))
   `(org-todo                            ((,tty (:inverse-video nil :weight bold :foreground ,qm-white))
                                          (t (:foreground ,qm-gray-7))))
   `(org-wait                            ((t (:inherit (font-lock-warning-face)))))
   `(query-replace                       ((t (:inherit (isearch)))))
   `(region                              ((t (:foreground ,qm-black :background ,qm-yellow-2))))
   `(secondary-selection                 ((t (:background ,qm-gray-5))))
   `(shadow                              ((t (:foreground ,qm-gray-8))))
   `(tooltip                             ((t (:inherit (variable-pitch) :foreground ,qm-black :background ,qm-yellow-3))))
   `(trailing-whitespace                 ((t (:background ,qm-red-3))))

   `(woman-bold                          ((,tty (:inherit (bold) :foreground ,qm-red-1))))
   `(woman-italic                        ((,tty (:inherit (underline) :foreground ,qm-magenta)))))

  (defface quasi-monochrome-ok-face
    `((t :foreground ,qm-green-4 :weight bold))
    "Face for ok status in the mode-line.")

  (defface quasi-monochrome-warning-face
    `((t :foreground ,qm-black :weight bold))
    "Face for warning status in the mode-line.")

  (defface quasi-monochrome-error-face
    `((t :foreground ,qm-red-2 :weight bold))
    "Face for error status in the mode-line.")

  (defun quasi-monochrome-modeline-flycheck-status ()
    "Return the status of flycheck to be displayed in the mode-line."
    (when (bound-and-true-p flycheck-mode)
      (let* ((text (pcase flycheck-last-status-change
                     (`finished (if flycheck-current-errors
                                    (let ((count (let-alist (flycheck-count-errors flycheck-current-errors)
                                                   (+ (or .warning 0) (or .error 0)))))
                                      ;; (propertize (format "✖ %s Issue%s" count (if (eq 1 count) "" "s"))
                                      (propertize (format "× %s Issue%s" count (if (eq 1 count) "" "s"))
                                                  'face (quasi-monochrome-face-when-active 'quasi-monochrome-error-face)))
                                  ;; (propertize "✔ No Issues"
                                  (propertize "✓ No Issues"
                                              'face (quasi-monochrome-face-when-active 'quasi-monochrome-ok-face))))
                     ;; (`running     (propertize "⟲ Running"
                     (`running     (propertize "↻ Running"
                                               'face (quasi-monochrome-face-when-active 'quasi-monochrome-warning-face)))
                     ;; (`no-checker  (propertize "⚠ No Checker"
                     (`no-checker  (propertize "! No Checker"
                                               'face (quasi-monochrome-face-when-active 'quasi-monochrome-warning-face)))
                     (`not-checked "✖ Disabled")
                     ;; (`errored     (propertize "⚠ Error"
                     (`errored     (propertize "! Error"
                                               'face (quasi-monochrome-face-when-active 'quasi-monochrome-error-face)))
                     ;; (`interrupted (propertize "⛔ Interrupted"
                     (`interrupted (propertize "· Interrupted"
                                               'face (quasi-monochrome-face-when-active 'quasi-monochrome-error-face)))
                     (`suspicious  ""))))
        (propertize text
                    'help-echo "Show Flycheck Errors"
                    'local-map (make-mode-line-mouse-map
                                'mouse-1 #'flycheck-list-errors))))))

;;;###autoload
(defun quasi-monochrome-setup-modeline-format ()
  "Setup the mode-line format for quasimonochrome.  Inspired by quasi-monochrome."
  (interactive)
  (setq-default mode-line-format
                `("%e"
                  mode-line-front-space
                  mode-line-mule-info
                  mode-line-client
                  mode-line-modified
                  mode-line-remote
                  mode-line-frame-identification
                  mode-line-buffer-identification
                  "   "
                  mode-line-position
                  evil-mode-line-tag
                  (vc-mode vc-mode)
                  "  "
                  (:eval (quasi-monochrome-modeline-flycheck-status))
                  "  "
                  mode-line-modes
                  mode-line-misc-info
                  mode-line-end-spaces)))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'quasi-monochrome)

;;; quasi-monochrome-theme.el ends here
