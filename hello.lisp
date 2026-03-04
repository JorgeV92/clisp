(format t "Hello from Common Lisp on my IMac!~%")
(print (+ 2 2))
(format t "~a~%" (+ 2. 2))
(print (+ 1 2 3 4 5 6 7 8 9 10)) ; some comment in lisp 

(print (append ' (Pat Kim) ' (Robin Sandy))) ; => (Pat Kim Robin Kim)  

(print 'John)

(print (length(append '(Pat Kim) (list '(John Q Pulic) 'Sandy))))

(setf p '(John Q Public))
(print p)

(setf x 10)
(print (+ x x))
(print (+ x (length p)))
(print (first p))
(print (rest p))
(print (second p))
(print (third p))
(print (fourth p))
(print (length p))


(setf x '((1st element) 2 (element 3) ((4)) 5))
(print x)
(print (length x))
(print (first x))
(print (second x))
(print (third x))
(print (fourth x))
(print (first (fourth x)))
(print (first (first (fourth x))))
(print (fifth x))
(print (first x))
(print (second (first x)))


(print p)
(print (cons 'Mr p))
(print (cons (first p) (rest p)))
(setf town (list 'Anytown 'USA))
(print town)

(print (list p 'of town 'may 'have 'already 'won!))
(print (append p '(of) town '(may have already won!)))
(print (print p))

(print (last p))
(print (first (last p)))

(defun last-name (name)
    "Select the last name from a name represented as a list."
    (first (last name)))

(print (last-name p))
(print (last-name '(Rear Admiral Grace Murray Hopper)))
(print (last-name '(Rex Morgan MD)))
(print (last-name '(Spot)))
(print (last-name '(Aristotle)))

(defun first-name (name) 
    "Select the first name from a name represented as a list."
    (first name))

(print (first-name p))
(print (first-name '(Wilma Flinstone)))
(setf names '((John Q Public) (Malcolm X) 
            (Admiral Grace Murray Hopper) (Spot) 
            (Aristotle) (A A Milne) (Z Z Top) 
            (Sir Larry Olivier) (Miss Scarlet)))

(print (first-name (first names)))

(print (mapcar #'last-name names))

(print (mapcar #'- '(1  2 3 4)))
(print (mapcar #'+ '(1 2 3 4) '(10 20 30 40)))

(print (mapcar #'first-name names))

(defparameter *titles* 
    '(Mr Mrs Miss Ms Sir Madam Dr Admiral Major General)
    "A list of titles that can appear at the start of a name.")


(defun first-name (name)
    "Select the first name from a name represented as a list." 
    (if (member (first name) *titles*) 
        (first-name (rest name)) 
        (first name)))

(print (mapcar #'first-name names))
(print (first-name '(Madam Major General Paula Jones)))

(print (trace first-name))
(print (first-name '(John Q Public)))

(print (first-name '(Madam Major General Paula Jones)))
(untrace first-name)
(print (first-name '(Mr Blue Jeans)))

; Higher order functions 
; A function that takes another function as a argument 

(defun mappend (fn the-list)
    "Apply fn to each element of list and append the results."
    (apply #'append (mapcar fn the-list)))

(print (apply #'+ '(1 2 3 4)))

(print (apply #'append '((1 2 3) (a b c))))
(print (append '((1 2 3) (a b c))))

(defun self-and-double (x) (list x (+ x x )))
(print (self-and-double 3))

(print (apply #'self-and-double '(3)))
(print (mapcar #'self-and-double '(1 10 300)))
(print (mappend #'self-and-double '(1 10 300)))

(defun numbers-and-negations (input) 
    "Given a list, return only the numbers and their negations."
    (mappend #'number-and-negation input))

(defun number-and-negation (x) 
    "If x is a number, return a list of x and -x."
    (if (numberp x)
        (list x (- x)) 
        nil))

(print (numbers-and-negations '(testing 1 2 3 test)))

(defun mappend (fn the-list) 
    "Apply fn to each element of list and append the results."
    (if (null the-list) 
        nil
        (append (funcall fn (first the-list)) 
            (mappend fn (rest the-list)))))

(print (funcall #'+ 2 3 ))
(print (apply #'+ '(2 3)))
; (print (funcall #'+ '(2 3))) => Error 

(print ((lambda (x) (+ x 2)) 4))
(print (funcall #'(lambda (x) (+ x 2)) 4))

(print (mappend #'(lambda (l) (list l (reverse l))) 
            '((1 2 3) (a b c))))

(print "a string")
(print (length "a string"))
(print (length ""))