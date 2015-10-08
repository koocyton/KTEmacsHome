
;;_+ 用户资料设定
(setq user-full-name "koocyton")
(setq user-mail-address "koocyton@gmail.com")

;;_+ 当有问题出现显示错误信息，便于调试 
;;(setq debug-on-error t)

;;_+ 可执行文件的路径
(setq exec-path '("~/lisp/cscope"
	"C:/Program Files/Java/jdk1.7.0_15/bin"
	"D:/Developer/php5.4_x86"
	"D:/Developer/mysql-5.6.17-winx64/bin"
	"c:/windows/system32"
	"c:/windows"))
(setenv "PATH" (mapconcat 'identity exec-path path-separator))

;;_+ 禁用启动信息 
(setq inhibit-startup-message t) 

;;_+ 关闭烦人的出错时的提示声 
;; (setq visible-bell nil)
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;;_+ 把title设置为“文件名@LC's Emacs"
(setq show-date (format-time-string "%Y年%m月%d日 %A"))
(setq frame-title-format
	'("" show-date "   [ "(buffer-file-name "%f"
		(dired-directory dired-directory "%b"))" ] "))

;;_+ 光标靠近鼠标的时候，让鼠标自动让开，别挡住视线
;; (mouse-avoidance-mode 'animate)

;;_+ 下面的这个设置可以让光标指到某个括号的时候显示与它匹配的括号 
(show-paren-mode t) 
(setq show-paren-style 'parentheses) 

;;_+ 设置缺省模式是text，而不是基本模式 
(setq default-major-mode 'text-mode) 
(add-hook 'text-mode-hook 'turn-on-auto-fill) 

;;_+ 设置tab为4个空格的宽度，而不是原来的2 
(setq default-tab-width 4) 

;;_+ don't hide DOS lineendings (^M):
(setq inhibit-eol-conversion nil)

;;_+ highlight query
(defconst query-replace-highlight t)

;;_+ 防止页面滚动时跳动 
(setq scroll-step 0 
	  scroll-margin 0 
	  scroll-conservatively 10000) 

;;_+
(setq ansi-color-for-comint-mode t)

;;_+ 所有的备份文件转移到~/backups目录下 
(setq backup-directory-alist (quote (("." . "~/backups")))) 
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/backups")))
(setq backup-by-copying t)

;;_+ 不产生备份文件 
;;(setq make-backup-files nil) 

;;_+ 设置自动换行
(setq hscroll-margin 1)
(setq hscroll-step 1)

;;_+ 设置kill-ring-max(我不知道怎么翻译这个词：)为200，以防不测：） 
(setq kill-ring-max 500)

;;_+ 设置时间戳，标识出最后一次保存文件的时间。
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S K.T")

;;_+ 默认的日记文件
(setq diary-file "~/diary.txt")

;;_+ 设置默认工作目录 
(setq default-directory "~/") 

;;_+ 显示列号
(setq column-number-mode t)

;;_+ 设置默认的列数是123
(setq default-fill-column 123)

;;_+ 'y' for 'yes', 'n' for 'no' 
(fset 'yes-or-no-p 'y-or-n-p) 

;;_+ 让ediff不再单独出来一个窗口
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;_+ 开启图片浏览 
(require 'thumbs) 
(auto-image-file-mode t) 

;;_+ 不要 tool-bar 和 scroll-bar。
;;(scroll-bar-mode -1)
(tool-bar-mode -1)

;;_+ 不要 menu-bar。
;;(menu-bar-mode -1)

;;_+ 开启语法高亮。
(global-font-lock-mode 1) 
(set-variable 'jit-lock-stealth-time 0)
 
;;_+ 打开压缩文件时自动解压缩。
(auto-compression-mode 1)                             

;;_+ 光标不要闪烁。
;; (blink-cursor-mode -1)

;;_+ DIRED CONFIG
(require 'dired)
(require 'dired-x)
;;_+ C-x C-j                 跳转到当前文件所在目录的 dired 缓冲[x]
(global-set-key "\C-x\C-j" 'dired-jump)
(define-key dired-mode-map "b" 'dired-mark-extension)
(define-key dired-mode-map "c" 'dired-up-directory)
(define-key dired-mode-map "e" 'dired-mark-files-containing-regexp)
(define-key dired-mode-map "o" 'chunyu-dired-open-explorer)
(define-key dired-mode-map "r" 'dired-mark-files-regexp)
(define-key dired-mode-map "/" 'dired-mark-directories)
(define-key dired-mode-map "K" 'dired-kill-subdir)
(define-key dired-mode-map [(control ?/)] 'dired-undo)

(defun chunyu-dired-open-explorer ()
  (interactive)
  (let ((file-name (dired-get-file-for-visit)))
	(if (file-exists-p file-name)
		(w32-shell-execute "open" file-name nil 1))))

(setq dired-listing-switches "-avl"	;; ls 文件列表参数
	  dired-recursive-copies 'top   ;; 复制目录时，递归复制所有字目录
	  dired-recursive-deletes 'top  ;; 删除目录时，递归删除所有字目录
	  cvs-dired-use-hook 'always)   ;; 浏览 CVS 时，自动打开 pcl-cvs 界面

;;_+ 关闭shell buffer
(add-hook 'shell-mode-hook 'wcy-shell-mode-hook-func)
(defun wcy-shell-mode-hook-func  ()
  (set-process-sentinel (get-buffer-process (current-buffer))
						#'wcy-shell-mode-kill-buffer-on-exit)
  )
(defun wcy-shell-mode-kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state))
      (kill-buffer (current-buffer))))

;; dos-unix   unix-dos
(defun dos-unix () (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
(defun unix-dos () (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))

;;_+ 显示制表符号
;;(require 'blank-mode)

;;_+ 保存上次的操作记录到SESSION 
;;(add-to-list 'load-path "~/tmp") 
(require 'session) 
(add-hook 'after-init-hook 'session-initialize) 
;;_+ 有时候无法推出就是因为这个东西
(add-to-list 'session-globals-exclude 'org-mark-ring)

;;_+ 加载 desktop
(load "desktop") 
(desktop-load-default) 
(desktop-read) 

;;_+ ansi-color
(autoload 'ansi-color-apply-on-region "ansi-color")
(defun article-treat-ansi-sequences ()
  "Translate ANSI SGR control sequences into overlays or extents."
  (interactive)
  (save-excursion
    (when (article-goto-body)
      (let ((inhibit-read-only t))
        (ansi-color-apply-on-region (point) (point-max))))))
(add-hook 'gnus-part-display-hook 'article-treat-ansi-sequences)
