let rec remove a l= match l with
  []-> []
  | h::t -> if (a=h) then t
  else h::(remove a t);;

let rec remove_all a l=match l with 
  []-> []
  | h::t -> if (a=h) then remove_all a t
  else h::(remove_all a t);;

let rec ldif l1=function
  [] -> l1
  | h::t -> ldif (remove_all h l1) t;;

let lprod l1 l2=
  List.flatten(List.map (fun x -> List.map(fun y -> (x,y)) l2)l1);;


let rec divide = function 
    h1::h2::t -> let t1,t2=divide t in h1::t1,h2::t2
    | l -> l,[];;k