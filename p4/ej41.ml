let rec sum_cifras x= if x<10 then x else x mod 10+ sum_cifras(x/10);;

let rec num_cifras n= if n<10 then 1 else 1+num_cifras(n/10);;

let rec exp10 n= if n=0 then 1 else 10*(exp10(n-1));;

let rec reverse x=if x=0 then 0 else exp10((num_cifras x)-1)*(x mod 10)+ reverse(x/10);;

let palindromo (s:string) =
  let rec check_from i j=
    i>=j || (s.[i]=s.[j] && check_from (i+1) (j-1))
  in check_from 0 ((String.length s) - 1);;


let palindromo (s:string) =
  let rec check_from i j=
    if i>=j then true else 
      (s.[i]=s.[j] && check_from (i+1) (j-1))
    in check_from 0 ((String.length s) -1);;
