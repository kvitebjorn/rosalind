(defparameter *data*
  (uiop:read-file-string "rosalind_dna.txt"))

(defun count-letter (c)
    (length (remove c *data* :test-not 'char=)))

(setf As (count-letter #\A))
(setf Cs (count-letter #\C))
(setf Gs (count-letter #\G))
(setf Ts (count-letter #\T))

(format t "~a ~a ~a ~a~%" As Cs Gs Ts)
