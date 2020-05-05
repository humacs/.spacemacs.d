;;;;
;; Functions for ii-tools
;;;;

(defun ssh-find-agent ()
  "Look for a running SSH agent on the host machine, and set it as our SSH_AUTH_SOCK.
   This is useful for pushing changes to git repos using your ssh key, or for tramping in an org file to a remote machine.
   It assumes you've added an ssh-agent and, if on a remote machine, forwared it to that machine.

   For more info, see: https://www.ssh.com/ssh/agent

   This function is INTERACTIVE."
  (interactive)
  (setenv "SSH_AUTH_SOCK" (shell-command-to-string "find /tmp /run/host/tmp/ -type s -regex '.*/ssh-.*/agent..*$' 2> /dev/null | tail -n 1 | tr -d '\n'"))
  (message (getenv "SSH_AUTH_SOCK")))
