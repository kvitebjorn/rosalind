(require "asdf")

(defpackage :rosalind-dna  
  (:import-from :serapeum #:dict)
  (:import-from :uiop #:read-file-string)
  (:use :cl)) 

(in-package :rosalind-dna)

(defparameter *data*
  (string-trim '(#\Linefeed) (read-file-string "rosalind_dna.txt")))

(defun count-letter (c)
    (length (remove c *data* :test-not 'char=)))

(defun solve ()
  (let ((As (count-letter #\A))
	(Cs (count-letter #\C))
	(Gs (count-letter #\G))
	(Ts (count-letter #\T)))
  (format t "~a ~a ~a ~a~%" As Cs Gs Ts)))

(defun solve-with-loop ()
  (let ((dictionary (dict #\A 0 #\C 0 #\G 0 #\T 0)))
    (loop for char across *data* 
	  do (setf (gethash char dictionary) (+ 1 (gethash char dictionary))))
    (format t "~a ~a ~a ~a~%"
	    (gethash #\A dictionary)
	    (gethash #\C dictionary)
	    (gethash #\G dictionary)
	    (gethash #\T dictionary))))

#| 

Wow - I thought the dict loop would be faster, but it ain't!
      SOLVE is O(4n), and SOLVE_WITH-LOOP is O(n)
      ... REMOVE must do something fancy underneath the hood!

  seconds  |     gc     | consed | calls |  sec/call  |  name  
----------------------------------------------------
     0.000 |      0.000 |      0 |     1 |   0.000297 | ROSALIND-DNA::SOLVE-WITH-LOOP
     0.000 |      0.000 |  8,400 |     1 |   0.000119 | ROSALIND-DNA::SOLVE
----------------------------------------------------
     0.000 |      0.000 |  8,400 |     2 |            | Total

|#
(solve)
