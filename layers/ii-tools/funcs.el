;; FUNCTIONS FOR II-TOOLS


;;;;
;; SSH Tools
;;;;
(defun ssh-find-agent ()
"Look for a running SSH agent on the host machine, and set it as our SSH_AUTH_SOCK.
This is useful for pushing changes to git repos using your ssh key, or for tramping in an org file to a remote machine.
It assumes you've added an ssh-agent and, if on a remote machine, forwarded it to that machine.

For more info, see: https://www.ssh.com/ssh/agent

This function is INTERACTIVE."
  (interactive)
  (setenv "SSH_AUTH_SOCK" (shell-command-to-string "find /tmp /run/host/tmp/ -type s -regex '.*/ssh-.*/agent..*$' 2> /dev/null | tail -n 1 | tr -d '\n'"))
  (message (getenv "SSH_AUTH_SOCK")))

;;;;
;; Stephen's weekly time tracker
;;;;

(defun iso-week-to-time (year week day)
  (pcase-let ((`(,m ,d ,y)
               (calendar-gregorian-from-absolute
                (calendar-iso-to-absolute (list week day year)))))
    (encode-time 0 0 0 d m y)))

(define-skeleton ii-timesheet-skel
  "Prompt the week and year before generating ii timesheet for the user."
  ""
  (text-mode)
  > "#+TITLE: Timesheet: Week " (setq v1 (skeleton-read "Timesheet Week? "))
  ", " (setq v2 "2020")
  " (" (getenv "USER") ")" \n
  > "#+AUTHOR: " (getenv "USER") \n
  > " " \n
  > "Please refer to the instructions in ii-timesheet.org as required." \n
  > " " \n
  > "* Week Summary" \n
  > " " _ \n
  > "#+BEGIN: clocktable :scope file :block thisweek :maxlevel 2 :emphasise t :tags t :formula %" \n
  > "#+END" \n
  > " " \n

  > "* " (format-time-string "%B %e, %Y" (iso-week-to-time (string-to-number v2) (string-to-number v1) 1)) \n
  > "** Task X" \n
  > "* " (format-time-string "%B %e, %Y" (iso-week-to-time (string-to-number v2) (string-to-number v1) 2)) \n
  > "** Task X" \n
  > "* " (format-time-string "%B %e, %Y" (iso-week-to-time (string-to-number v2) (string-to-number v1) 3)) \n
  > "** Task X" \n
  > "* " (format-time-string "%B %e, %Y" (iso-week-to-time (string-to-number v2) (string-to-number v1) 4)) \n
  > "** Task X" \n
  > "* " (format-time-string "%B %e, %Y" (iso-week-to-time (string-to-number v2) (string-to-number v1) 5)) \n
  > "** Task X" \n
  > " " \n
  (org-mode)
  (save-buffer))

(defun ii-timesheet ()
  "Create a timesheet buffer and insert skel as defined in ii-timesheet-skel.
   This function is INTERACTIVE."
  (interactive)
  (require 'cal-iso)
  (switch-to-buffer (get-buffer-create "*ii-timesheet*"))
  (ii-timesheet-skel))
