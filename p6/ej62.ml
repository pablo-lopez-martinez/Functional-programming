let curry f a b=f(a,b);;
let uncurry f (a,b)= f a b;;

uncurry(+);; (*int * int -> int*)

let sum=(uncurry (+));; (*val sum : int * int -> int = <fun>*)

(*sum 1;;*) (*Error de tipo*)

sum (2,1);; (*int=3*)

let g=curry(function p->2* fst p + 3 * snd p);; (*val g : int -> int -> int = <fun>*)

(*g (2,5);;*) (*Error de tipo*)

let h= g 2;; (*val h : int -> int = <fun>*)

h 1, h 2, h 3;; (*int * int * int = (7, 10, 13)*)

let comp x y z= x (y z);;

let f = let square x=x * x in comp square ((+) 1);; (*val f: int -> int = <fun>*)

f 1, f 2, f 3;; (*(int*int*int)=(2, 5, 10)*)

let i x=x;; (*Una forma*)
let j (x,y)=x;; (*Una forma*)
let k (x,y)=y;; (*Una forma*)
let l x=[x];; (*Infinitas formas*)
