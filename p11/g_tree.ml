type 'a g_tree =
  Gt of 'a * 'a g_tree list
;;

let rec size = function 
    Gt (_, []) -> 1
  | Gt (r, h::t) -> size h + size (Gt (r, t))
;;

let rec height= 
  let rec list_max n=function
    []->n
    | h::t -> let height1=height h in 
    if height1>n then list_max height1 t
    else list_max n t 
  in function 
  Gt (_,[]) -> 1
  | Gt (_,l) -> 1+list_max 0 l;;

let rec leaves = function
  Gt (r,[]) -> [r]
  | Gt (r,l) -> List.flatten (List.map leaves l);;

let rec mirror = function 
  Gt (r,[]) -> Gt (r,[])
  | Gt (r,l) -> Gt (r,List.rev (List.map mirror l));;

let rec preorder=function
  Gt (r,[]) -> [r]
  | Gt (r,l) ->r::List.flatten (List.map preorder l);; 

let rec postorder=function 
  Gt (r,[]) -> [r]
  | Gt (r,l) -> List.flatten(List.map postorder l)@[r];;

