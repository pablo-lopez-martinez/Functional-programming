let is_prime n =
  let rec check_from i =
  i >= n ||
  (n mod i <> 0 && check_from (i+1))
  in check_from 2;;

let rec last_prime_to n =
  if (is_prime n) then n else last_prime_to (n-1);;  

let rec next_prime n =
  if (is_prime n) then n 
  else next_prime (n+1);;

  let is_prime2 (n:int) =
    let rec check_from (i) =
    i >= (sqrt (float_of_int(n))+.1.) ||
    (n mod int_of_float (i) <> 0 && check_from (i+.1.))
    in check_from 2.;;

print_endline(string_of_bool(is_prime2(1000000007)));;
print_endline(string_of_bool(is_prime(1000000007)));;
