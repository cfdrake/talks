;;;; CHALLENGES

;;; "The Cradle"
;;; See the Field Guide for more details.
;;; Just be glad it's there. Move along.
(define first car)
(define rest cdr)
(define empty-list? (lambda (x)
                 	  (eq? x nil)))

;;;; SECTION: Defining and Using Functions

;;; Implement a function which returns the square of the number passed in.
;;; Tests:
;;;   (square 0) => 0
;;;   (square -3) => 4
;;;   (square 3) => 9
(define (square x)
    (* x x))

;;; Implement a function which calculates the hypotenuse of a right
;;; triangle given two sides as input, a and b.
;;; Formula: c^2 = a^2 + b^2, find c!
;;; Hints: Reuse your function implemented above! sqrt is the square root function.
;;; Tests:
;;;   (pythag 3 4) => 5
(define (pythag a b)
    (sqrt (+ (square a) (square b))))

;;;; SECTION: Functions Taking Functions

;;; Some setup...
;;; Implement a predicate (function that returns a boolean value) which
;;; determines if a right triangle can be constructed from the given inputs,
;;; a, b, and c. Assume c is the hypotenuse.
;;; Hint: eq? tests equality of two (or more) arguments.
(define (valid-right-triangle? a b c)
    (eq? c (pythag a b)))

;;; Implement a function that takes a list of lists, each of which has three items,
;;; for example:
;;;
;;;   '((4 5 6) (1 2 3) ...)
;;;
;;; Where the function will return ONLY those sublists that form a triangle. Assume
;;; the sublists are composed as such: (a b c), where c is (potentially?) the hypotenuse.
;;; Hint: You'll need to pull apart pieces of data... see "The Cradle".
;;;       (filter) is a function which keeps only those items in a list which satisfy a predicate.
;;;       Example usage: (filter even? '(1 2 3 4)) = (2 4)
;;;       You may need to define a lambda in your filter to help out... prior solutions only help so much!
(define second (lambda (x) (first (rest x))))
(define third (lambda (x) (first (rest (rest x)))))

(define (find-valid-right-triangles triangles)
    (filter (lambda (t)
                (valid-right-triangle? (first t) (second t) (third t)))
            triangles))

;;;; SECTION: Recursion
;;;; For an explanation, please see SECTION titled "Recursion".

;;; Write a function that takes a predicate (function returning a true
;;; or false value) and a list, which returns the number of elements in
;;; that list where pred returns true on it.
;;; You may not simply combine (count) and (filter) ;)
;;; Though this would perhaps be the "real" way you'd do it...
;;; Hint: Remember the (empty-list?) predicate and base case pattern from
;;; the Field Guide.
(define (count-where pred lst)
  (if (empty-list? lst)
    0
    (if (pred (first lst))
      (+ 1 (count-where pred (rest lst)))
      (count-where pred (rest lst)))))

;;;; SECTION: Bonus challenge!

;;; Rot-13 Challenge
;;; Write a function that takes a string. As output, it should return
;;; that same string, but ROT13 encoded (https://en.wikipedia.org/wiki/ROT13).
;;; Hints:
;;; - http://www.rot13.com - Rot13 tester
;;; - (string->list s) converts a string, s, into a list of characters.
;;; - (char->integer c) converts a character, c, into its ASCII representation.
;;; - (integer->char i) converts an integer, i, into the associated ASCII character.
;;; - (list->string l) converts a list of characters, l, back into a string.
;;; - Use the following to help out with temporary variables if you wish:
;;;     (let ((name1 val1)
;;;           (name2 val2))
;;;       (body-to-evaluate-with-name1-and-name2))
;;; - (map) is helpful. (cons) can be helpful to build a list. Depends on your solution!
;;; - (mod) is the modulo operation.
;;; You may assume all input is all uppercase A-Z ASCII.
(define ascii-a 65)

(define (rot13-char ch)
    (let ((as-int (- (char->integer ch) ascii-a)))
         (integer->char (+ ascii-a (mod (+ as-int 13) 26)))))

(define (rot13 str)
    (let ((lst (string->list str)))
      (list->string (map rot13-char lst))))
