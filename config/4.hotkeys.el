;;-*-coding:utf-8;mode:lisp-mode;-*-

;; 设置键盘
(global-set-key "\C-xk" 'kill-this-buffer)
(global-set-key "\C-xrr" 'replace-string)
(global-set-key "\C-x\:" 'goto-line)
(global-set-key [\C-tab] '(lambda ()(interactive)(insert "\t")))

;; 上滚 下滚
(defun hold-line-scroll-up()
  "Scroll the page with the cursor in the same line"
  (interactive)
  (let ((next-screen-context-lines
		 (count-lines
		  (window-start) (window-end)
		  )
		 ))
    (scroll-up)
    ))
(defun hold-line-scroll-down()
  "Scroll the page with the cursor in the same line"
  (interactive)
  (let ((next-screen-context-lines
		 (count-lines
		  (window-start) (window-end)
		  )
		 ))
    (scroll-down)
    ))
(global-set-key (kbd "M-n") 'hold-line-scroll-up)
(global-set-key (kbd "M-p") 'hold-line-scroll-down)

(global-set-key [(meta down)] (lambda (&optional n) (interactive "p") (scroll-up (or n 1))))
(global-set-key [(meta up)] (lambda (&optional n) (interactive "p") (scroll-down (or n 1))))

;;_+ 自动补全
(defun my-indent-or-complete ()
  (interactive)
  (if (looking-at "\\>")
 	  (hippie-expand nil)
	(indent-for-tab-command))
  )
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
		try-expand-dabbrev-visible
		try-expand-dabbrev-all-buffers
		try-expand-dabbrev-from-kill
		try-complete-file-name-partially
		try-complete-file-name
		try-expand-all-abbrevs
		try-expand-list
		try-expand-line
		try-complete-lisp-symbol-partially
		try-complete-lisp-symbol)
	  )
(global-set-key [(meta ?/)] 'my-indent-or-complete)

;;_+ fold
(require 'fold)