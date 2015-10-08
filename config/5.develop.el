;;-*-coding:utf-8;mode:lisp-mode;-*-

;;_+ c-mode
(defun my-c-mode()
   ;; 将回车代替C-j的功能，换行的同时对齐
    (define-key c-mode-map [return] 'newline-and-indent)
    (interactive)
   ;; 设置程序的对齐风格
    (c-set-style "K&R")
   ;; 自动模式，在此种模式下当你键入{时，会自动根据你设置的对齐风格对齐
   ;; (c-toggle-auto-state)
   ;; 此模式下，当按Backspace时会删除最多的空格
    (c-toggle-hungry-state)
   ;; TAB键的宽度设置为4
    (setq c-basic-offset 4)
   ;; 在菜单中加入当前Buffer的函数索引
    (imenu-add-menubar-index)
   ;; 在状态条上显示当前光标在哪个函数体内部
    (which-function-mode)
	;; load global
	;;(gtags-mode 1)
	;;(gtags-make-complete-list)
    )
(add-hook 'c-mode-hook 'my-c-mode)

;;_+ cpp-mode
(defun my-cpp-mode()
   ;; 将回车代替C-j的功能，换行的同时对齐
    (define-key c++-mode-map [return] 'newline-and-indent)
    (interactive)
   ;; 设置程序的对齐风格
    (c-set-style "K&R")
   ;; 自动模式，在此种模式下当你键入{时，会自动根据你设置的对齐风格对齐
   ;; (c-toggle-auto-state)
   ;; 此模式下，当按Backspace时会删除最多的空格
    (c-toggle-hungry-state)
   ;; TAB键的宽度设置为4
    (setq c-basic-offset 4)
   ;; 在菜单中加入当前Buffer的函数索引
    (imenu-add-menubar-index)
   ;; 在状态条上显示当前光标在哪个函数体内部
    (which-function-mode)
	;; load global
	;;(gtags-mode 1)
	;;(gtags-make-complete-list)
    )
(add-hook 'c++-mode-hook 'my-cpp-mode)

;;_+ java-mode
;(define-key java-mode-map
;  [menu-bar java java-compile]
;  '("Java Compile" . java-compile))
;(define-key java-mode-map
;  [menu-bar java java-debug]
;  '("JAVA Debug" . java-debug))
;(define-key java-mode-map
;  [menu-bar java java-run]
;  '("JAVA Run" . java-run))
(defun java-compile ()
  (interactive)
  (shell-command
   (concat "C:/Program Files/Java/jdk1.7.0_15/bin/javac.exe \"" (buffer-file-name) "\"")))
(defun java-debug ()
  (interactive)
  (shell-command
   (concat "C:/Program Files/Java/jdk1.7.0_15/bin/javac.exe \"" (buffer-file-name) "\"")))
(defun java-run ()
  (interactive)
  (shell-command
   (concat "C:/Program Files/Java/jdk1.7.0_15/bin/java.exe \"" (buffer-file-name) "\"")))
(defun my-java-mode()
  ;; 将回车代替C-j的功能，换行的同时对齐
  (define-key java-mode-map [return] 'newline-and-indent)
  (define-key java-mode-map [(control c) (c)] 'java-compile)
  (define-key java-mode-map [(control c) (d)] 'java-debug)
  (define-key java-mode-map [(control c) (r)] 'java-run)
  (interactive)
  ;; 设置程序的对齐风格
  (c-set-style "K&R")
  ;; 自动模式，在此种模式下当你键入{时，会自动根据你设置的对齐风格对齐
  ;; (c-toggle-auto-state)
  ;; 此模式下，当按Backspace时会删除最多的空格
  (c-toggle-hungry-state)
  ;; TAB键的宽度设置为4
  (setq c-basic-offset 4)
  ;; 在菜单中加入当前Buffer的函数索引
  (imenu-add-menubar-index)
  ;; 在状态条上显示当前光标在哪个函数体内部
  (which-function-mode)
  ;; load global
  ;;(gtags-mode 1)
  ;;(gtags-make-complete-list)
  )
(add-hook 'java-mode-hook 'my-java-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . java-mode))

;;_+ php-mode
(require 'php-mode)
(define-key php-mode-map
    [menu-bar php php-debug]
    '("PHP Debug" . php-debug))
(define-key php-mode-map
    [menu-bar php php-run]
    '("Run PHP" . php-run))
(define-key php-mode-map
    [menu-bar php php-analyzer]
    '("PHP Code Analyzer" . php-analyzer))
(defun php-debug ()
   (interactive)
   (shell-command
    (concat "D:/Developer/php5.4_x86/php.exe -l \"" (buffer-file-name) "\"")))
(defun php-analyzer ()
   (interactive)
   (shell-command
    (concat "D:/Developer/php5.4_x86/ZendCodeAnalyzer.exe \"" (buffer-file-name) "\"")))
(defun php-run ()
    (interactive)
    (shell-command
     (concat "D:/Developer/php5.4_x86/php.exe \"" (buffer-file-name) "\"")))
(defun my-php-mode()
   ;; 将回车代替C-j的功能，换行的同时对齐
    (define-key php-mode-map [return] 'newline-and-indent)
    (define-key php-mode-map [(control c) (r)] 'php-run)
    (define-key php-mode-map [(control c) (d)] 'php-debug)
	(define-key php-mode-map [(control c) (z)] 'php-analyzer)
    (interactive)
   ;; 设置php程序的对齐风格
    (c-set-style "K&R")
   ;; 自动模式，在此种模式下当你键入{时，会自动根据你设置的对齐风格对齐
   ;; (c-toggle-auto-state)
   ;; 此模式下，当按Backspace时会删除最多的空格
   ;; (c-toggle-hungry-state)
   ;; TAB键的宽度设置为4
    (setq c-basic-offset 4)
   ;; 在菜单中加入当前Buffer的函数索引
   ;; (imenu-add-menubar-index)
   ;; 在状态条上显示当前光标在哪个函数体内部
   ;; (which-function-mode)
    )
(add-hook 'php-mode-hook 'my-php-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(autoload 'php-mode "php" nil t)

;;_+ javascript-mode
;;(require 'generic-x)
;(require 'javascript-mode)
;(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
;(autoload 'javascript-mode "javascript" nil t)
;(defun my-javascript-mode()
   ;; 将回车代替C-j的功能，换行的同时对齐
;   (define-key javascript-mode-map [return] 'newline-and-indent)
;   (interactive)
;  ;; 设置php程序的对齐风格
;   (c-set-style "K&R")
;  ;; 自动模式，在此种模式下当你键入{时，会自动根据你设置的对齐风格对齐
;   (c-toggle-auto-state)
;  ;; 此模式下，当按Backspace时会删除最多的空格
;   (c-toggle-hungry-state)
;  ;; TAB键的宽度设置为4
;   (setq c-basic-offset 4)
;  ;; 在菜单中加入当前Buffer的函数索引
;  (imenu-add-menubar-index)
;  ;; 在状态条上显示当前光标在哪个函数体内部
;  (which-function-mode)
;)
;(add-hook 'javascript-mode-hook 'my-javascript-mode)

;; lua-mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))