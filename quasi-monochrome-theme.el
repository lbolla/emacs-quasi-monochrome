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
;; TODO flycheck underlying
;; TODO separate by modes
;; TODO class (min-colors 88) bg dark is the one applied
(let ((class '((class color) (min-colors 256)))
      ;; Inspired by cyberpunk
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
      (qm-red-3 "RosyBrown1")
      (qm-red-4 "firebrick")
      (qm-green-1 "green")
      (qm-green-2 "lime green")
      (qm-green-3 "spring green")
      (qm-green-4 "forest green")
      (qm-blue-1 "blue")
      (qm-blue-2 "RoyalBlue3")
      (qm-gray-1 "light gray")
      (qm-gray-2 "light slate gray")  ;; TODO should this be a blue?
      (qm-gray-3 "dim gray")
      (qm-gray-4 "gray20")
      (qm-gray-5 "gray15")
      (qm-gray-6 "gray70")
      (qm-gray-7 "gray90")
      (qm-gray-8 "gray30")
      (qm-gray-9 "gray50")
      (qm-gray-10 "gray80")
      (qm-gray-11 "gray60")
      (qm-gray-12 "gray"))

  ;; TOOD fix min-colors classes (remove from below)
  ;; TODO light background, mono, tty, etc. classes
  (custom-theme-set-faces
   'quasi-monochrome
   `(button                              ((t (:inherit (link)))))
   `(cursor                              ((t (:background ,qm-yellow-1))))
   `(default                             ((t (:foreground ,qm-gray-1 :background ,qm-black))))
   `(escape-glyph                        ((t (:foreground ,qm-gray-1))))
   `(font-lock-builtin-face              ((t (:foreground ,qm-gray-1))))
   `(font-lock-comment-delimiter-face    ((t (:inherit (font-lock-comment-face)))))
   `(font-lock-comment-face              ((t (:slant italic :foreground ,qm-gray-2))))
   `(font-lock-constant-face             ((t (:weight bold :foreground ,qm-gray-1))))
   `(font-lock-doc-face                  ((t (:inherit (font-lock-string-face)))))
   `(font-lock-function-name-face        ((t (:foreground ,qm-white))))
   `(font-lock-keyword-face              ((t (:weight bold :foreground ,qm-white))))
   `(font-lock-negation-char-face        ((t nil)))
   `(font-lock-preprocessor-face         ((t (:inherit (font-lock-builtin-face)))))
   `(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
   `(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
   `(font-lock-string-face               ((t (:foreground ,qm-gray-3))))
   `(font-lock-type-face                 ((t (:weight bold :foreground ,qm-gray-1))))
   `(font-lock-variable-name-face        ((t (:foreground ,qm-gray-1))))
   `(font-lock-warning-face              ((t (:foreground ,qm-yellow-2))))
   `(fringe                              ((t (:background ,qm-gray-4))))
   `(header-line                         ((t (:inherit (mode-line)))
                                          (((type tty)) (:underline (:color foreground-color :style line) :inverse-video nil))
                                          (((class color grayscale) (background light)) (:box nil :foreground ,qm-gray-4 :background ,qm-gray-7))
                                          (((class color grayscale) (background dark)) (:box nil :foreground ,qm-gray-7 :background ,qm-gray-4))
                                          (((class mono) (background light))
                                           (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground ,qm-black :background ,qm-white))
                                          (((class mono) (background dark))
                                           (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground ,qm-white :background ,qm-black))))
   `(highlight                           ((t (:background ,qm-gray-4))))
   `(hl-line                             ((t (:background ,qm-gray-4))))
   `(isearch                             ((t (:foreground ,qm-black :background ,qm-green-3))))
   `(isearch-fail                        ((((class color) (min-colors 88) (background light)) (:background ,qm-red-3))
                                          (((class color) (min-colors 88) (background dark)) (:background ,qm-red-2))
                                          (((class color) (min-colors 16)) (:background ,qm-red-1))
                                          (((class color) (min-colors 8)) (:background ,qm-red-1))
                                          (((class color grayscale)) (:foreground ,qm-gray-12))
                                          (t (:inverse-video t))))
   `(lazy-highlight                      ((t (:foreground ,qm-black :background ,qm-green-2))))
   `(link                                ((t (:underline (:color foreground-color :style line) :foreground ,qm-gray-1))))
   `(link-visited                        ((t (:underline (:color foreground-color :style line) :foreground ,qm-gray-1))))
   `(magit-diff-hunk-heading             ((t (:background ,qm-gray-4))))
   `(magit-diff-hunk-heading-highlight   ((t (:background ,qm-gray-8))))
   `(magit-hash                          ((t (:foreground ,qm-gray-11))))
   `(magit-section-highlight             ((t (:background ,qm-gray-4))))
   `(match                               ((((class color) (min-colors 88) (background light)) (:background ,qm-yellow-1))
                                          (((class color) (min-colors 88) (background dark)) (:background ,qm-blue-2))
                                          (((class color) (min-colors 8) (background light)) (:foreground ,qm-black :background ,qm-yellow-1))
                                          (((class color) (min-colors 8) (background dark)) (:foreground ,qm-white :background ,qm-blue-1))
                                          (((type tty) (class mono)) (:inverse-video t))
                                          (t (:background ,qm-gray-12))))
   `(minibuffer-prompt                   ((t (:weight bold :foreground ,qm-gray-1))))
   `(mode-line                           ((t (:box nil :foreground ,qm-black :background ,qm-gray-10))))
   `(mode-line-buffer-id                 ((t (:weight bold))))
   `(mode-line-emphasis                  ((t (:weight bold))))
   `(mode-line-highlight                 ((((class color) (min-colors 88)) (:box nil))
                                          (t (:inherit (highlight)))))
   `(mode-line-inactive                  ((t (:background ,qm-gray-8 :foreground ,qm-black :box nil))))
   `(mu4e-flagged-face                   ((t (:inherit font-lock-constant-face :foreground ,qm-red-4 :weight bold))))
   `(mu4e-header-face                    ((t (:foreground ,qm-gray-9 :weight normal))))
   `(mu4e-header-highlight-face          ((t (:inherit region :weight bold :underline nil))))
   `(mu4e-header-key-face                ((t (:inherit font-lock-type-face :underline nil))))
   `(mu4e-header-value-face              ((t (:inherit font-lock-type-face :foreground ,qm-yellow-1))))
   `(mu4e-replied-face                   ((t (:foreground ,qm-gray-11 :weight normal))))
   `(mu4e-unread-face                    ((t (:foreground ,qm-white :weight normal))))
   `(next-error                          ((t (:inherit (region)))))
   `(org-done                            ((t (:foreground ,qm-green-4))))
   `(org-scheduled-previously            ((t (:foreground ,qm-gray-9 :weight normal))))
   `(org-scheduled-today                 ((t (:foreground ,qm-gray-10 :weight normal))))
   `(org-scheduled                       ((t (:foreground ,qm-gray-10 :weight normal))))
   `(org-todo                            ((t (:foreground ,qm-gray-8))))
   `(query-replace                       ((t (:inherit (isearch)))))
   `(region                              ((t (:foreground ,qm-black :background ,qm-yellow-2))))
   `(secondary-selection                 ((t (:background ,qm-gray-5))))
   `(shadow                              ((((class color grayscale) (min-colors 88) (background light)) (:foreground ,qm-gray-9))
                                          (((class color grayscale) (min-colors 88) (background dark)) (:foreground ,qm-gray-6))
                                          (((class color) (min-colors 8) (background light)) (:foreground ,qm-green-1))
                                          (((class color) (min-colors 8) (background dark)) (:foreground ,qm-yellow-1))))
   `(tooltip                             ((((class color)) (:inherit (variable-pitch) :foreground ,qm-black :background ,qm-yellow-3))
                                          (t (:inherit (variable-pitch)))))
   `(trailing-whitespace                 ((t (:background ,qm-red-4))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list
   'custom-theme-load-path
   (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'quasi-monochrome)

;;; quasi-monochrome-theme.el ends here
