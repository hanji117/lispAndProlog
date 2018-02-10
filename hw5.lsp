#||
HW: HW 5 clisp functions
Name: Edgar Cruz
File: implementation file
compile: (load "hw5.lsp")
||#
;;;; 4 semicolons comment to describe program comment
;;; basic comment

;; comment indented with your code

; after a line of code

#||

(defun fibonacci (n &optional (a 0) (b 1) (acc ()))
  (if (zerop n)
      (nreverse acc)
     (fibonacci (1- n) b (+ a b) (cons a acc))))
||#

;;;the 6th fib # is 8
(defun ONEFIB (n)
  (cond ;;; cond is a construct.
;;;This construct is used for used for checking
;;; multiple test-action clauses. It can be compared to
;;; the nested if statements in other programming languages.
    ( (= n 0) 0)
    ( (= n 1) 1)
    (t (+ (ONEFIB (- n 1)) (ONEFIB (- n 2))))))
;;;It's common to use t for true.
            

(defun ALLFIB (n &optional (a 0) (b 1) (acc ()))
;;; functions are defined using defun. To define a function with optional
;;; parameters, after the names of any required parameters, place the 
;;; symbol &optional followed by the names of the optional parameters.        
;;; for more info see http://www.gigamonkeys.com/book/functions.html

;;;https://www.tutorialspoint.com/lisp/lisp_predicates.htm 
(if (zerop n);;;zerop is a function. Returns true if # is 0(integer, float, 
             ;;; or complex) otherwise, return false.
(nreverse acc);;; nreverse is a recycling function. nreverse returns the 
;;;same sequence containing the same elements as sequence but in reverse order.
              ;;; n stands for non-consing, meaning it doesn't need to 
              ;;; allocate any new cons cells. Accumulator shortend to acc. 
(ALLFIB (1- n) b (+ a b) (cons a acc)))) 
              ;;; cons is a record structure containing 2 components 
              ;;; called the car and the cdr. Cons structures can be used
              ;;; to create a single linked list.
           ;;;for more info https://www.tutorialspoint.com/lisp/lisp_lists.htm
;;;cons: It takes two arguments, an element and a list and returns
;;; a list with the element inserted at the first place.
;;; test case: (allfib 6)
;;; (0 1 1 2 3 5)


#||
if you want the int(N) first and then the list (L)

(defun GETELEM1 (N L)
  "Return the N'th member of a list L."
  (if (null L)
      nil
    (if (zerop N) 
	(first L)
 (GETELEM1 (1- N) (rest L)))))
;;; (1- N) is a shorthand for (- N 1)
;;;Test case:(getelem1 1 `(a (b d) v d) )  
;;; a is 0 
;;; (b d) is 1 
;;; (b d) is the output
||#


(defun GETELEM (L N)
  "Return the N'th member of a list L."
;;;List starts with index 0.
  (if (null L)
#||
The if construct has various forms. In simplest form it is followed by a test clause, a test action and some other consequent action(s). If the test clause evaluates to true, then the test action is executed otherwise, the consequent clause is evaluated.
||#
      nil;;; false in lisp is nil
    (if (zerop N)
;;; zerop is a function. Returns true if # is 0(integer, float,     
;;; or complex) otherwise, return false. 
        (first L)
;;;In terms of what they do, car and cdr are equivalent to first and rest.
;;;Now, there is a difference, not in functionality, but in style, when 
;;;you're using these functions.
;;;rest is often preferred stylistically over cdr when the argument 
;;;is to being subjectively viewed as a list rather than as a cons.
;;;more info: http://stackoverflow.com/questions/29907440/difference
;;;-between-cdr-car-and-rest-first-and-possible-implementation 
(GETELEM (rest L) (1- N)))))
;;;test case: (getelem `(a b 9 c t) 0)
;;;returns A


(defun DELELEM (N list)
(if (zerop n);;; zerop (zerop is a predicate) takes one numeric 
;;;argument and returns t if the argument is zero or nil if otherwise.
      (cdr list)
;;;cdr fucntion takes a list as argument, and returns a 
;;;list without the first element.
    (let ((cons (nthcdr (1- n) list)))
 (when cons;;;cons function takes 2 arguments, 
;;; an element and a list and returns
;;; a list with the element inserted at the first place.
       (setf (cdr cons) (cddr cons)))
    list)));;; cdr function takes a list as an argument,and
;;;returns a list without the first element.
#||
Concatenation (sequence,chain) of car and cdr functions
sequences of car and cdr functions could be abbreviated by concatenating the letter a for car and d for cdr within the letters c and r.

For example we can write cadadr to abbreviate the sequence of function calls - car cdr car cdr.

Thus, (cadadr '(a (c d) (e f g))) will return d 
||#

;;;test case: (delelem 1 `(0 1 2 3))
;;;returns: (0 2 3)

(defun MAXIMUM (lst)
   (let ((MAXIMUM (first lst)))
      (dolist (ele (rest lst))
;;;The dolist construct allows iteration through each element of a list.
         (if (> ele MAXIMUM)
             (setf MAXIMUM ele)))
      MAXIMUM));;;SETF (SET Field) as a generic way of assigning values 
;;;to data structures, to mirror the l-values of other languages

;;;test case: (maximum `(4 2 9 3 1 5))
;;; returns 9
;;;test case: (maximum `(4 2 9 3 1 20))
;;; returns 20


(defun COUNTELEMS (L)

(length L) );;;length returns the length of a sequence.

;;;test case:  (countelems `(9 4 3 2 1 3 5))
;;; returns 7
;;;test case: (countelems `(9 4 3 2 1 a q t))
;;;returns 8


(defun ISPAL (l)
  (equal l (reverse l)))
;;;test case: (ispal `(2 7 0 1 1 0 7 2))
;;;returns: T
;;;test case: (ispal `(2 7 0 1 5 0 7 2 ))
;;;returns: NIL

(defun FLAT (l) 
(if l 
(if (atom l)
;;;An atom is a number or string of contiguous characters. 
;;;It includes numbers and special characters. 

(list l);;;list function takes any number of arguments 
;;;and returns a list with the arguments as
;;; member elements of the list.

(mapcan #'FLAT l))))
;;;mapcan and mapcon are like mapcar and maplist, respectively, 
;;;except that they combine the results of the function 
;;;using nconc instead of list. 
;;;more info:https://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node90.html

;;;test case: (flat `(x y (z a) b ((c d e) f )))
;;;returns (x y z a b c d e f) in capital letters