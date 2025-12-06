;;str is input string, c is char to split by
(defun split (str c)
  (loop for i = 0 then (1+ pos)
	;;sets pos to index of the next instance of char starting from i
	;;nil if none found, ending loop
	for pos = (position c str :start i)
	;;collects substring from i to pos
	collect (string-trim " " (subseq str i pos))
	while pos))

(defun has-char (str c)
  (null (null (find c str)))
  )

(defun trim (str)
  ;;if theres any whitespace (expect spaces) remove it
  (string-trim '(#\Newline #\Return #\Linefeed #\Tab) str)
  )
  
(defun solve ()
  (let ((input '())
	(freshnum '())
	(sum 0))
    (with-open-file (in "~/projects/Advent-of-Code/2025/day5/input.txt")
      (loop for line = (read-line in nil nil)
	    while line
	    do
	       (setf input (trim line))
	       ;;(format t "~a|~a|~a~%" input line freshnum)
	       (if (has-char input #\-)
		   (progn
		     (setf input (split input #\-))
		     (push (list
			    (parse-integer (car input))
			    (parse-integer (cadr input))) freshnum))
		   (if (string/= input "")
		       (loop for pair in freshnum
			     do
				(if (and (>= (parse-integer input) (car pair))
					 (<= (parse-integer input) (cadr pair)))
				    (progn
				      (incf sum 1)
				      (return nil)))
			     )
		       )
		   )
	    )
      
      )
    ;;(format t "~a~%" input)
    (format t "~d~%" sum)
    ))
