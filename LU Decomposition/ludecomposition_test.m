clc;
clear;
##A = [25 5 1; 64 8 1; 144 12 1];
##b = [106.8; 177.2; 279.2];
##n = 3;

A = [1 1 1; 2 3 7; 1 3 -2];
b = [3; 0; 17];
n = 3;


##for i = 1 : n
##  A(i, n + 1) = b(i);
##endfor
L = eye(n);
for k = 1 : n - 1
  
  for i = k + 1 : 1 : n
    div = A(i,k) / A(k,k);
    L(i,k) = div;
    for j = k : n
      A(i,j) = A(i,j)-(A(k, j) * div);
    endfor
  endfor
endfor

U = A;
##disp(L);
##disp(U);

# solve for Z - >[L][Z]=[C]

Z(1) = b(1);
for i = 2 : n
  sum = 0;
  for j = i - 1:-1:1
    sum = sum + (L(i,j) * Z(j));  
  endfor
  Z(i) = b(i) - sum;
endfor

##disp(Z);

# solve for X -> [U][X]=[Z]

X(n) = Z(n) / U(n,n);
for i = n - 1: -1: 1
  sum = 0;
  for j = i + 1:1:n
    sum = sum + (U(i,j)*X(j));
  endfor
  X(i) = (Z(i) - sum) / U(i,i);
endfor
disp(X);
