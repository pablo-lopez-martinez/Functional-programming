let rec divide l = match l with
  h1::h2::t -> let t1, t2 = divide t in (h1::t1, h2::t2)
  | _ -> l, [];;


let divide' l=
  let rec aux l1 l2= function
  h1::h2::t -> aux (h1::l1) (h2::l2) t
  | h::[] -> aux (h::l1) l2 []
  | _ -> (List.rev l1,List.rev l2) 
  in aux [] [] l;;
  

let rec merge = function
  [], l | l, [] -> l
  | h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, h2::t2)
                      else h2 :: merge (h1::t1, t2);;

let merge' f (l1, l2)=
  let rec aux (l1,l2) l3=match l1,l2 with
    [],l | l,[] -> List.rev_append l3 l
    | (h1::t1), (h2::t2)-> if f h1 h2 then aux (t1,h2::t2) (h1::l3)
                        else aux (h1::t1,t2) (h2::l3) 
  in aux (l1,l2) [];;

let rec msort1 l = match l with
  [] | _::[] -> l
  | _ ->  let l1, l2 = divide l in
          merge (msort1 l1, msort1 l2);;

(*Puede ocasionar stack overflow si el tamaño de la lista es demasiado elevado*)
let l2=let f x=Random.int 100 in List.init 700000 f;;


let rec msort2 f l=match l with
  [] | _::[] -> l
  | _-> let l1,l2=divide' l 
        in merge (msort2 f l1, msort2 f l2);;

      

