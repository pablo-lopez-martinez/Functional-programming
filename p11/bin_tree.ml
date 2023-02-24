
type 'a bin_tree =
    Empty
  | Node of 'a * 'a bin_tree * 'a bin_tree
;;

let rec map_tree f = function 
  Empty -> Empty
  | Node (x,l,r) -> Node (f x,map_tree f l,map_tree f r);;

let rec fold_tree f a = function
    Empty -> a
  | Node (x, l, r) -> f x (fold_tree f a l) (fold_tree f a r)
;;

let sum t=
  let f x y z= x+y+z
  in fold_tree f 0 t;;

let prod t =
  let f x y z= x*.y*.z
  in fold_tree f 1. t;;

let size t= 
  let f x y z=y + z +1
in fold_tree f 0 t;;

let height t=
  let f x y z= 1 + (max y z)
in fold_tree f 0 t;;

let inorder t=
  let f x y z= y@[x]@z
in fold_tree f [] t;;

let mirror t=
  let f x y z= Node (x , z, y)
in fold_tree f Empty t;;

