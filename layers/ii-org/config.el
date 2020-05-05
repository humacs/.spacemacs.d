;;;;
;; Config for org mode
;;;;
(setq
 ;; don't ask for confirmation every time you execute a code block.
 org-confirm-babel-evaluate nil
 ;; sensible (for ii) org-babel defaults
 org-babel-python-command "python3"
 ;; enable support for packages that help in org exports
 org-enable-github-support t
 org-enable-bootstrap-support t
 org-enable-reveal-js-support t
 org-enable-epub-support t
 ;; add all org files in our projects' org folder to agenda
 ;; this adds some searching and navigation super powers (try SPC aom)
 org-agenda-files '("~/apisnoop/docs")
 )
