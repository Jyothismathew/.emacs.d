;; javascript / html
;;better javascript + jsx
(use-package rjsx-mode
  :defer
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))

;;better javascript + jsx
(use-package json-mode
  :defer
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.ejs\\'" . json-mode))
