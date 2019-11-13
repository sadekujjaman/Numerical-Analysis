clc;
clear;
A = [25 5 1; 64 8 1; 144 12 1];
n = 3;

I = eye(n);
L = eye(n);

for k = 1 : n - 1
  for i = k + 1 : n
    div = A(i,k) / A(k,k);
    L(i,k) = div;
    for j = k : n
      A(i,j) = A(i,j) - (A(k,j)*div);
    endfor
  endfor
endfor

U = A;
res = zeros(n);
for i = 1 : n
  # solve for Z -> [L][Z] = [C]
  for j = 1 : n
    C(j) = I(j,i);
  endfor
##  disp(C);
  
  Z(1) = C(1);
  for j = 2 : n
    sum = 0;
    for k = j - 1:-1:1
      sum = sum + (L(j,k) * Z(k));
    endfor
    Z(j) = C(j) - sum;
  endfor
##  disp(Z);
  # solve for X -> [U][X]=[Z]
  
  X(n) = Z(n) / U(n,n);
  for j = n - 1 : -1:1
    sum = 0;
    for k = j + 1 : n
      sum = sum + (U(j,k) * X(k));
    endfor
    X(j) = (Z(j) - sum) / U(j,j);
  endfor
  
  for j = 1 : n
    res(j,i) = X(j);
  endfor
##  disp(X);
endfor
disp(res);
