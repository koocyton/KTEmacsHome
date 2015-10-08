;;_+ EMACS配色方案,菜单Tools->Color Theme 选择你需要的配色 
;;(require 'color-theme)
(color-theme-initialize)
(color-theme-gtk-ide)

;;_+ 代码折叠
(require 'fold)
(setq fold-mode-prefix-key "\C-c\C-o")
(setq fold-autoclose-other-folds nil)
(require 'fold nil t)
(when (featurep 'fold)
  (add-hook 'find-file-hook 'fold-find-file-hook t))
(global-set-key "\C-cs" 'fold-show)
(global-set-key "\C-ch" 'fold-hide)

;;_+ Load PHP mode
(require 'php-mode)

;;_+ load cscope
(add-to-list 'load-path "~/../lisp/cscope")
(require 'xcscope)

;;_+ 导出成html高亮显示
(require 'htmlize)

;;_+ 开启tabbar 
(require 'tabbar) 
(tabbar-mode)
;;(setq tabbar-buffer-groups-function 'tabbar-buffer-ignore-groups)
;;(defun tabbar-buffer-ignore-groups (buffer)
;;  "Return the list of group names BUFFER belongs to.
;; Return only one group for each buffer."
;;  (with-current-buffer (get-buffer buffer)
;;    (cond
;;     ((or (get-buffer-process (current-buffer))
;;          (memq major-mode
;;                '(comint-mode compilation-mode)))
;;      '("Process")
;;      )
;;     ((memq major-mode
;;            '(rmail-mode
;;             rmail-edit-mode vm-summary-mode vm-mode mail-mode
;;              mh-letter-mode mh-show-mode mh-folder-mode
;;              gnus-summary-mode message-mode gnus-group-mode
;;              gnus-article-mode score-mode gnus-browse-killed-mode))
;;      '("Mail")
;;      )
;;	 ((memq major-mode
;;            '(sh-mode shell-mode xml-mode text-mode php-mode html-mode jde-mode java-mode Eshell c-mode java-mode text-mode conf-mode lisp-mode javascript-mode css-mode dired-mode help-mode apropos-mode Info-mode Man-mode comint-mode compilation-mode conf-space-mode))
;;      '("Mywork")
;;      )
;;     (t
;;      (list 
;;       "default" ;; no-grouping
;;       (if (and (stringp mode-name) (string-match "[^ ]" mode-name))
;;           mode-name
;;         (symbol-name major-mode)))
;;      )
;;     )))

;;网页浏览
(setq load-path (cons "~/../lisp/emacs-w3m" load-path))
(require 'w3m-load)
;;(setq exec-path (cons "~/bin" exec-path))
(setq w3m-command (concat "w3m.exe" ""))
(setq w3m-browse-url (concat "w3m.exe" ""))
(setq w3m-find-file (concat "w3m.exe" ""))
(setq browse-url-browser-function 'w3m-browse-url)
;(setq w3m-local-find-file-function nil)
;;; Allow browsing of local files:
(setq w3m-dirlist-cgi-program "~/../lisp/emacs-w3m/bin/dirlist.cgi")
;;; causes the return key to submit a form
(setq w3m-use-form t)
(setq w3m-use-mule-ucs t)
(setq w3m-use-toolbar t)  
(setq w3m-use-cookies t)
(setq w3m-display-inline-image t)
;(setq w3m-bookmark-file-coding-system 'chinese-iso-8bit)
;(setq w3m-coding-system 'chinese-iso-8bit)
;(setq w3m-default-coding-system 'chinese-iso-8bit)
;(setq w3m-file-coding-system 'chinese-iso-8bit)
;(setq w3m-file-name-coding-system 'chinese-iso-8bit)
;(setq w3m-terminal-coding-system 'chinese-iso-8bit)
;(setq w3m-input-coding-system 'chinese-iso-8bit)
;(setq w3m-output-coding-system 'chinese-iso-8bit)
(setq w3m-tab-width 4)
(setq w3m-fill-column 120);;设置浏览窗的宽度,1024*768的就用这个设置吧
(setq w3m-home-page "~/index.html")
(setq w3m-view-this-url-new-session-in-background t)
;(require 'mime-w3m) 不知道怎么用，包含就出错，抄来的
(add-hook 'w3m-fontify-after-hook 'remove-w3m-output-garbages)
(defun remove-w3m-output-garbages ()
      (interactive)
      (let ((buffer-read-only))
        (setf (point) (point-min))
        (while (re-search-forward "[\200-\240]" nil t)
          (replace-match " "))
        (set-buffer-multibyte t))
      (set-buffer-modified-p nil)) 
