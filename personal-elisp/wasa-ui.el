;; annoyances
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(setq echo-keystrokes 0.5)

;; theme and faces
(setq custom-file (concat user-emacs-directory "custom/custom"))
(load custom-file)
(set-default-font "DejaVu Sans Mono-7")
(set-fontset-font "fontset-default" 'unicode "Symbola")
(setq x-gtk-use-system-tooltips nil)
(add-to-list 'custom-theme-load-path
	     (concat user-emacs-directory "personal-elisp/"))
(load-theme 'wasa-solarized t)

(provide 'wasa-ui)