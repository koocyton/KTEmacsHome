;;-*-coding:utf-8;mode:lisp-mode;-*-

;; Consolas
(set-face-attribute 'default nil :font "Consolas 14")

;; set font 微软雅黑
(dolist (character '(han kana symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
					character
					(font-spec :family "Microsoft YaHei" :size 16))) 
