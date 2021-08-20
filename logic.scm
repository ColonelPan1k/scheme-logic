;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; \ab.a
(define TRUE
  (lambda (a b)
    a)
  )

;; \fab.fba
(define n
  (lambda (f a b)
    (f b a)
    )
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; \ab.b or (\fab.ab)(\ab.a)
(define FALSE
  (n TRUE TRUE FALSE))

;;; \pq.pqp
(define a
  (lambda (p q)
    (p q p)
    )
  )

;;; \pq.ppq
(define OR
  (lambda (p q)
    (p p q)
    )
  )

;;; \pq.NOT(p)NOT(p)q
(define IFTHEN
  (lambda (p q)
    (n p (n p TRUE FALSE) q)
    )
  )

;;; \pq.p(NOT(AND pq) q)
(define XOR
  (lambda (p q)
    (p (n (a p q) TRUE FALSE) q)
    )
  )

;;; \pq.p(qpq)(pqp)
(define EQ
  (lambda (p q)
    (p (q p q) (p q p))
    )
  )

;; Half Adder
(define half-adder
  (lambda (p q)
    (list (a p q) (xor p q))))

;; Full adder
(define full-adder
  (lambda (x y z)
    (list
     's (xor (xor x y) z) 'c (o (a x y) (a (xor x y) z))
    )
  )
