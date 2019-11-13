clc;
f = @(x)2.5 * x.^2 - 3 * x + 0.5;

xi = 0.3;
xii = 0.4;
fplot(f, [0, 2]);
#grid;

cnt =  0;
es = 0.00001;
r = 0;
while 1
  fxii = f(xii);
  fxi = f(xi);
  xiii = xii - ((fxii * (xii - xi)) / (fxii - fxi));
  error(++cnt) = abs(xiii - xii)/ xiii;
  if error(cnt) < es 
    disp(xiii);
    r++;
    if(r == 2)
      break;
    endif
  endif
  xi = xii;
  xii = xiii;
endwhile
#plot(error);
