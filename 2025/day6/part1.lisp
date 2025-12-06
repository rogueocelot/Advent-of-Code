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

(defun str-to-func (str)
  (cond
    ((string= str "*") '*)
    ((string= str "/") '/)
    ((string= str "+") '+)
    ((string= str "-") '-)
    (t str))
  )

(defun solve ()
  (let ((input '())
	(data '())
	(sum 0))
    (with-open-file (in "~/projects/Advent-of-Code/2025/day6/input.txt")
      (loop for line = (read-line in nil nil)
	    while line
	    do
	       (setf input (split (trim line) #\Space))
	       (setf input (remove-if (lambda (x) (string= x "")) input))

	       ;;if its the symbol line, parse it to functions
	       ;;if not, parse it to ints
	       (if (has-char (car input) #\*)
		   (setf input (mapcar #'str-to-func input))
		   (setf input (mapcar #'parse-integer input)))

	       
	       ;;merge each number into its appropriate list column
	       (if (null data)
		   (progn
		     (setf data (mapcar #'list input))
		     )
		   (progn
		     ;;(setf data (merge-into-list data input))
		     (setf data (mapcar #'append data (mapcar #'list input)))
		     ))
	    )
      
      )

    ;;
    (loop for i in data do
      (incf sum (eval (reverse i)))
      )

    (format t "~d~%" sum)
    ))

