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

(defun somefun (start end)
  (do ((i start (+ i 1)))
      ((> i end) i)
    (format "%s" i)))

(defun sumlist (list acc)
    (if (null list)
	acc
	(sumlist (cdr list) (+ acc 1))))


(somefun 2 100)

(funcall #'sumlist '(1 21 212 1212 14 32 42315 415 21 1) 0)

(defun copyList (list)
  (if (null list)
      nil
      (cons (car list)
	    (copyList (cdr list)))))

(copyList '(1 2 3 4 5 2 1 2 4 3 1 2))

(append 1 '2 '3)

;; zip how -> to zip list  '(1 1 1 2 1 1 )
(defun zip ()
  ())

(defun ad (x)
  (progn (lambda (y) (+ x y))))



