;;; packages.el --- ii-yaml layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:  <zz@zz2>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `ii-yaml-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `ii-yaml/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `ii-yaml/pre-init-PACKAGE' and/or
;;   `ii-yaml/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst ii-yaml-packages
  `((openapi-yaml-mode
     :location ,(concat (configuration-layer/get-layer-local-dir 'ii-yaml) "openapi-yaml-mode")
     )
    (flycheck-swagger-tools
    :location ,(concat (configuration-layer/get-layer-local-dir 'ii-yaml) "flycheck-swagger-tools")
    )
    )
  "The list of Lisp packages required by the ii-yaml layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun ii-yaml/init-openapi-yaml-mode ()
  (use-package openapi-yaml-mode)
  )
(defun ii-yaml/init-flycheck-swagger-tools ()
(use-package flycheck-swagger-tools)
)
;; TODO needs better logic to only apply this to kubernetes manifests
(puthash :kubernetes "/*yaml" (symbol-value 'lsp-yaml-schemas))
;;; packages.el ends here
