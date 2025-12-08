(defun solve ()
  (let ((sum 1)
	(last "..................................................................................................................................................")
	(next "..................................................................................................................................................")
	(ways (make-list 150 :initial-element 0))
	(nextways (make-list 150 :initial-element 0)))

    (setf (nth 70 ways) 1)
    (setf (nth 70 nextways) 1)
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
				 ;;(incf sum 1)
				 (setf sum (* sum 2))
				 (setf (aref next (- i 1)) #\|)
				 (setf (aref next (+ i 1)) #\|)
				 (incf (nth (+ i 1) nextways) (nth i ways))
				 (incf (nth (- i 1) nextways) (nth i ways))
				 )
			       )
			   )
			  
			  ((string= c "|")
			   ;;(format t "pow")
			   (incf (nth i nextways) (nth i ways)))
			  ((string= c ".")
			   (if (char= (aref last i) #\|)
			       (progn
				 (setf (aref next i) #\|)
				 (incf (nth i nextways) (nth i ways))
				 )
			       )
			   )
			  )
		     )
	       ;;(format t "~s~%" nextways)
	       (setf last next)
	       (setf ways (copy-list nextways))
	       (setf nextways (make-list 150 :initial-element 0))

	    ))
    
    (setf sum (/ (reduce #'+ ways) 2))
    (format t "~d~%" sum)
    ))

