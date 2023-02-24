
open Bin_tree;;

let rec insert_tree ord x = function 
  Empty -> Node (x, Empty,Empty)
  Node (y,Empty,Empty)
  Node (y,l,r) -> if (y ord x) then insert_tree ord x

let tsort ord l =
  inorder (List.fold_left (fun a x -> insert_tree ord x a) Empty l)
;;

