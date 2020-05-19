;;; packages.el --- ii-go layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Zach Mandeville <zz@ii.coop>
;; URL: https://github.com/humacs/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst ii-go-packages
  '(;; lsp-ui ; part of lsp layer
    ;; go-dlv ; didn't quite fit the bill
    (ob-go :location (recipe
                      :fetcher github
                      :repo "pope/ob-go")))
  "ob-go AND debugging via lsp+dap+dlv")
(defun ii-go/init-ob-go ()
  (use-package ob-go
    ;; TODO check if gi/bin is in path
    :config
    (setenv "PATH" (concat user-home-directory "go/bin:" (getenv "PATH")))
    (setq exec-path (append exec-path (list (concat user-home-directory "go/bin")))
    ))
;; (defun ii-go/init-lsp-go ()
;;   (use-package ob-go
;;     :config
;;     (setq
;;      )
;;     ;; :config
;;     ;; (setenv "PATH" (concat user-home-directory "go/bin:" (getenv "PATH")))
;;     )
  )

(defun ii-go/post-init-lsp-ui ()
  (setq go-backend #'lsp))
(defun ii-go/post-init-dap-go ()
  (dap-go-setup)
   )
(defun ii-go/post-init-lsp-layer ()
  (message "ii-go lsp-layer settings")
  (setq-default
   ;; we install to ~/go/bin
   lsp-gopls-server-path "~/go/bin/gopls"
   )
  )

;; (defun ii-go/init-go-dlv ()
;;   (use-package go-dlv
;;     ;; NOTE: for kubemacs, dlv may be in /usr/local/bin
;;     ;; :config
;;     ;; (setenv "PATH" (concat user-home-directory "go/bin:" (getenv "PATH")))
;;     ))
