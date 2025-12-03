;;str is input string, c is char to split by
(defun split (str c)
  (loop for i = 0 then (1+ pos)
	;;sets pos to index of the next instance of char starting from i
	;;nil if none found, ending loop
	for pos = (position c str :start i)
	;;collects substring from i to pos
	collect (string-trim " " (subseq str i pos))
	while pos))

;;oops its not mirrored, its repeated
;;keeping this in case for pt 2
(defun mirror (str)
  (let ((half (/ (length str) 2)))
    
   ;; (format t "~a~%~a~%~a~%" half (subseq str 0 (floor half)) (reverse (subseq str (ceiling half))))
  (if (string=
       (subseq str 0 (floor half))
       (reverse (subseq str (ceiling half))))
      (parse-integer str)
      0)
    ))

(defun repeated (str)
  ;;check if the first half of the string matches the second half
  (let ((half (/ (length str) 2)))
    (if (and
     (string=
       (subseq str 0 (floor half))
       (subseq str (ceiling half)))
     ;;any odd lengths cant be repeats
     (= half (floor half)))
      (parse-integer str)
      0)
  ))

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
			  ;;(format t "~a | ~a~%" tempstr (repeated tempstr))
			  (incf sum (repeated tempstr))
			  )
		     )
	  ))
    )
    ;;(format t "~a~%" input)
    (format t "~d~%" sum)
  ))
