;;-*-coding:utf-8;mode:lisp-mode;-*-

;; tabbar
(require 'tabbar)
(defun my-tabbar-buffer-groups ()  
  "Return the list of group names the current buffer belongs to.Return a list of one element based on major mode."  
  (list
   (cond  
    ((or (get-buffer-process (current-buffer))  
         ;; Check if the major mode derives from `comint-mode' or  
         ;; `compilation-mode'.  
         (tabbar-buffer-mode-derived-p major-mode '(comint-mode compilation-mode))
		 ) 
	 "Process")  
    ((string-equal "*" (substring (buffer-name) 0 1)) "Emacs Buffer")  
    ((eq major-mode 'dired-mode) "Dired")  
    (t "User Buffer")
	))
)
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)  
(tabbar-mode)

;; color-theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-gtk-ide)
