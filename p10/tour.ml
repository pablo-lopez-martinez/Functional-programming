let jump (i,j) size=List.init size (fun k->(i,j+k+1))@
                    List.init size (fun k->(i+k+1,j))@
                    List.init size (fun k->(i-k-1,j))@
                    List.init size (fun k->(i,j-k-1));;
                      
let valid (i,j) size tree path=
  List.filter (fun x->List.mem x tree && not (List.mem x path)) (jump (i,j) size);;


let tour m n tree jump=
  let rec complete path=function
   []->raise Not_found
   |h::t-> if h=(m,n) then List.rev (h::path)
           else try complete (h::path) (valid h jump tree path) with
                Not_found-> complete path t
  in if List.mem (1,1) tree then complete [] [(1,1)]
         else raise Not_found;;