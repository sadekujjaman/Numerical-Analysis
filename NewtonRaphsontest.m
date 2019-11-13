f = @(x)2.5*x.^2- 3 * x + 0.5;
fdiff = @(x)5*x - 3;
xi = 0;
es = 0.00001;
n = 0;
while 1
  fxi = f(xi);
  fdiffi = fdiff(xi);
  xii = xi - (fxi/fdiffi);
  error(++n) = (abs(xii - xi) / xii);
  
  if error(n) < es
    disp(xii);
    break;
  endif
  
  xi = xii;
  
endwhile

plot(error);
