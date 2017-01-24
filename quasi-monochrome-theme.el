;;; quasi-monochrome-theme.el --- High contrast quasi monochrome color theme

;; Copyright (C) 2015 Lorenzo Bolla

;; Author: Lorenzo Bolla <lbolla@gmail.com>
;; URL: https://github.com/lbolla/emacs-quasi-monochrome
;; Created: 28th July 2015
;; Version: 1.0
;; Keywords: color-theme, monochrome, high contrast

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
      (qm-yellow-3 "lightyellow")
      (qm-red-1 "red")
      (qm-red-2 "red4")
      (qm-red-3 "firebrick")
      (qm-green-1 "forest green")
      (qm-green-2 "lime green")
      (qm-green-3 "spring green")
      (qm-blue-1 "RoyalBlue3")
      (qm-gray-1 "light gray")
      (qm-gray-2 "light slate gray")
      (qm-gray-3 "dim gray")
      (qm-gray-4 "gray20")
      (qm-gray-5 "gray15")
      (qm-gray-6 "gray30")
      (qm-gray-7 "gray50")
      (qm-gray-8 "gray60")

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
   `(cursor                              ((t (:background ,qm-yellow-1))))
   `(default                             ((t (:foreground ,qm-gray-1 :background ,qm-black))))
   `(bold                                ((t (:inherit (default) :weight bold))))
   `(ediff-odd-diff-A                    ((t (:background ,qm-gray-6))))
   `(ediff-odd-diff-B                    ((t (:background ,qm-gray-6))))
   `(escape-glyph                        ((t (:foreground ,qm-gray-1))))
   `(flycheck-error                      ((t (:underline (:color ,qm-red-1 :style wave)))))
   `(flycheck-warning                    ((t (:underline (:color ,qm-yellow-2 :style wave)))))
   `(flycheck-info                       ((t (:underline (:color ,qm-green-1 :style wave)))))
   `(font-lock-builtin-face              ((t (:foreground ,qm-gray-1))))
   `(font-lock-comment-delimiter-face    ((t (:inherit (font-lock-comment-face)))))
   `(font-lock-comment-face              ((,tty (:foreground "cyan"))
                                          (t (:slant italic :foreground ,qm-gray-2))))
   `(font-lock-constant-face             ((t (:weight bold :foreground ,qm-gray-1))))
   `(font-lock-doc-face                  ((t (:inherit (font-lock-string-face)))))
   `(font-lock-function-name-face        ((t (:foreground ,qm-white))))
   `(font-lock-keyword-face              ((,tty (:foreground "blue"))
                                          (t (:weight bold :foreground ,qm-white))))
   `(font-lock-negation-char-face        ((t nil)))
   `(font-lock-preprocessor-face         ((t (:inherit (font-lock-builtin-face)))))
   `(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
   `(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
   `(font-lock-string-face               ((,tty (:foreground "magenta"))
                                          (t (:foreground ,qm-gray-3))))
   `(font-lock-type-face                 ((t (:foreground ,qm-gray-1 :weight bold))))
   `(font-lock-variable-name-face        ((t (:foreground ,qm-gray-1))))
   `(font-lock-warning-face              ((t (:foreground ,qm-yellow-2 :weight bold))))
   `(fringe                              ((t (:background ,qm-gray-4))))
   `(header-line                         ((t (:background ,qm-gray-5 :foreground ,qm-white))))
   `(highlight                           ((t (:background ,qm-gray-4))))
   `(hl-line                             ((t (:background ,qm-gray-4))))
   `(isearch                             ((t (:foreground ,qm-black :background ,qm-green-3))))
   `(isearch-fail                        ((t (:background ,qm-red-2))))
   `(lazy-highlight                      ((t (:foreground ,qm-black :background ,qm-green-2))))
   `(link                                ((t (:underline (:color foreground-color :style line) :foreground ,qm-gray-1))))
   `(link-visited                        ((t (:underline (:color foreground-color :style line) :foreground ,qm-gray-1))))
   `(magit-diff-hunk-heading             ((t (:background ,qm-gray-4))))
   `(magit-diff-hunk-heading-highlight   ((t (:background ,qm-gray-6))))
   `(magit-hash                          ((t (:foreground ,qm-gray-8))))
   `(magit-log-author                    ((t (:foreground ,qm-gray-2))))
   `(magit-section-highlight             ((t (:background ,qm-gray-4))))
   `(magit-tag                           ((t (:inherit font-lock-warning-face))))
   `(match                               ((t (:background ,qm-blue-1))))
   `(minibuffer-prompt                   ((t (:weight bold :foreground ,qm-gray-1))))
   `(mode-line                           ((t (:box nil :foreground ,qm-black :background ,qm-gray-8))))
   `(mode-line-buffer-id                 ((t (:weight bold))))
   `(mode-line-emphasis                  ((t (:weight bold))))
   `(mode-line-highlight                 ((t (:box (:line-width 2 :color ,qm-gray-2)))))
   `(mode-line-inactive                  ((,tty (:background "black" :foreground "white"))
                                          (t (:background ,qm-gray-4 :foreground ,qm-black :box nil))))
   `(monky-diff-add                      ((t (:foreground ,qm-green-1))))
   `(mu4e-flagged-face                   ((t (:inherit font-lock-constant-face :foreground ,qm-red-3 :weight bold))))
   `(mu4e-header-face                    ((t (:foreground ,qm-gray-7 :weight normal))))
   `(mu4e-header-highlight-face          ((t (:inherit region :weight bold :underline nil))))
   `(mu4e-header-key-face                ((t (:inherit font-lock-type-face :underline nil))))
   `(mu4e-header-value-face              ((t (:inherit font-lock-warning-face :weight normal))))
   `(mu4e-replied-face                   ((t (:foreground ,qm-gray-8 :weight normal))))
   `(mu4e-unread-face                    ((t (:foreground ,qm-white :weight normal))))
   `(next-error                          ((t (:inherit (region)))))
   `(org-agenda-done                     ((t (:foreground ,qm-gray-7))))
   `(org-done                            ((t (:foreground ,qm-green-1 :weight bold))))
   `(org-level-1                         ((t ,ol1)))
   `(org-level-2                         ((t ,ol2)))
   `(org-level-3                         ((t ,ol3)))
   `(org-level-4                         ((t ,ol4)))
   `(org-level-5                         ((t ,ol5)))
   `(org-level-6                         ((t ,ol6)))
   `(org-level-7                         ((t ,ol7)))
   `(org-level-8                         ((t ,ol8)))
   `(org-scheduled-previously            ((t (:foreground ,qm-gray-7 :weight normal))))
   `(org-scheduled-today                 ((t (:weight normal))))
   `(org-scheduled                       ((t (:weight normal))))
   `(org-time-grid                       ((t (:foreground ,qm-gray-7 :weight normal))))
   `(org-todo                            ((,tty (:foreground "green"))
                                          (t (:foreground ,qm-gray-7))))
   `(query-replace                       ((t (:inherit (isearch)))))
   `(region                              ((t (:foreground ,qm-black :background ,qm-yellow-2))))
   `(secondary-selection                 ((t (:background ,qm-gray-5))))
   `(shadow                              ((t (:foreground ,qm-gray-8))))
   `(tooltip                             ((t (:inherit (variable-pitch) :foreground ,qm-black :background ,qm-yellow-3))))
   `(trailing-whitespace                 ((t (:background ,qm-red-3))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list
   'custom-theme-load-path
   (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'quasi-monochrome)

;;; quasi-monochrome-theme.el ends here
