let f1 n=(function true->n/2 | false->n*2) (n mod 2=0);;

let f2 n=(function true->"Es par" | false->"Es impar") (n mod 2=0);;

let f3 n=(function true->"Es multiplo de 2" | false -> (function true->"Multiplo de 3" | false->"Impar") (n mod 3=0)) (n mod 2=0);;
