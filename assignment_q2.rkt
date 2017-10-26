#lang racket
(provide ins_beg)
(provide ins_end)
(provide cout_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)


(define (ins_beg el lst)
  display "Hello, I'm ins_beg!\n"
  (cons el lst))

 
(define (ins_end el lst)
  display "Hello, I'm ins_end!\n"
  (append lst el))
  
(define (cout_top_level lst)
  display "Counting elements in list...\n"
  (length lst))

(define (count_instances el lst)
  (define element 0)
  (display "Counting instances...\n")
  (if(empty? lst) (error "No similar elements")(for([e (in-list lst)])(if(equal? e el)(set! element(+ element 1))(= element element))))
  (display "The element " )
  (display el)
  (display " displays ")
  (display element)
  (display " times in the list"))
(define (count_instances_tr el lst)
(define (count_instances_tr_re el lst ctr)
  (if (empty? lst)
      (begin (display "Complete, list empty!\n") (display "Counting instances...\n")(display ctr))
      (if(equal? (car lst) el)(count_instances_tr_re el (cdr lst) (+ ctr 1))(count_instances_tr_re el (cdr lst) ctr))))
  (count_instances_tr_re el lst 0) 
)
(define (count_instances_deep el lst)
  (define ctr 0)
  (define (count_instances_deep_re lst)
    (if (empty? lst)
        (void)
        (begin
          (if (eq? el (car lst))
                   (begin
                     (set! ctr (+ ctr 1))
                     (count_instances_deep_re (cdr lst)))
                     (begin
                       (if (number? (car lst))
                              (count_instances_deep_re (cdr lst))
                              (begin
                                (count_instances_deep_re (car lst))
                                     (count_instances_deep_re (cdr lst)))))))))
  (count_instances_deep_re lst)
  (display ctr))