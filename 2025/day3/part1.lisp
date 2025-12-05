;;finds the char in a string with the highest numerical value
;;returns index and the value
(defun find-largest-num (str)
  (let ((index 0)
	(largest 0))
  (loop for i from 0 below (length str)
	do
	   (if (> (digit-char-p (char str i)) largest)
	       (progn
		 (setf largest (digit-char-p (char str i)))
		 (setf index i)))
	)
    (values index largest)
    ))

(defun solve ()
  (let ((sum 0))
    (with-open-file (in "~/projects/Advent-of-Code/2025/day2/input.txt")
      (loop for line = (read-line in nil nil)
	    while line
	    do
	       ;;call the function to return the index of the largest char
	       ;;last char excluded because the second digit has to be to the right of it
	       (multiple-value-bind (i x) (find-largest-num (subseq line 0 (- (length line) 2)))
		 ;;get the second digit, from the index of the first num + 1 to the end
		 (multiple-value-bind (j y) (find-largest-num (subseq line (+ i 1) (- (length line) 1)))
		   ;;(format t "~a~a~%" x y)
		   (incf sum (+ (* x 10) y))
		    )
		 )
	    ))
    (format t "~d~%" sum)
    ))
