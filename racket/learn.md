# racket

```racket
    (define base-value null)
```

```racket
  ;; pair
'(1 . 2)
(cons 1 2)
```

```lisp
(struct pos (x y))
(define my-point (pos 1 2))
```

```racket
;; array vertor
(define v1 (vector 1 2 3 4 5 5))
(vector-length v1)
(vector-append v1 #(1 2 3 4 4 ))
```

```racket
;; set
(define s1 (list->set '(1 12 1 1 1 2 3 35)))
(ser-remove s1 1)
```

```racket
;; dict hash table
(define hs1 (hash '1 'dsa "key" 'cdscs))
(hash-ref hs1 '1)
(hash-remove hs1 '1)
```

```racket
;; lambda
 (λ (x)
    (λ (y)
      (+ x y)))

 (((λ (x)
    (λ (y)
      (+ x y))) 1) 2)
;; => 3

(define foo (lambda (x) (begin x)))
```

```racket
;; random
(define (rand) (random 10)) ;; 0 - 10

;; add
(define (add x)
  (if (string? x)
      (string-append x "?")
      (+ x 1)))
```

```racket
;; list operate
(define list '(1 2 3 4 5 6))
(list-ref list 3)
(append list '(1 3 4 5))
(reverse list)
(member 5 list) ;; this is last cons pair to show
```

```racket
;; map 映射的操作
(define list '(1 2 3 4 5 6))
(andmap number? list)
(ormap string? list)
(map
 (λ (x y) (+ x y))
 list
 list)

;; reduce  -> ask one base acc as first ele
(define l '(1 2 3 4 5 6 7))
(define (sum l)
    (foldl
        (lambda (acc ele) (+ acc ele))
            0
            l))

```

```racket
;; distinguish cons

(cons? '())
(empty? '(1 2))
```

```racket
(display "a") ;; put "a" into io output
```
