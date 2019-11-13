clc;
clear;
A = [1 1 1; 2 3 7; 1 3 -2];
b = [3; 0; 17];
n = 3;

for c = 1 : n
  A(c, n+1)=b(c);
endfor

for k = 1 : n - 1
  for i = k + 1 : n
    m(i,k) = A(i,k)/A(k,k);
    for j = k:n+1
      A(i,j)=A(i,j)-(m(i,k)*A(k,j));
    endfor
  endfor
endfor

m = A;
x(n)= m(n, n+1)/m(n,n);
for i=n-1:-1:1
	acum = 0; 
	for p = i+1:n
		acum = acum + (m(i,p)*x(p));
	end
	x(i)= (m(i, n + 1) - acum)/m(i, i);
end

disp(x);
L = eye(n);
disp(L);
