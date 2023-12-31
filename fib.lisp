(require "asdf")

(defpackage :rosalind-fib
  (:use :cl)) 

(in-package :rosalind-fib)

(defparameter *n* 36)
(defparameter *k* 2)

(defun fib (n)
  (labels ((fib-aux (n f1 f2)
                    (if (zerop n) f1
                      (fib-aux (1- n) f2 (+ (* *k* f1) f2)))))
          (fib-aux n 0 1)))

(defun solve ()
  (format t "~a~%" (fib *n*)))

#|

My first iteration was not tail-recursive, and clocked in at 0.3 sec/call!!
Significant speed-up when the recursion unfolds the right way :)

  seconds  |     gc     | consed | calls |  sec/call  |  name  
----------------------------------------------------
     0.000 |      0.000 |      0 |     1 |   0.000052 | ROSALIND-FIB::SOLVE
----------------------------------------------------
     0.000 |      0.000 |      0 |     1 |            | Total

|#
(solve)
