clc;
clear;
A = [1 1 1; 2 3 7; 1 3 -2;];
b = [3; 0; 17];
n = 3;

for i = 1 : n
  A(i, n + 1) = b(i);
endfor

for k = 1 : n - 1
  # find max
  maxi = k;
  maxa=0;
  for p = k :1: n
    if abs(A(p,k))> maxa
      maxa = abs(A(p,k));
      maxi = p;
    endif
  endfor
  
  # swap 
  if maxa == 0
    fprintf("System Does not has unique solution\n");
    else
      if maxa ~= A(k,k)
        for w = k : 1 : n + 1
          aux = A(k,w);
          A(k, w) = A(maxi, w);
          A(maxi, w) = aux;
        endfor
      endif
    endif
    
    # elimination
    for i = k + 1 : n
      div = A(i, k) / A(k, k);
      for j = k : n + 1
        A(i,j) = A(i,j) - (A(k,j)*div);
      endfor
    endfor
    
    # back substitution
    x(n) = A(n, n + 1) / A(n, n);
    for i = n - 1 : -1 : 1
      sum = 0;
      for j = i + 1 : 1 : n
        sum = sum + (A(i,j) * x(j));
      endfor
      x(i) = (A(i, n + 1) - sum) / A(i, i);
    endfor
  endfor
  disp(x);