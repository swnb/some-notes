;; function lisp
(defun helloWorld (message) (format "%s" message))

;; four-line code

;; example function
(defun add (num) (+ num 1))

;; call
(funcall #'add 1)

;; apply
(apply #'add (list 1))

;; multiple return value
(defun multipleReturn () (values 1 2 4))

;; pattern match
(multiple-value-bind (first second third) (multipleReturn) (values first))

;; map reduce
(defun sum (s) (reduce #'(lambda (a b) (+ a b)) s))

;; list
(defparameter list' (list "1"  2  t))
(nth 2 list')

;; recursion
(defun findallitem (num lst)
  (if (null lst)
      nil
      (if(eql num (car lst))
	  t
	  (findallitem num (cdr lst)))))


;; var const
(defparameter *global-var* 123)

(defconstant global-const 21213)

(boundp global-const)


(setf x 120)

(setf y (list x))





