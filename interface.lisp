(in-package :list)

(defgeneric head (x)
  ((:documentation "First element of a list")))

(defgeneric tail (x)
  ((:documentation "Last element of a list")))

(defgeneric content (x)
  ((:documentation "Content from current position in list")))

(defgeneric next! (x)
  ((:documentation "Sets content to next element.")))

(defgeneric prev! (x)
  ((:documentation "Sets content to previous element.")))

(defgeneric push-front! (object list)
  ((:documentation "Push to start of list")))

(defgeneric pop-front! (list)
  ((:documentation "Pop first element from list")))

(defgeneric push-back! (object list)
  ((:documentation "Push to end of list")))

(defgeneric pop-back! (object)
  ((:documentation "Pop last element from list")))

