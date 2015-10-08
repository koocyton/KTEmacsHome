;; -*-coding:utf-8;-*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(canlock-password "91a0b2b516e83891bd9551c6f01d5d9d211e5c36")
 '(column-number-mode t)
 '(gnus-init-file "~/.gnus.el")
 '(safe-local-variable-values (quote ((default-directory . "~/tmp/"))))
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(text-mode-hook (quote (text-mode-hook-identify))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-timestamp-face ((t (:foreground "black" :weight normal))))
 '(eshell-prompt ((t (:foreground "Black" :weight bold)))))

;;_+ 加载路径
(add-to-list 'load-path "~/lisp")

(mapc '(lambda (file)
	(load (file-name-sans-extension file)))
		(directory-files "~/config/" t "\\.el$"))
