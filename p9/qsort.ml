let rec qsort1 ord= function  
  [] -> []
  | h::t -> let after, before= List.partition (ord h) t in
            qsort1 ord before @ h::qsort1 ord after;;

let rec qsort2 ord =
  let append' l1 l2 = List.rev_append (List.rev l1) l2 in
    function
      [] -> []
      | h::t -> let after, before = List.partition (ord h) t in
              append' (qsort2 ord before) (h :: qsort2 ord after);;        
              
(*Ya que qsort2 utiliza funciones terminales como rev_append y rev nos da 
   el beneficio de ordenar cantidades mas largas de numeros que las que podriamos 
   ordenador con qsort1*)

let l1=let f x=Random.int 100 in List.init 700000 f;;

(*qsort2 es menos eficiente que qsort1 cuando la lista está inicializada 
   de una forma diferente a ascentemente.
   Lo que da lugar a que en esos casos qsort2 sea un 96.7% más lento de media.*)
