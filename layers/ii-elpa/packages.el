;;; packages.el --- ii-elpa layer packages file for Spacemacs.
;;
;; Copyright (c) 2020 ii.coop
;;
;; Author: Hippie Hacker <hh@ii.coop>
;; URL: https://github.com/humacs/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst ii-elpa-packages
  '(
    elpa-mirror
    )
  )
(defun ii-elpa/init-elpa-mirror ()
  "This package helps create an elpa mirror based on what we install"
  (use-package elpa-mirror
    :ensure t)
    )

;;; packages.el ends here
