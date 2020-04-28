(defconst ii-pairing-packages
  `(
   (lockstep
   :ensure t
   :location ,(concat
               (configuration-layer/get-layer-local-dir 'ii-pairing)
               "lockstep")
   :commands (lockstep lockstep-popup)
   )
  ))
;; This appears to no longer work, but the idea looks interesting
;; (defun ii-pairing/init-lockstep ()
;;   (require 'lockstep)
;;   )
