(defadvice rainbow-turn-on (after fontify-buffer activate)
  (font-lock-fontify-buffer))
(defadvice rainbow-turn-off (after fontify-buffer activate)
  (font-lock-fontify-buffer))

(defun wasa-turn-on-rainbow-mode ()
  (interactive)
  (rainbow-mode 1))

(setq nxml-slash-auto-complete-flag t)

(add-hook 'nxml-mode-hook 'rainbow-delimiters-mode-enable)
(add-hook 'sgml-mode-hook 'rainbow-delimiters-mode-enable)
(add-hook 'css-mode-hook 'rainbow-delimiters-mode-enable)

(add-hook 'nxml-mode-hook 'wasa-turn-on-rainbow-mode)
(add-hook 'sgml-mode-hook 'wasa-turn-on-rainbow-mode)
(add-hook 'css-mode-hook 'wasa-turn-on-rainbow-mode)

(provide 'wasa-web)