(require "asdf")

(defpackage :rosalind-gc
  (:import-from :ppcre #:all-matches-as-strings #:register-groups-bind)
  (:import-from :trivia #:match)
  (:import-from :uiop #:read-file-string)
  (:use :cl)) 

(in-package :rosalind-gc)

(defparameter *data*
  (string-trim '(#\Linefeed) (read-file-string "rosalind_gc.txt")))

(defun count-letter (c dna-seq)
    (length (remove c dna-seq :test-not 'char=)))

(defun gc (dna)
  (let* ((dna-sanitized (remove #\Linefeed dna))
	 (dna-length (length dna-sanitized))
	 (c-count (count-letter #\C dna-sanitized))
	 (g-count (count-letter #\G dna-sanitized))
	 (c-or-g-count (+ c-count g-count)))
    (* 100.0 (float (/ c-or-g-count dna-length)))))

(defun parse (data)
  (let ((dna-seqs (all-matches-as-strings ">(\\w+_\\d+)\\s+([\\w\\s]+)" data))
	(assoc-list '()))
	(loop for dna-seq in dna-seqs
	      do (register-groups-bind
		     (label (#'gc gc-score))
		     (">(\\w+_\\d+)\\s+([\\w\\s]+)" dna-seq)
		   (push (cons label gc-score) assoc-list)))
    assoc-list))

(defun solve ()
  (let* ((gc-contents (parse *data*))
	 (sorted-by-gc-content (sort gc-contents #'> :key #'cdr))
	 (highest-gc-content (first sorted-by-gc-content)))
    (format t "~a~%~a~%"
	    (car highest-gc-content)
	    (cdr highest-gc-content))))
#|

  seconds  |     gc     |  consed | calls |  sec/call  |  name  
-----------------------------------------------------
     0.001 |      0.000 | 149,984 |     1 |   0.000666 | ROSALIND-GC::SOLVE
-----------------------------------------------------
     0.001 |      0.000 | 149,984 |     1 |            | Total

|#
(solve)
