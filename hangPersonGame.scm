#lang scheme

;Megan Sumner && Harman Dhillon

; Body Part List 
; ASCII Art made by Elissa Potier
; https://asciiart.website/index.php?art=people/other
(define bodyParts (list 
" "
" /////////////\\\\\\\\
(((((((((((((( \\\\\\\\
))) ~~      ~~  (((
((( (*)     (*) )))
)))     <       (((
((( '\\______/`  )))
)))\\___________/(((" 
" /////////////\\\\\\\\
(((((((((((((( \\\\\\\\
))) ~~      ~~  (((
((( (*)     (*) )))
)))     <       (((
((( '\\______/`  )))
)))\\___________/(((
       _) (_
      / \\_/ \\
      (     )
       )___(
      (     )
      |     |
      |  |  |" 
" /////////////\\\\\\\\
(((((((((((((( \\\\\\\\
))) ~~      ~~  (((
((( (*)     (*) )))
)))     <       (((
((( '\\______/`  )))
)))\\___________/(((
       _) (_
      / \\_/ \\
     /(     )
    // )___(
   // (     )
      |     |
      |  |  |"
" /////////////\\\\\\\\
(((((((((((((( \\\\\\\\
))) ~~      ~~  (((
((( (*)     (*) )))
)))     <       (((
((( '\\______/`  )))
)))\\___________/(((
       _) (_
      / \\_/ \\
     /(     )\\
    // )___( \\\\
   // (     ) \\\\
      |     |
      |  |  |"
" /////////////\\\\\\\\
(((((((((((((( \\\\\\\\
))) ~~      ~~  (((
((( (*)     (*) )))
)))     <       (((
((( '\\______/`  )))
)))\\___________/(((
       _) (_
      / \\_/ \\
     /(     )\\
    // )___( \\\\
   // (     ) \\\\
  ( ) |     | 
      |  |  |"
" /////////////\\\\\\\\
(((((((((((((( \\\\\\\\
))) ~~      ~~  (((
((( (*)     (*) )))
)))     <       (((
((( '\\______/`  )))
)))\\___________/(((
       _) (_
      / \\_/ \\
     /(     )\\
    // )___( \\\\
   // (     ) \\\\
  ( ) |     | ( ) 
      |  |  |"
" /////////////\\\\\\\\
(((((((((((((( \\\\\\\\
))) ~~      ~~  (((
((( (*)     (*) )))
)))     <       (((
((( '\\______/`  )))
)))\\___________/(((
       _) (_
      / \\_/ \\
     /(     )\\
    // )___( \\\\
   // (     ) \\\\
  ( ) |     | ( )
      |  |  |
       | |
       | |
       | |"
" /////////////\\\\\\\\
(((((((((((((( \\\\\\\\
))) ~~      ~~  (((
((( (*)     (*) )))
)))     <       (((
((( '\\______/`  )))
)))\\___________/(((
       _) (_
      / \\_/ \\
     /(     )\\
    // )___( \\\\
   // (     ) \\\\
  ( ) |     | ( )
      |  |  |
       | | |
       | | | 
       | | |"
" /////////////\\\\\\\\
(((((((((((((( \\\\\\\\
))) ~~      ~~  (((
((( (*)     (*) )))
)))     <       (((
((( '\\______/`  )))
)))\\___________/(((
       _) (_
      / \\_/ \\
     /(     )\\
    // )___( \\\\
   // (     ) \\\\
  ( ) |     | ( )
      |  |  |
       | | |
       | | | 
      _|_|_|
     /___|"
" /////////////\\\\\\\\
(((((((((((((( \\\\\\\\
))) ~~      ~~  (((
((( (*)     (*) )))
)))     <       (((
((( '\\______/`  )))
)))\\___________/(((
       _) (_
      / \\_/ \\
     /(     )\\
    // )___( \\\\
   // (     ) \\\\
  ( ) |     | ( )
      |  |  |
       | | |
       | | | 
      _|_|_|_
     /___|___\\"))

; Chooses a word from a list of words at random
(define (chooseWord)
  (let ((lst '("programming" "imperative" "functional" "logic" "declarative"
                             "scripting" "prolog" "lexical" "syntactical" "branching")))
       (list-ref lst (random (length lst)))))

; Used to start the game of Hangman
(define (play)
  (let ((word (chooseWord)) (blanks '()))
       (string->list word)
       (for ([i word])
             ;(display "_ ")
             (set! blanks (append blanks '("_"))))
   ; (display word) ;displays word for debugging
    (guess word blanks 0)))

; Allows the user to guess a letter until they guess incorrectly 10 times 
(define (guess word guessedList tries)
  (displayln (list-ref bodyParts tries)) ; display hangman body 
  (display "\nWord to Guess: ")
  (display guessedList)
  (display "\nIncorrect Guesses: ")
  (displayln tries)
  (display "\nGuess a letter: ")
  
  (let ((letter (read-line))
        (count 0)
        (wrong 0))
       (for ([i word])
         (if (string=? letter (make-string 1 i))
             (set! guessedList (list-set guessedList count letter))
             (set! wrong (+ wrong 1)))
         (set! count (+ count 1)))

  ; (display guessedList)
  (if (equal? wrong (length (string->list word)))
      (set! tries (+ tries 1))
      (display ""))
  
  ; Checking if user has guessed the whole word
  (if (equal? word (string-join guessedList ""))
      (begin 
        (display "\nWord to Guess: ")
        (displayln guessedList) 
        (display "Congratulations! You won!"))
      (if (equal? tries 10); Checking if user has guessed incorrectly 10 times 
          (begin
            (displayln "")
            (displayln (list-ref bodyParts tries))
            (display "  Sorry, you lost!"))
          (guess word guessedList tries)))))

(display "Welcome to Hangman")
(play)

(list 1 2 3 4 5)

(define x (cons 2 “two”))

(vector 1 2 3 4 5 6)

(string #\h #\i)

(boolean? #t)

(not #f)
(number? 123)
(rational?  3.14)
(real?  ⅗)
(complex? 2+3i)

(char? #\l)
(char? #\.)
(char? #\newline)

(char-downcase? #\s)
(char-upcase? #\p)

(define q+-)
(symbol?  q+-)

(+ tries 1)

(if (condition) (action-if-true) (action-if-false))

(for ([ condition ])     ; body )


