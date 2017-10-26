#lang racket
(cons 1 2)
(cons 1 (cons 2 (cons 3 null)))
(cons 1 (cons 2 (cons 3 (cons "string" (cons 4 null)))))
'(String 1 '(2 3 4))
(append '(String) (append '(2) '(3 4 5)))
