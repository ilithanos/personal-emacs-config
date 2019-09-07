(require 'helm)
(require 'helm-config)

;; The default "C-x c" is toclose to C-x C-c.
;; Changed to "C-c h"
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistant-action) ; rebind tab to persistant action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z") 'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p t
      helm-move-to-line-cycle-in-source t
      helm-ff-search-library-in-sexp t
      helm-scroll-amount 8
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
"hide minibuffer in Helm session if we use the header line as input field"
(when (with-helm-buffer helm-echo-input-in-header-line)
  (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
  (overlay-put ov 'window (selected-window))
  (overlay-put ov 'face
	       (let ((bg-color (face-background 'default nil)))
		 '(:background ,bg-color :foreground, bg-color)))
  (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook
'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(helm-mode 1)
