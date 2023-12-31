;; Usual Lisp comments are allowed here

(defsystem "rosalind"
  :description "my rosalind solutions"
  :version "0.0.1"
  :author "Kyle Harrington <harintonkairu@gmail.com>"
  :licence "Public Domain"
  :depends-on ("alexandria" 
               "bt-semaphore" 
	       "cl-ppcre"
               "lparallel" 
               "magicl" 
               "serapeum"
               "trivia"
               "uiop")
  :components ((:file "dna")
	       (:file "rna")
	       (:file "revc")
	       (:file "fib")
	       (:file "gc")))

