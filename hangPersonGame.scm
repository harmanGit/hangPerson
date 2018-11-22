#lang scheme

; Chooses a word from a list of words at random
(define (chooseWord)
  (let ((lst '("programming" "imperative" "functional" "logic" "declarative" "scripting" "prolog" "lexical" "syntactical" "branching")))
       (list-ref lst (random (length lst)))))

; Used to start the game of Hangman
(define (play)
  (let ((word (chooseWord)) (blanks '()))
       (string->list word)
       (for ([i word])
             (display "_ ")
             (set! blanks (append blanks '("_"))))
   ; (display word)
    (guess word blanks 0)))

; Allows the user to guess a letter until they guess incorrectly 10 times 
(define (guess word guessedList tries)
  (display "\n Guess a letter:")
  (let ((letter (read-line))
        (count 0)
        (wrong 0))
       (for ([i word])
         (if (string=? letter (make-string 1 i))
             (set! guessedList (list-set guessedList count letter))
             (set! wrong (add1 wrong)))
         (set! count (add1 count)))
  (display guessedList)
  (if (equal? wrong (length (string->list word)))
      (set! tries (add1 tries))
      (display ""))
  (display "\n Tries:")
  (display tries)
  (display (string->list word)) ;displays word for debugging
  (display guessedList)
  ; Checking if user has guessed the whole word
  (if (equal? word (string-join guessedList ""))
      (display "Congratulations! You won!")
      (if (equal? tries 3); Checking if user has guessed incorrectly 10 times 
          (display "Sorry, you lost!")
          (guess word guessedList tries)))))