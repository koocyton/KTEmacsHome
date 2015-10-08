;;-*-coding:utf-8;mode:lisp-mode;-*-

;;启动emacsclient服务，然后用emacsclientw.exe打开文件就不用新开一个emacs了
(server-start)
;;退出的时候删掉server文件
(add-hook 'kill-emacs-hook
(lambda()
(if (file-exists-p "~/.emacs.d/server/server")
(delete-file "~/.emacs.d/server/server"))))

;;_+ 让emacs在windows上启动时最大化
;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 138) (height . 50)))
;;(w32-send-sys-command #xf030)
(defun w32-restore-frame () 
  "Restore a minimized frame" 
  (interactive) 
  (w32-send-sys-command 61728)) 
(defun w32-maximize-frame () 
  "Maximize the current frame" 
  (interactive) 
  (w32-send-sys-command 61488)) 
(w32-maximize-frame)
