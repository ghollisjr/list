(in-package :list)

(defclass single-list ()
  ((data
    :initform nil
    :initarg :data)
   (current
    :initform nil)))

(defmethod initialize-instance :after ((list single-list) &key)
  (when (slot-value list 'data)
    (setf (slot-value list 'current)
          (car (slot-value list 'current)))))

(defun single-list (&rest data)
  (make-instance 'single-list :data data))

(defun slist (&rest data)
  (apply #'single-list data))

(defmethod print-object ((s single-list) stream)
  (with-slots (data) s
    (format stream "#L[s](~{~a~^ ~})"
            data)))

(defmethod head ((s single-list))
  (with-slots (data) s
    (car data)))

(defmethod next! ((s single-list))
  (with-slots (data current) s
    (if current
        (progn
          (setf current (cdr current))
          (values (car current)
                  t))
        (values nil nil))))
