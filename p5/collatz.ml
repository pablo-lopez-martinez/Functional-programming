let f n= if n mod 2 = 0 
  then n / 2
else 3*n + 1;;

let rec orbit n= if n==1
  then "1"
else string_of_int(n)^","^orbit(f n);;

let rec length n= if n==1
  then 0
else 1+length(f n);;

let rec top n= if n=1
  then 1
else max n (top(f n));;

let rec length'n'top n= if n=1
  then (0,1)
else let length,top=length'n'top (f n) in 1+length,max n top;;

let longest_in m n=
let rec aux (imax,lmax) i =
      if i > n then (imax,lmax)
      else let l = length i in
          if l > lmax then aux(i,l) (i+1)
          else aux (imax,lmax) (i+1)
  in
      aux (m, length m) (m+1);;

let highest_in m n=
let rec aux (imax,tmax) i =
  if i > n then (imax,tmax)
  else let t=top i in 
    if t > tmax then aux(i,t) (i+1)
    else aux (imax,tmax) (i+1)
  in 
    aux (m, top m) (m+1);;