let hd= function
  []->raise(Failure "hd")
  | h::t-> h;;

let tl= function
  []->raise(Failure "tl")
  | h::t-> t;;

let length l=
  let rec aux len = function
  [] -> len
  | h::t -> aux (len+1) t
  in aux 0 l;;

let rec compare_lengths l1 l2= match l1,l2 with 
  ([],[]) -> 0
  | ([],h::t) -> -1
  | (h::t,[]) -> 1
  | (_::t1,_::t2) -> compare_lengths t1 t2;;

let rec nth l i=
  if (l=[]) then raise (Failure "nth")
  else if (i==0) then hd(l)
  else if (i<0) then  raise (Invalid_argument "nth")
  else nth (tl l)(i-1);;


let rec append l1 l2=match l1 with
  [] -> l2
  | h::t -> h::(append t l2);;

(*----------------------------------------------------------*)

let rec find f=function 
  []-> raise (Not_found)
  | h::t -> if (f h) then h else find f t;;

let rec for_all f=function 
  []-> true
  | h::t -> (f h) && (for_all f t);;

let rec exists f= function 
  []-> false
  | h::t -> (f h) || exists f t;;

let rec mem i=function 
  []->false
  | h::t -> (h=i) || mem i t;;

(*Declared here in order to use them in the rest of the code*)
let rev l=
  let rec aux l1 l2=match l1 with
  []-> l2
  | h::t -> aux t (h::l2)
  in aux l [];;

let filter f l=
  let rec aux l1 =function 
  []-> rev l1
  | h::t -> if (f h) then aux (h::l1) t
            else aux l1 t
  in aux [] l;;

let find_all=filter;;

let partition f l=
  let rec aux l1 l2=function 
  []-> (rev l1, rev l2)
  | h::t -> if (f h) then aux (h::l1) l2 t
            else aux l1 (h::l2) t
  in aux [] [] l;;

let split l=
  let rec aux l1 l2=function 
    []-> (rev l1, rev l2)
    | (a,b)::t -> aux (a::l1) (b::l2) t
  in aux [] [] l;;

let rec combine l1 l2=
  match l1,l2 with
  [],[]-> []
  | h1::t1,h2::t2-> (h1,h2)::(combine t1 t2)
  | _-> raise (Invalid_argument "combine");;
(*--------------------------------------------------------*)

let init len f=
  if len<0 then raise (Invalid_argument "init")
  else let rec aux l1 i= 
          if i=len then rev l1
          else aux (f i::l1) (i+1)
        in aux [] 0;;

let rec rev_append l1 l2=match l1 with 
        []-> l2
        | h::t -> rev_append t (h::l2);;

let rec concat=function
  []-> []
  |h::t -> append h (concat t);;

let flatten=concat;;

let map f l=
  let rec aux l1=function
    []-> rev l1
    | h::t -> aux ((f h)::l1) t
  in aux [] l;;

let rev_map f l=
  let rec aux l1=function
    []-> l1
    | h::t -> aux ((f h)::l1) t
  in aux [] l;;

let rec map2 f l1 l2= match l1,l2 with 
  [],[] -> []
  | h1::t1,h2::t2 -> (f h1 h2)::(map2 f t1 t2)
  |_ -> raise (Invalid_argument "map2");;

let rec fold_left f l=function
  [] -> l
  | h::t -> fold_left f (f l h) t;;

let rec fold_right f l1 l2=match l1 with 
  [] -> l2
  | h::t -> f h (fold_right f t l2);; 


(*--------------------------------------------------------*)





  
  




  
  