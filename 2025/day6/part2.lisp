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

(defun get-pos (strs n)
  (loop for str in strs 
	when (< n (length str))
	  collect (char str n)
	)
  )

(defun solve ()
  (let ((input '())
	(data '())
	(temp "")
	(nums '())
	(sum 0)
	(lastfunc "")
	(all-spaces 0))
    (with-open-file (in "~/projects/Advent-of-Code/2025/day6/input.txt")
      (loop for line = (read-line in nil nil)
	    for i from 0 to 4
	    while line
	    do
	       (push line input)

	    )
    (setf data (reverse input))
    (loop for i from 0 to (- (length (car data)) 1) do
      ;;set temp to the slice
      (setf temp (concatenate 'string (get-pos data i)))
      ;;if all-spaces is 0 it means our operator is at the end
      (if (= all-spaces 0)
	  (progn
	    (setf lastfunc (string(char temp (- (length temp) 1))))
	    (incf all-spaces 1)
	    )
			  )
      ;;if the whole row is spaces, calculate and reset
      (if (string= "" (string-trim '(#\Space) temp))
	  (progn
	    (setf all-spaces 0)
	    (push (str-to-func lastfunc) nums)
	    (incf sum (eval nums))
	    (setf nums '())
	    )
	  (progn
	    (push (parse-integer temp :junk-allowed t) nums)
	    )
	  )

      )

    (format t "~d~%" sum)
    )))

