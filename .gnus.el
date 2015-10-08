;; -*-coding:utf-8;-*-

;;服务器的设定
(setq gnus-select-method '(nntp "news.newsfan.net"))
;;(nntp "news.yaako.com"))
;;(setq gnus-secondary-select-methods '((nntp "news.cn99.com")))
;;(nnml "")))

;; 将发往新闻组的信和其它信件分开存放
(setq gnus-message-archive-group
      '((if (message-news-p)
          "nnml:sent.news"
          "nnml:sent.mail")))

;;{{{ 设置邮箱
;; stunnel.exe -d 996 -c -r pop.gmail.com:995
;; stunnel.exe -d 466 -c -r smtp.gmail.com:465
;;_+ pop
;;(setq mail-source-primary-source '(pop :user "koocyton@gmail.com" :server "127.0.0.1" :password "......" :port 996))
;;(setq mail-sources '(
					 ;;(pop :user "koocyton@gmail.com" :password "......" :server "127.0.0.1" :port 996 )
					 ;;(pop :user "koocyton" :password "......" :server "pop.163.com" :port 110 )
					 ;;(pop :user "supergirlsound@gmail.com" :password "......" :server "127.0.0.1" :port 996 )
					 ;;(pop :user "i_liuyi" :password "......" :server "pop.163.com" :port 110 )
					 ;;(pop :user "liuyi.hn@gmail.com" :password "......" :server "127.0.0.1" :port 996 )
					 ;;(pop :user "yi.liu@globalnet-inc.com" :password "......" :server "mail.globalnet-inc.com" :port 110 )
					 ;;(pop :user "emacscn@gmail.com" :password "......" :server "127.0.0.1" :port 996 )
;;					 ))
;; 确保不删除服务器上的邮件
;;(setq pop3-leave-mail-on-server t)
;;}}}

;; 每隔 20 分钟查一下信
;(setq gnus-use-demon t)
;(gnus-demon-init)
;(gnus-compile)
;(gnus-demon-add-handler 'gnus-demon-update-group-buffer 2 nil)
;(gnus-demon-add-handler 'gnus-demon-scan-mail 10 t)
;(gnus-demon-add-handler 'gnus-demon-scan-news 10 t)

;;{{{ 发帖子的时候，新开窗口
;(let* ((default
;         ;; Winodw layout for normal message frames.
;		 '(vertical
;           ((user-position . t)
;            ;;(left . -1) (top . 1)
;            (width . 100) (height . 40))
;           (message 1.0 point)))
;       (bug
;        ;; Window layout for message frames reporting bugs.
;        ;; Note that multiple gnus-bug frames are not supported.
;        '(vertical
;          ((user-position . t)
;           ;;(left . -1) (top . 1)
;           (width . 100) (height . 40))
;         (if gnus-bug-create-help-buffer '("*Gnus Help Bug*" 0.5))
;          ("*Gnus Bug*" 1.0 point)))
;       (config
;        `(frame
;          1.0
;          (if (buffer-live-p gnus-summary-buffer)
;              (if (get-buffer gnus-article-buffer)
;                  (car (cdr (assq 'article gnus-buffer-configuration)))
;                (car (cdr (assq 'summary gnus-buffer-configuration))))
;            (car (cdr (assq 'group gnus-buffer-configuration))))
;          ,default))
;       (settings '(compose-bounce forward mail-bounce message post
;                                  reply reply-yank)))
;  (while settings
;    (gnus-add-configuration (list (car settings) config))
;    (setq settings (cdr settings)))
;  (setcdr (nthcdr 2 (setq config (copy-sequence config))) (list bug))
;  (gnus-add-configuration (list 'bug config)))
;
;
;(add-hook
; 'gnus-configure-windows-hook
; (lambda nil
;  (if (eq major-mode 'message-mode)
;       (let* ((message-frame (selected-frame))
;              (delete-frame-function
;               `(lambda nil
;                  (if (and
;                       ;; Uncomment the following line if other windows
;					   ;; in message frames are supposed to be important.
;                       ;;(eq (selected-window) (next-window))
;					   (eq (selected-frame) ,message-frame))
;                      (delete-frame ,message-frame)))))
;		 (setq gnus-frame-list (delq message-frame gnus-frame-list)
;               message-exit-actions `((funcall ,delete-frame-function))
;               message-postpone-actions message-exit-actions)
;         (if (or (featurep 'xemacs)
;                 (< emacs-major-version 21))
;             (make-local-hook 'kill-buffer-hook))
;         (add-hook 'kill-buffer-hook `,delete-frame-function t t)))))
;
;;;_+ Don't popup a message frame when sending a queued message.
;(add-hook
; 'gnus-message-setup-hook
; (lambda nil
;   (if (or (memq this-command '(gnus-draft-send-message
;                                gnus-draft-send-all-messages
;                                gnus-group-send-queue))
;           (and (featurep 'gnus-delay)
;                (save-excursion
;                  (save-restriction
;                    (widen)
;                    (message-narrow-to-headers)
;                    (re-search-forward
;                     (concat "^" (regexp-quote gnus-delay-header)
;                             ":\\s-+")
;                     nil t)))))
;      (let ((config (copy-sequence gnus-buffer-configuration)))
;         (set (make-local-variable 'gnus-buffer-configuration)
;              (cons '(forward (vertical 1.0 (message 1.0 point)))
;                    (delq (assq 'forward config) config)))
;         (set (make-local-variable 'gnus-configure-windows-hook)
;              nil)))))
;;;}}}

(auto-image-file-mode)
(setq mm-inline-large-images t)
(add-to-list 'mm-attachment-override-types "image/*")

;;-------------------------------------------------------------------------------+
;;开启代理功能，为了能让gnus支持离线浏览，gnus 5.10.x会自动开启该功能。
(gnus-agentize)

;;保存有价值的帖子
;;按下 * 键，帖子就会被拷贝到本地的 cache 中保存起来
;;用 Meta-* 就可以把帖子从缓存中删掉。 
;;想查看自己保存在缓存里的帖子，在 summary buffer 中用 'Y c' 命令即可。
(setq gnus-use-cache 'passive)

;;自动换行功能，比起其他的工具要好得多。
(add-hook 'message-mode-hook
		  (lambda ()
			(setq fill-column 72) ;;这里的72是等一行到了72个字符后开始换行
			(turn-on-auto-fill)))

(setq message-cite-function 'message-cite-original-without-signature)
;;中文设置(编码变换使用数字＋g的方法)
;;(define-coding-system-alias 'gb18030 'gb2312)
;;(define-coding-system-alias 'GB18030 'gb2312)
;;(define-coding-system-alias 'gbk 'gb2312)
;; (define-coding-system-alias 'gb2312 'chinese-gb2312)
;; (define-coding-system-alias 'big5 'chinese-gb2312)
;; (define-coding-system-alias 'chinese-big5 'chinese-gb2312)
;; (define-coding-system-alias 'chinese-gb2312 'chinese-gbk)

;; 改变阅读新闻时窗口的布局
;; 默认是上下5:5分屏，又难看又不实用。
;; 方案一，窗口划分为上4下6（比例）
(gnus-add-configuration '(article
                          (vertical 1.0
                                    (summary .4 point)
                                    (article 1.0))))

;;开启记分功能
(setq gnus-use-adaptive-scoring t)
(setq gnus-save-score t)
(add-hook 'mail-citation-hook 'sc-cite-original)
(add-hook 'message-sent-hook 'gnus-score-followup-article) 
(add-hook 'message-sent-hook 'gnus-score-followup-thread) 

(defvar gnus-default-adaptive-score-alist 
  '((gnus-kill-file-mark (from -10)) 
	(gnus-unread-mark) 
	(gnus-read-mark (from 10) (subjnnect 30)) 
	(gnus-catchup-mark (subject -10)) 
	(gnus-killed-mark (from -1) (subject -30)) 
	(gnus-del-mark (from -2) (subject -15)) 
	(gnus-ticked-mark (from 10)) 
	(gnus-dormant-mark (from 5)))) 

(setq  gnus-score-find-score-files-function
       '(gnus-score-find-hierarchical gnus-score-find-bnews bbdb/gnus-score) 
       gnus-use-adaptive-scoring t)

;;;
(setq gnus-confirm-mail-reply-to-news t
      message-kill-buffer-on-exit t
      message-elide-ellipsis "[...]\n"
      )

;; 排序
(setq gnus-thread-sort-functions
      '(
        (not gnus-thread-sort-by-date)
        (not gnus-thread-sort-by-number)
        ))

;; 新闻组分组
;; 现在可以在group buffer里面M-x gnus-topic-create-topic来创建一个"topic"，
;; 然后将某个新闻组或者其他topic给C-k掉，再移动到你创建的topic下C-y，就可以 
;; 将它们收到这个topic下。
;; topic的好处除了分层之外，还有就是可以将不常看的topic折叠起来，不要显示。
;; 参考 gnus info -> Group Buffer -> Group Topics
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;;{{{中文设置
(if (or (string-match "22." emacs-version))
	(utf-translate-cjk-load-tables))

(add-to-list 'gnus-group-charset-alist '("\\(^\\|:\\)cn\\>\\|\\<chinese\\>" cn-gb-2312))
(setq gnus-summary-show-article-charset-alist '((1 . cn-gb-2312) (2 . big5) (3 . utf-8)))
(setq gnus-group-name-charset-method-alist '(((nntp "news.newsfan.net") . cn-gb-2312)))
(setq gnus-group-name-charset-group-alist)
(setq gnus-default-charset 'cn-gb-2312
	  ;; gnus-group-name-charset-group-alist '((".*" . cn-gb-2312))
	  gnus-group-name-charset-group-alist 
	  '(("\\.com\\.cn:" . cn-gb-2312)
		("news\\.newsfan\\.net" . cn-gb-2312))	;;'((".*" . gbk))
	  ;; gnus-group-name-charset-group-alist	'(("\\.com\\.cn:" . gbk)("news\\.newsfan\\.net" . gbk))
	  gnus-newsgroup-ignored-charsets '(unknown-8bit x-unknown iso-8859-1 ISO-8859-15 x-gbk GB18030 gbk DEFAULT_CHARSET))
;;gnus-newsgroup-ignored-charsets '(unknown-8bit x-unknown x-gbk gb18030))
(setq mm-coding-system-priorities '(iso-8859-1 gb2312 utf-8))
	  ;; '(iso-8859-1 utf-8))
;;}}}

(add-hook 'gnus-startup-hook
          '(lambda () 
             (setq gnus-visible-headers 
                   (concat "^User-Agent:\\|^Content-Type:\\|"
                           "Content-Transfer-Encoding:\\|"
                           "^X-mailer:\\|^X-Newsreader:\\|^X-Sender:\\|" 
                           gnus-visible-headers))))

;; 另外，有些用web方式发出的邮件里有html，加入下面的设置，只看其中的
;; plain text部分：
(eval-after-load "mm-decode"
  '(progn
     (add-to-list 'mm-discouraged-alternatives "text/html")
     (add-to-list 'mm-discouraged-alternatives "text/richtext")))
(defalias 'mail-header-encode-parameter 'rfc2047-encode-parameter)

;;自己的帖子高亮
(add-hook 'message-sent-hook 'gnus-score-followup-article)
(add-hook 'message-sent-hook 'gnus-score-followup-thread)

;;{{{ set signatur and face
(defvar random-signature-head "Good Good Life , Day Day Study !\n")
(defvar random-signature-foot "\n              -- koocyton")
(defvar random-signature-list
  '("http://kt.doopai.com"
	"http://www.phpx.com"
    "http://bbs.chinaunix.net/forumdisplay.php?fid=27"
    "http://www.phpe.net"
    "http://www.php.net"
	"http://www.emacs.cn"
    ))

(defun random-signature ()
  (concat
   (if (null random-signature-head)
	   ""
	 random-signature-head)
   (nth (random (length random-signature-list)) random-signature-list)
   (if (null random-signature-foot)
	   ""
	 random-signature-foot
	 )
   )
  )

(defvar random-face-list
  '("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
 SUVORK5CYII="
  	"iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAHlBMVEUhJgg0OgxRWhNncyOE
 j0Wjq222uoS9w5PN0azd4MagpfWdAAACYklEQVR42mXTzXOaQBQA8CWkPbOQTCc3WbTT3oTVJN5U
 FmNurYLisY2K5yYRc61jXK8mpu5/2wcSWNsHOwPv9/aDNwMSQvQppQvOl7d7vmoI8TIS4pdA7xD7
 bW+Ww30OYxND1P+DNA1R/gcc/B7nR1DkMb6VwZTA2BTQw3I0CrCP4DSHHT6O/jvcOeYRGGEG8HmU
 EEmuDvBqAFjUSYZFICz6lMJWz6p14lgOFBDaSOFHsYYO1+Hz7wCkw9qmoWEM9yYBeNIUjDA2tVb1
 rKSXkr4AvAFAVkG2rbar5yW9CvAF4BUrAEhTrWqZNiv2SVPBJ58AthghBKieaV696TlqS1EUy43R
 VkNI0U4QNhVc+ea5qqtAISEpIFRWve83AesPW0ryblOKXohiw84GJSyYDqJavV9C2r0QaGepQ/20
 PAmY617Pl9CeEjJfAcTlKWt9vFr09M8P3fVvt/uIsbVLYPQh6hvXy2sSLUP+k9Bn1bkQCYhKNHC7
 7A/ZL+uDWqv9eCEaB5g8hPPZ1VblS4dWWnfBVzE6wG4VrjnfnvNVHAfKy0SkAbAfdgGeQz7n67Hx
 NspB1Pkz33POZ3y9GHIJmkYYxdMoTiBeSNBDNzyLdTyXoI+8LB/DXkICjc1yWMlQ8rppHk7GYxlM
 77DWCkYoA/V8qOVT+ENXGxlqQdDJtr+VYcCCwB+m+awfWa+GAIG3SPIbCfbtyAPwQcYDUQCjztQP
 EmE+m9QK6DPSmQSp+GzmNooZjFwepoDMmPuUg2uVp9MUvCBijG1yIKQzfUyhMwaobTJwCIEpvhd4
 bNCrgXRS+Atv5I2WCsjODwAAAABJRU5ErkJggg=="
	"iVBORw0KGgoAAAANSUhEUgAAADAAAAAkBAMAAAA9a6Q5AAAAAXNSR0IArs4c6QAAABtQTFRF
 IAAAYVBLdEtJgW1kmYV7sJaKxqWZxbyw3dbKPW4ZEQAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1I
 AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH1wwVBjkyowZsEwAAAYxJREFUKM9tks1WwjAQ
 hQex4LLWnzVnENdoFF2iQmWJQFKXWtJxq1BsHkBO89hOVbAEsklPvjMz994pQPmEbS+BXUeBHO4E
 C6A2XDuPtS7sv3oaquSA/Ri8l3AI4Yvbh8GQYMf0GLKJhrft6SOw6eT6s/TyNy1KTW5UqcCjaa+4
 n/PcLhV//LGa1Fr0uwDGpJGVsLcqqlE/WxBribKxuMkD9FcxUKJIJz4c2K+rzH401sYYJK1RA+p2
 3LL2fT1b9KUMOrEP3hzxdvkv6pRIn5M+GtZniFHJhSSaMhT5IMab9xL4lPLpmCgxZoHZRtxcMQuJ
 euy7uxE3t7k740Em6znpVU7uW4pokrbdFfWC04SIxr4buA9VxeLoacdvUFWqqNkGlWYBSG6B+qxZ
 ANIuGJigKQQTd+X26wIfrtjn1Olk5yLIDQPaNBPZB1EZLDvklFRpKi4gN1hI2wxyxKtOH7EQXS5R
 hNiAw0NETjPplgLWiADzR0Rsscv2f6e4AAAMsFNSRnT5C/YKEv50+waAvnKxYhZaCQAAAABJRU5E
 rkJggg=="
 	"iVBORw0KGgoAAAANSUhEUgAAADAAAAAwAgMAAAAqbBEUAAAADFBMVEWRko+3t7RiV1A6JSJg
 h7nIAAACBElEQVQokSXSQWsTQRQH8P/uJlKyYBS799BTSCSLelERu6iHNIqGdCbU9iNE6EdwKeSS
 HhSh4DHNzdni5pjmsBsqudST32B7EOJGTNpTsgn7nE0OA/Pjz3tvHgwiGlO4qRaKQjQRTcb/Lnwa
 ZY58A31nfLkwab5l9wDR6YTRMf0Roi3hhOHMpEs/VixETjT6QtTyp6eAR4uZTvR1MuQc27QIHKKT
 Pb5GyyUaGAk+0k1BEF3f3awymQRiTOP5g4ro4GkJBYcMz49ECKsg3HiZcX0SMSxVVhAtfhLF4Fz2
 6tss9EOxRinNn7uThYRPFJ7y16GI14j7nJ1XUxLbst5M84rBJQ5joqOA174xiZr/joJ8I4yTpE62
 G/Wu2CgBo0GN3CvrVwLuRh0y29qqAT+MXIpzZb5CY2leewqShKUbS3+owwLAC/nO3FNe2vIO1qzd
 RMGr7Ap1o1pcpJWHowT7rKwvre4Piu8Ae8zSlzUnO9WHHDssd48yZ/0Zzjnec1sjZxr8RdZIoNLk
 YvAd2gA79dktamn2IyBA2QoydKZjC+hi/4Wdp98VbNh4jFoKcIcH2GjjPuqfoZgnB3x3KsHko0x7
 11BtlMBzUI8DrckUdhs8g7fOVB2kON7A0sK22pYzFP4BHHqySleeJ2AWPPk3nkn0IMdAtL1PNtQg
 2Q+qGxVHyA7+A58cF4sUszMTAAAAAElFTkSuQmCC"
	))

(defun random-face ()
  (concat
   (nth (random (length random-face-list)) random-face-list)
   )
  )
;;}}}

(setq gnus-posting-styles;;{{{
      '((".*"
		 (name "koocyton")
		 (face random-face)
		 (address "koocyton@gmail.com")
		 (organization "http://kt.doopai.com")
		 (eval (setq mm-coding-system-priorities
					 '(iso-8859-1 cn-gb-2312 utf-8)))
		 (signature random-signature)
		 )
		("^cn\\.comp"
         (name "koocyton")
		 (face random-face)
		 (address "koocyton@gmail.com")
		 (organization "http://kt.doopai.com")
         (eval (setq mm-coding-system-priorities
                     '(iso-8859-1 cn-gb-2312 utf-8)))
		 (signature random-signature))
        ("^tw\\.comp"
         (name "koocyton")
		 (face random-face)
		 (address "koocyton@gmail.com")
		 (organization "http://kt.doopai.com")
         (eval (setq mm-coding-system-priorities
                     '(iso-8859-1 utf-8)))
		 (signature random-signature))
		))
;;}}}