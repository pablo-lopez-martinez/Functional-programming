(*let rec to0from n =
if n < 0 then [] else n :: to0from (n-1);;*)

let to0from n=
  if n>=0 then List.init (n+1) (fun x-> n-x)
  else [];;
  
(*let rec fromto m n =
if m > n then [] else m :: fromto (m+1) n;;*)

let fromto m n=
   List.init (n-m+1) (fun x-> m+x);;

(*let incseg l =
List.fold_right (fun x t -> x::List.map ((+) x) t) l [];;*)

let incseg l =let rec aux l2=function 
    [] | [_] -> List.rev l2
    | h1::h2::t -> aux (h1+h2::l2) (h1+h2::t)
in aux [] (0::l);;
   
(*let rec remove x = function
  [] -> []
  | h::t -> if x = h then t else h :: remove x t;;*)

let remove x l1= 
  let rec aux l2 = function 
    []-> l1
    | h::t -> if x=h then List.rev_append l2 t
              else aux (h::l2) t
  in aux [] l1;;

(*let rec compress = function
| h1::h2::t -> if h1 = h2 then compress (h2::t)
else h1 :: compress (h2::t)
| l -> l;;*)

let compress l1=
  let rec aux l2= function 
    []-> List.rev l2
    | [h]-> aux (h::l2) []
    | h1::h2::t -> if (h1=h2) then aux l2 (h2::t)
                   else aux (h1::l2) (h2::t)
  in aux [] l1;;
