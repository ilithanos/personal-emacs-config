(require 'package)
(load "~/.emacs.d/tools/melpa")
(package-initialize)

(unless (package-installed-p 'use-package)
	(package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(load "~/.emacs.d/tools/load-directory")
(load-directory "~/.emacs.d/config/general")
(load-directory "~/.emacs.d/config/c")
(load-directory "~/.emacs.d/config/go")
;(load-directory "~/.emacs.d/config/avr")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-projectile smartparens ws-butler dtrt-indent clean-aindent-mode projectile ## company-c-headers company sr-speedbar function-args helm-gtags use-package helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
