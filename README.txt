list is a Common Lisp library of various list types and other
structures built from them that obey the textbook concept of a list.
The need for this library stems from the fact that Lisp lists are in
fact a unique type that differs in some important ways from
traditional lists from computer science.

To illustrate, try the following:

(let* ((x (list 1))
       (y x))
  (pop x)
  (list x y))

The result will be:

(NIL (1))

Now imagine if you had tried analogous operations in, say, Python:

x = [1]
y = x
x.pop()
[x, y]

The result will be:

[[], []]

Or, imagine you want an API that needs to use lists as the underlying
data type, and it would be convenient to have these lists be modified
by the functions in the API.  With Common Lisp lists, you will
immediate run into a problem with this approach when you try to add a
value to an empty (NIL) list passed to a function, since the NIL
object is passed by its identity whereas the list functions for
mutating lists do not operate on NIL.  E.g.,

(defun insert (object list)
  (push object list))

(let* ((x nil))
  (insert 1 x)
  x)

The result will be:
NIL

Whereas the example from Python would be:

def insert(obj,lst):
    lst.append(obj)

x=[]
insert(1,x)
x

with the result being

[1]

The difference ultimately stems from the fact that Lisp lists are a
union/sum type of cons pairs and the single NULL object, NIL.  Since
cons pairs are mutable while NIL is immutable, it is fundamentally
impossible to mutate a cons pair into the empty list.  So, instead of
mutating the object, Lisp relies on changing the object stored in a
place rather than the object itself in the specific case of popping
the last element from a list.  This is a blemish from the perspective
of a list datatype, but has many advantages from the perspective of
the entire Lisp language, to the point that it almost never matters.

Almost never.

This library is for that one time you got stuck writing your fancy
algorithm when you realized that you popped the last element from a
list and somehow decoupled places that used to refer to the same
object.  This library is also for that time you actually needed a
double-linked list, or a true stack that can be emptied without
decoupling multiple references to that stack.
