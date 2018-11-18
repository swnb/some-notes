;; function lisp
(defun helloWorld (message) (format "%s" message))

;; four-line code

;; example function
(defun add (num)(+ num 1))

;; call
(funcall #'add 1)

;; apply
(apply #'add (list 1))

;; multiple return value
(defun multipleReturn () (values 1 2 4))

;; pattern match
(multiple-value-bind (first second third) (multipleReturn) (values first))

;; list
(defparameter list' (list "1"  2  t))

(nth 2 list')

