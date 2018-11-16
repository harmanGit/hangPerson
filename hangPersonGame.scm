#lang scheme
(define (chooseWord)
  (let ((lst '(programming imperative functional logic declarative scripting prolog lexical syntactical branching)))
       (list-ref lst (random (length lst)))))

(define (play)
  (let ((word chooseWord))
       (display (word))
       (string->list word)
       (for ([i word])
             (display "_"))))