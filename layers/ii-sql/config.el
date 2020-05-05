;;;;
;; Config for ii-sql
;;;;

;; Set reasonable(for ii) headers for sql-mode src blocks
(setq org-babel-default-header-args:sql-mode
      '((:results . "replace code")
        (:wrap . "SRC example")))
