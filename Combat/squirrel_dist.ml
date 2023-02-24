


let jump (i,j) size=List.init size (fun k->(i,j+k+1))@
                    List.init size (fun k->(i+k+1,j))@
                    List.init size (fun k->(i-k-1,j))@
                    List.init size (fun k->(i,j-k-1));;

type table=
type node (tuple,antecesor,distance)                    

let valid (i,j) size tree path=
List.filter (fun x->List.mem x tree && not (List.mem x path)) (jump (i,j) size);;

let table=List.map(fun x -> (x,(0,0),0)) trees;;


let tour m n tree jump_length=
   


  