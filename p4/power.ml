let rec power x y=if y=0 then 1 else x* (power x (y-1));;

let rec power' x y=if y mod 2=0 then 
  if y=0 then 1 else power' (x*x) (y/2)
else 
  if y=0 then 1 else x*(power' (x*x) (y/2));;

(*Como podemos ver el tiempo de ejecucion de la segunda funcion desciende notablemente, en particular la diferencia es sustancial cuando el exponente es un numero elevado.
Esto se debe a que mientras que el numero de pasos en la primera funcion depende linearmente de n, en la segunda,
al ir diviendo entre dos el exponente, el numero de cálculos desciende de forma notoria. Esto provoca que su tiempo de ejecucion
aumente mas lentamente que la primera*)

let rec powerf (x:float) y=if y=0 then 1. else x*. (powerf x (y-1));;

print_endline(string_of_int(power 10 2));;