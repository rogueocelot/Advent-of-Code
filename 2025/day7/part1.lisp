(defun solve ()
  (let ((sum 0)
	(last "..................................................................................................................................................")
	(next ".................................................................................................................................................."))
    (with-open-file (in "~/projects/Advent-of-Code/2025/day7/input.txt")
      (loop for line = (read-line in nil nil)
	    while line
	    do
	       (setf next line)
	       (loop for i from 0 to (- (length line) 1)
		     for c across line
		     do
			(cond
			  ((string= c "^")
			   (if (char= (aref last i) #\|)
			       (progn
				 (incf sum 1)
				 (setf (aref next (- i 1)) #\|)
				 (setf (aref next (+ i 1)) #\|)
				 )
			       )
			   )
			  
			  ((string= c "|")
			   ;;(format t "pow")
			   nil)
			  ((string= c ".")
			   (if (char= (aref last i) #\|)
			       (setf (aref next i) #\|)
			       )
			   )
			  )
		     )
	       (setf last next)
	    ))
	       
    (format t "~d~%" sum)
    ))

