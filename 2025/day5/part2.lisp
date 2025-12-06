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

(defun overlap-check (x y)
  (if (>= (cadr x) (car y)) t nil)
  )

(defun merge-two (x y)
  (list (car x) (max (cadr x) (cadr y)))
  )

(defun sort-list-by-car (n)
  (sort (copy-list n) #'(lambda (x y) (< (car x) (car y))))
  )

(defun merge-all (nums)
  (let* ((input (sort-list-by-car nums))
	(temp (list (car input))))

    (loop for x in (cdr input) do
      (let ((last (car temp)))

	(if (overlap-check last x)
	    (setf (car temp) (merge-two last x))
	    (push x temp)
	    )
	)     
	  )
    (sort-list-by-car temp)
    )
  )

(defun solve ()
  (let ((input '())
	(freshnum '())
	(sum 0)
	(temp '()))
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
		   )
	    )
      )
    ;;(format t "~a~%" freshnum)
    (setf temp (sort-list-by-car freshnum))
    (format t "~a~%" (merge-all temp))
    (setf freshnum (merge-all temp))

    (loop for i in freshnum do
      (incf sum (- (cadr i) (car i)))
      ;;since the ranges are inclusive add 1
      (incf sum 1)
      )

    ;;(format t "~a~%" input)
    (format t "~d~%" sum)
    ))
