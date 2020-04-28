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
(defconst ii-org-capture-packages
  '(
    ;; (org-capture-pop-frame)
    (org-protocol
     :ensure t
     :location built-in)
    (org-protocol-capture-html
     :ensure t
     :location (recipe
                :fetcher github
                :repo "alphapapa/org-protocol-capture-html"
                :commit "23a1336")
     :config (progn
               (message "org-protocol-capture-html LOADED")
               )
     ))
)
(defun ii-org-capture/init-org-protocol ()
  (use-package org-protocol)
  )
(defun ii-org-capture/init-org-protocol-capture-html ()
  (use-package org-protocol-capture-html)
  )
(defun window-system-name()
  (cond ((eq system-type 'gnu/linux) (if (display-graphic-p) "x"   "nox"))
        ;; ((eq system-type 'darwin)    (if (display-graphic-p) "mac" "nox"))
        (t (error "Unsupported window-system") nil)))
;; (defun ii-org-capture/init-org-capture-pop-frame ()
;;   (let  ((display (window-system-name)))
;;     (if (not  (string= display "nox"))
;;         (use-package org-capture-pop-frame))))

(setq-default
 org-capture-templates
 '(
   ;; oc-H
   ;; javascript:location.href = 'org-protocol://capture-html?template=w&url=' + encodeURIComponent(location.href) + '&title=' + encodeURIComponent(document.title || "[untitled page]") + '&body=' + encodeURIComponent(function () {var html = ""; if (typeof document.getSelection != "undefined") {var sel = document.getSelection(); if (sel.rangeCount) {var container = document.createElement("div"); for (var i = 0, len = sel.rangeCount; i < len; ++i) {container.appendChild(sel.getRangeAt(i).cloneContents());} html = container.innerHTML;}} else if (typeof document.selection != "undefined") {if (document.selection.type == "Text") {html = document.selection.createRange().htmlText;}} var relToAbs = function (href) {var a = document.createElement("a"); a.href = href; var abs = a.protocol + "//" + a.host + a.pathname + a.search + a.hash; a.remove(); return abs;}; var elementTypes = [['a', 'href'], ['img', 'src']]; var div = document.createElement('div'); div.innerHTML = html; elementTypes.map(function(elementType) {var elements = div.getElementsByTagName(elementType[0]); for (var i = 0; i < elements.length; i++) {elements[i].setAttribute(elementType[1], relToAbs(elements[i].getAttribute(elementType[1])));}}); return div.innerHTML;}());
   ("w" "Default template" entry
    (file+headline "~/org/inbox.org" "Inbox")
    "* %^{Title}

  Source: %u, %c

  %i" :empty-lines 1)
   ("t" "TODO"
    entry (file+headline "~/org/inbox.org" "Todo")
    "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n"
    )
   ;; oc-p (paragraph)
   ;; javascript:location.href='org-protocol://capture?template=p&url='+ encodeURIComponent(location.href)+'&title='+ encodeURIComponent(document.title)+'&body='+encodeURIComponent(window.getSelection())
   ("p" "Paragraph" entry
    (file+headline "~/org/inbox.org" "Web")
    "* [[%:link][%:description]] %^G
Time: %u
 #+BEGIN_QUOTE
%:initial
#+END_QUOTE


%?")
   ;; oc-L
   ;; javascript:location.href='org-protocol://capture?template=L&url='+ encodeURIComponent(location.href)+'&title='+ encodeURIComponent(document.title)+'?body='+encodeURIComponent(window.getSelection())
   ("L" "Capture a Link" entry
    (file+headline "~/org/inbox.org" "Links")
    "* %? [[%:link][%:description]]
Captured On: %U")
   ;; o-sl (org-store-link)... insert later with ,il
   ;; javascript:location.href='org-protocol://store-link?url='+ encodeURIComponent(location.href)+'&title='+ encodeURIComponent(document.title);

   ("C" "Capture OS Capture" entry
    (file+headline "~/org/inbox.org" "Links")
    "* %? [[%:link][%:description]]
Captured On: %U")
   )
 )
;;; packages.el ends here
