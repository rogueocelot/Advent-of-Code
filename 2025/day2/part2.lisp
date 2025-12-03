;;str is input string, c is char to split by
(defun split (str c)
  (loop for i = 0 then (1+ pos)
	;;sets pos to index of the next instance of char starting from i
	;;nil if none found, ending loop
	for pos = (position c str :start i)
	;;collects substring from i to pos
	collect (string-trim " " (subseq str i pos))
	while pos))

;;divide string into n chunks
(defun div (str n)
  (loop for i from 0 below n
	;;each chunk goes from i * chunk size to i+1 * chunksize
	collect (subseq str (* i (/ (length str) n)) (* (+ 1 i) (/ (length str) n)))
	)
  )

;;check if all strings in a list are the same
(defun same (strlist)
  ;;if null return nil
  (if (null (car strlist)) (return-from same nil))
  (if (null (cdr strlist)) (return-from same nil))
  (let* ((firststr (car strlist)))
    ;;(format t "~a : ~a~%" strlist firststr)
    ;;every checks the lambda function for all strings in the list
     (every #'(lambda (s) (string= firststr s)) (cdr strlist))
  ))

(defun repeated (str n)
  ;;(format t "~a | ~a~%" str n)
  (cond
    ;;if n is 0 then there wasnt a match
    ((< n 1)
     (return-from repeated 0))
    ;;if theres only one character then it counts
    ((= (length str) 1) (return-from repeated (parse-integer str)))
    ;;if the string doesnt cleanly divide by n keep going
    ((/= (floor (/ (length str) n)) (/ (length str) n))
     (repeated str (- n 1)))
    ;;if it cleanly divides test it
    (t
     ;;get our chunks and compare
     (let* ((strlist (div str n)))
       (if (same strlist)
	   (progn
	     ;;(format t "~a<--------~%" str)
	     (return-from repeated (parse-integer str))
	     )
	   (repeated str (- n 1))
	   )  		     )
     )
   )
  )

(defun solve ()
  (let ((input '())
	(sum 0))
  (with-open-file (in "~/projects/Advent-of-Code/2025/day2/input.txt")
    (loop for line = (read-line in nil nil)
	  while line
	  do 
	     (setf input (split line #\,))
	  )
    (loop for i in input
	  do
	     ;;(format t "~a~%" i)
	     (let ((temp (split i #\-)))
	       (loop for j from (parse-integer (car temp)) to (parse-integer (car (cdr temp)))
		     do
			(let ((tempstr (format nil "~a" j)))
			  ;;(if (< 0 (repeated tempstr (length tempstr)))
			  ;;    (format t "~a~%" tempstr))
			  (if (> (length tempstr) 1)
			      (incf sum (repeated tempstr (length tempstr)))
			      )
			  )
		     )
	  ))
    )
    ;;(format t "~a~%" input)
    (format t "~d~%" sum)
  ))
