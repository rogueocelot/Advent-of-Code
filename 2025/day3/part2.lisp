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
    (values (+ index 1) largest)
    ))

(defun solve ()
  (let* ((sum 0)
	(index 0))
    (with-open-file (in "~/projects/Advent-of-Code/2025/day3/input.txt")
      (loop for line = (read-line in nil nil)
	    while line
	    do
	       (setf index 0)
	       (format t "~a~%~%" line)
	       ;;call the function to return the index of the largest char
	       ;;last char excluded because the second digit has to be to the right of it
	       (loop for i from 12 downto 0
		     do
			(format t "~a:~d:~d~%" (subseq line index (- (length line) i)) i index)
			(multiple-value-bind (n x) (find-largest-num (subseq line index (- (length line) i)))
			  (format t "~d|~d|~d~%" sum n index)
			  (format t "~d-~d~%" x (* x (expt 10 i)))
			  (incf index n)
			  (incf sum (* x (expt 10 (- i 1))))
			  )
		     )
	    ))
    (format t "~d~%" sum)
    ))
