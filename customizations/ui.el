;; These customizations change the way emacs looks and disable/enable
;; some user interface elements. Some useful customizations are
;; commented out, and begin with the line "CUSTOMIZE". These are more
;; a matter of preference and may require some fiddling to match your
;; preferences

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)
;; Turn of the tool bar at the top of the each frame because it's distracting
(tool-bar-mode -1)

(setq-default cursor-type 'bar) ;;make cursor a line
;; No cursor blinking, it's distracting
(blink-cursor-mode 0)
(set-cursor-color "#ffffff")

;;default starting emacs size
;; (add-to-list 'default-frame-alist '(height . 90))
;; (add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(height . 65))
(add-to-list 'default-frame-alist '(width . 100))


;; Color Themes
;; Read http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
;; for a great explanation of emacs color themes.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; for a more technical explanation.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
;;(load-theme 'spacemacs-dark t)
;;(zerodark-setup-modeline-format)
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; Show line numbers
(global-linum-mode)

;; Chnage the font to Operator Mono
(set-face-attribute 'default nil :font "IBM Plex Mono") ;;default font
;; increase font size for better readability
(set-face-attribute 'default nil :height 160)
(set-face-attribute 'fringe nil :background nil)

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it
;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 177) (height . 53)))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)


(global-prettify-symbols-mode +1)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)

(require 'magit)
(define-key global-map (kbd "C-c m") 'magit-status)

;; load the all-the-icons prior to loading neotree
;; (require 'all-the-icons)
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(global-set-key [f9] 'neotree-dir)
;;(setq neo-theme (if (display-graphic-p) 'ascii 'ascii))
;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

(defun text-scale-twice ()(interactive)(progn(text-scale-adjust 0)(text-scale-decrease 1)))
(add-hook 'neo-after-create-hook (lambda (_)(call-interactively 'text-scale-twice)))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;;(if (display-graphic-p)
;;     ;;smooth scrolling in gui
;;      (use-package smooth-scrolling
;;        :ensure t
;;        :init (smooth-scrolling-mode 1)
;;        :diminish smooth-scrolling-mode
;;        :config
;;        (setq smooth-scroll-margin 1)
;;        (smooth-scrolling-mode 1)))

;; Turn ^L into nice <hr>
(use-package page-break-lines
  
  :ensure t
  :diminish page-break-lines-mode
  :config
  (global-page-break-lines-mode t)
)

