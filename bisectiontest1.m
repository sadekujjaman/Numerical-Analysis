clc;
f = @(x)2.5*x.^2- 3 * x + 0.5;
#fplot(f,[-1, 2]);
#grid;

xl=0.3;
xu = 1.5;
fxl = f(xl);
fxu = f(xu);

if fxl * fxu > 0
  printf("Root is not exists in range %f to %f", xl, xu);
  return;
endif

es = 0.00001;
cnt = 0;
oldxm = 0;
while 1
  cnt = cnt + 1;
  xm = (xl + xu) / 2;
  fxm = f(xm);
  ea = abs(xm - oldxm) / xm;
  err(cnt)=ea;
  printf("%f %f %f %f %d\n", xl, xu, xm, ea, cnt);
  if fxm == 0
    printf("Root found at %f after %d iteration\n\n", xm, cnt);
    break;
  elseif ea < es
    printf("Root found at %f after %d iteration with less error\n\n", xm, cnt);
    break;
  endif
  oldxm = xm;
  if fxl * fxm > 0
    xl = xm;
  else
    xu = xm;
  endif
endwhile
plot(err);
