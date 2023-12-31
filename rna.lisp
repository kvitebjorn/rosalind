(require "asdf")

(defpackage :rosalind-rna
  (:import-from :uiop #:read-file-string)
  (:use :cl)) 

(in-package :rosalind-rna)

(defparameter *data*
  (string-trim '(#\Linefeed) (read-file-string "rosalind_rna.txt")))

(defun solve ()
  (format t "~a~%" (substitute #\U #\T *data*)))

#|

  seconds  |     gc     | consed | calls |  sec/call  |  name  
----------------------------------------------------
     0.000 |      0.000 |      0 |     1 |   0.000076 | ROSALIND-RNA::SOLVE
----------------------------------------------------
     0.000 |      0.000 |      0 |     1 |            | Total

|#

(solve)
