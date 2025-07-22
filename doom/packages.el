;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)
;
;;;; Code:
(package! fish-mode)
(package! treemacs :pin "76807bef3c128aca33064228a80c5e6937a67b8c")
(package! aider :recipe (:host github :repo "tninja/aider.el"))
(package! screenshot :recipe (:host github :repo "tecosaur/screenshot"))


;;; packages.el ends here
