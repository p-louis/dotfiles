(require 'package)
(add-to-list 'package-archives (cons "melpa" (concat "https" "://melpa.org/packages/")) t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(package-selected-packages (quote (org lsp-mode kotlin-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq exec-path (append exec-path '('"/home/patrick/temp/kotlin-lagnuage-server/server/build/bin/")))

(tool-bar-mode 0)
(menu-bar-mode 0)
