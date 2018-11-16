#lang scheme
(define (chooseWord)
  (let ((lst '("programming" "imperative" "functional" "logic" "declarative" "scripting" "prolog" "lexical" "syntactical" "branching")))
       (list-ref lst (random (length lst)))))

(define (play)
  (let ((word (chooseWord)))
       (string->list word)
       (for ([i word])
             (display "_ "))
       (display "\n"))
  (guess))

(define (guess word)
  (display "Guess a letter:")
  (let ((letter (read)))
       (if 