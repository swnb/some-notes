# racket

```racket
    (define base-value null)
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
