let rec powmod m b e=
  if e=0 then 1
  else let prod= powmod m (b mod m*b mod m) (e/2) in
  if e mod 2=0 then prod
  else (b mod m)*(prod) mod m;;

  

