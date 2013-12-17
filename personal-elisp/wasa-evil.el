(setq evil-default-cursor t)
(evil-mode t)
(global-surround-mode t)
(evil-set-initial-state 'dired-mode 'emacs)
(evil-set-initial-state 'package-menu-mode 'motion)
(evil-set-initial-state 'Custom-mode 'motion)
;; for some reason (evil-set-initial-state 'org-capture-mode 'insert) does not work
(add-hook 'org-capture-mode-hook (lambda () (evil-insert-state)))
(evil-set-initial-state 'tumblesocks-compose-mode 'insert)
(evil-set-initial-state 'nrepl-mode 'emacs)
(evil-set-initial-state 'circe-chat-mode 'emacs)
(evil-set-initial-state 'circe-channel-mode 'emacs)
(evil-set-initial-state 'circe-server-mode 'emacs)
(evil-set-initial-state 'circe-query-mode 'emacs)
(evil-set-initial-state 'circe-display-mode 'emacs)
(evil-set-initial-state 'Man-mode 'emacs)
(evil-set-initial-state 'woman-mode 'emacs)
(evil-set-initial-state 'tetris-mode 'emacs)

(define-key evil-motion-state-map ";" 'evil-ex) ; nnoremap ; :
(define-key evil-visual-state-map ";" 'evil-ex) ; vnoremap ; :
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist
      `((".*" . ,(concat user-emacs-directory "undo"))))
(global-evil-leader-mode t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "," 'evil-buffer
  "." 'helm-mini
  "/" 'helm-find-files)

(evil-leader/set-key-for-mode 'tumblesocks-view-mode
  "q" 'quit-window
  "c" 'tumblesocks-view-compose-new-post
  "r" 'tumblesocks-view-refresh
  "t" 'tumblesocks-view-posts-tagged
  "v" 'tumblesocks-view-post-at-point
  "d" 'tumblesocks-view-delete-post-at-point
  "e" 'tumblesocks-view-edit-post-at-point)

(evil-define-key 'normal org-mode-map
  (kbd "RET") 'org-open-at-point)

(setq ace-jump-mode-move-keys
      '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?\;))
(define-key evil-normal-state-map (kbd "SPC") 'evil-ace-jump-char-mode)
(define-key evil-normal-state-map (kbd "S-SPC") 'evil-ace-jump-word-mode)
(define-key evil-normal-state-map (kbd "C-SPC") 'evil-ace-jump-line-mode)
(define-key evil-insert-state-map (kbd "RET") 'newline-and-indent)
(define-key evil-normal-state-map (kbd "-") 'evil-numbers/dec-at-pt)
(define-key evil-normal-state-map (kbd "+") 'evil-numbers/inc-at-pt)

(defun wasa-evil-unimpaired-insert-newline-above (count)
  "Insert an empty line below point"
  (interactive "p")
  (save-excursion
    (dotimes (i count)
      (evil-insert-newline-above))))

(defun wasa-evil-unimpaired-insert-newline-below (count)
  "Insert an empty line below point"
  (interactive "p")
  (save-excursion
    (dotimes (i count)
      (evil-insert-newline-below))))

(define-key evil-normal-state-map (kbd "[ SPC")
  'wasa-evil-unimpaired-insert-newline-above)

(define-key evil-normal-state-map (kbd "] SPC")
  'wasa-evil-unimpaired-insert-newline-below)

(defun evil-paste-from-primary ()
  "Paste text from PRIMARY/Selection"
  (interactive)
  (evil-paste-from-register ?*))

(global-set-key (kbd "<S-insert>") 'evil-paste-from-primary)
(global-set-key (kbd "<mouse-2>") 'evil-paste-from-primary)

(provide 'wasa-evil)