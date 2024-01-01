(require "asdf")

(defpackage :rosalind-hamm
  (:import-from :alexandria #:iota)
  (:import-from :listopia #:foldl)
  (:import-from :uiop #:read-file-lines)
  (:use :cl)) 

(in-package :rosalind-hamm)

(defparameter *data*
  (read-file-lines "rosalind_hamm.txt"))

(defun solve ()
  (let* ((a (first  *data*))
	 (b (second *data*))
	 (l (length a))
	 (hamming-dist
	   (foldl (lambda (acc x) (if (char= (char a x) (char b x))
				      acc (+ 1 acc))) 0 (iota l))))
    (format t "~a~%" hamming-dist)))
#|

  seconds  |     gc     | consed | calls |  sec/call  |  name  
----------------------------------------------------
     0.000 |      0.000 |      0 |     1 |   0.000038 | ROSALIND-HAMM::SOLVE
----------------------------------------------------
     0.000 |      0.000 |      0 |     1 |            | Total

|#
(solve)
