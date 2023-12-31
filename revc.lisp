(require "asdf")

(defpackage :rosalind-revc
  (:import-from :trivia #:match)
  (:import-from :uiop #:read-file-string)
  (:use :cl)) 

(in-package :rosalind-revc)

(defparameter *data*
  (string-trim '(#\Linefeed) (read-file-string "rosalind_revc.txt")))

(defun dna-complement (c)
  (match c
    (#\A #\T)
    (#\T #\A)
    (#\C #\G)
    (#\G #\C)))

(defun solve ()
  (format t "~a~%" (reverse (map 'string #'dna-complement *data*))))

#|

  seconds  |     gc     | consed | calls |  sec/call  |  name  
----------------------------------------------------
     0.000 |      0.000 | 46,304 |     1 |   0.000051 | ROSALIND-REVC::SOLVE
----------------------------------------------------
     0.000 |      0.000 | 46,304 |     1 |            | Total

|#
(solve)
