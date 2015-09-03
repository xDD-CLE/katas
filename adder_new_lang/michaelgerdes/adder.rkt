#lang racket/base
(require srfi/13/string)

(define (adder numbers)
  (define delimiters (list "," "\n"))

  (define (index-of-first-delimiter numbers)
    (let ([index-of-delimiters (filter (lambda (index) 
                                         (not (equal? #f index)))  
                                       (map (lambda (delimiter) 
                                              (string-contains numbers delimiter)) 
                                            delimiters))])
      (if (zero? (length index-of-delimiters))
        #f
        (apply min index-of-delimiters))))

  (define (custom-delimiter? numbers)
    (equal? #\/ (string-ref numbers 0)))

  (define (add-to-delimiters delimiter)
    (set! delimiters (cons delimiter delimiters)))

  (define (adder-iter accumulation numbers)
    (let ([index-of-first-delimiter (index-of-first-delimiter numbers)])
      (if index-of-first-delimiter
        (let ([first-number (string->number 
                              (substring numbers 0 index-of-first-delimiter))]
              [rest-of-numbers (substring numbers (+ 1 index-of-first-delimiter))])
          (adder-iter (+ accumulation first-number) rest-of-numbers))
        (+ accumulation (string->number numbers)))))

  (if (zero? (string-length numbers))
    0
    (if (custom-delimiter? numbers)
      (begin
        (add-to-delimiters (string (string-ref numbers 2)))
        (adder-iter 0 (substring numbers 3)))
      (adder-iter 0 numbers)))) 

(provide adder)
