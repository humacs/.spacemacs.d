(defconst ii-pairing-packages
  `(
   ;; Currently not working, but would be nice to make it work
   ;; (lockstep
   ;; :ensure t
   ;; :location ,(concat
   ;;             (configuration-layer/get-layer-local-dir 'ii-pairing)
   ;;             "lockstep")
   ;; :commands (lockstep lockstep-popup)
   ;; )
  ))
;; This appears to no longer work, but the idea looks interesting
;; (defun ii-pairing/init-lockstep ()
;;   (require 'lockstep)
;;   )
