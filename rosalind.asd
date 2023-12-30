;; Usual Lisp comments are allowed here

(defsystem "rosalind"
  :description "my rosalind solutions"
  :version "0.0.1"
  :author "Kyle Harrington <harintonkairu@gmail.com>"
  :licence "Public Domain"
  :depends-on ("alexandria" 
               "bt-semaphore" 
               "lparallel" 
               "magicl" 
               "serapeum"
               "trivia"
               "uiop")
  :components ((:file "dna")))
