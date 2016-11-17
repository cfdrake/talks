;;;; Expressions in Scheme: A Basic Field Guide

;;; "The Cradle"
;;; This is a selection of functions you may find useful while following this guide
;;; and doing the challenges. These functions are provided in other Scheme/Lisp dialects,
;;; and I think they kind of "modernize" the terminology a little bit. I'm defining them
;;; here to hopefully make things simpler for right now. Less about the language, more
;;; about the concepts. Feel free to ignore these definitions for now and move along.
(define nil '())
(define first car)
(define rest cdr)
(define empty-list? (lambda (x)
                 	  (eq? x nil)))

;;; A number.
3

;;; A string.
;;; There are (obviously) many other data types available as well.
"Hello, World"

;;; A function call.
;;; General syntax: a *list* of a function followed by its arguments.
;;; Or more formally: (<function> <arg 1> ... <arg n>)
;;; This is the add function applied to two numbers.
(+ 3 4)

;;; A nested function call.
(* (+ 3 4) 2)

;;; A named (pointer to a) value.
(define a 3)

;;; Functions are also values. They evaluate to themselves.
;;; This one returns the input variable, x, multiplied by two.
;;; It doesn't do anything unless you call it.
(lambda (x)
  (* 2 x))

(define double (lambda (x)  ;; Give it name, first.
                 (* 2 x)))

(double a)

;;; You could also place a function, as a literal, right in the
;;; function position of a list to call it. Just like the '+' example above.
((lambda (x y) (+ x y)) 3 4)

;;; Luckily for us, Scheme defines a very simple function syntax that improves
;;; over the two prior methods. Note the positioning of the parentheses around
;;; the name of the function. This is equivalent to (define <f> (lambda <args> ...)).
(define (increment-and-double x)
  (double (+ x 1)))

;;; You might remember that I described a function call as a list of function
;;; name along with arguments. You should also note that everything we've been
;;; writing: defines, lambdas, have all been represented as lists. So... how do
;;; we just define a list data structure and... not have it do anything?
(quote (a b c d))

;;; Or alternatively:
'(a b c d)

;;; There are many functions to manipulate lists.
(first '(a b c d)) ;; a
(rest '(a b c d))  ;; (b c d)

(first (rest '(a b c)))  ;; b

(rest '(a))  ;; nil, the empty list!

(empty-list? (rest '(a)))  ;; #t (true)

;;; Let's focus on a few more examples of functions and list manipulations
;;; to get us ready for the challenges.

;;; Recursive definition of a factorial.
(define (factorial n)
    (if (< n 1)
        1
        (* n (factorial (- n 1)))))

;; (factorial 3)
;; = (* 3 (factorial 2))
;; = (* 3 (* 2 (factorial 1)))
;; = (* 3 (* 2 1))
;; = (* 3 2)
;; = 6

;;; Recursive definition of the count of a list.
;;; Instead of numerical recursive base cases, we stop at the empty list here.
(define (count lst)
  (if (empty-list? lst)
      0
      (+ 1 (count (rest lst)))))
      
;; (count '(1 2 3))
;; = (+ 1 (count '(2 3)))
;; = (+ 1 (+ 1 (count '(3))))
;; = (+ 1 (+ 1 (+ 1 (count '()))))
;; = (+ 1 (+ 1 (+ 1 0)))
;; = (+ 1 (+ 1 1))
;; = (+ 1 2)
;; = 3

;;; List manipulations/functions
;;; One of the most powerful features, and in fact the feature that makes Scheme programming
;;; "functional" programming is the fact that you can treat functions as first-class values.
;;; Functions may be arguments to another functions. Functions could create and return another
;;; function - they're just values! This enables writing very succinct code.
(map square (filter even? '(1 2 3 4 5)))  ; (4 16)

(define (adder x)
  (lambda (n)
    (+ n x)))  ;; return inner function capturing arguments from the outer function
    
(define two-adder (adder 2))  ;; function which adds two to input, i.e. (two-adder 3) = 5

;;;
;;; Fin (for now).
;;;

;;; If you find yourself interested in Scheme/Lisp as a whole, not just functional programming,
;;; please check out these links:

;;; "Clojure" - http://clojure.org/guides/getting_started
;;; One of the more popular, modern Lisp implementations. Runs on the JVM.

;;; "The Racket Guide" - https://docs.racket-lang.org/guide/
;;; A guide for getting started with an excellent Scheme implementation.
;;; Batteries-included for web servers, command line apps, etc.

;;; "The Roots of Lisp" - http://languagelog.ldc.upenn.edu/myl/ldc/llog/jmc.pdf
;;; Paul Graham of Y Combinator fame creates a LISP interpreter in 13 pages with 7 functions.
;;; Enough said.

;;; "Write Yourself a Scheme in 48 Hours" - https://en.wikibooks.org/wiki/Write_Yourself_a_Scheme_in_48_Hours
;;; Classic Haskell tutorial that teaches you Haskell alongside implementing a Scheme interpreter from scratch.
