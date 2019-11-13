clc;
#f = @(x)2.5*x.^2 - 3 * x + 0.5;
#fplot(f,[0,2]);
#grid;
f = @(x)x.^3-0.165 * x .^2 + 3.993 * 10.^-4;
fplot(f,[0, 0.1]);
xl = 0;
xu = 0.11;
fxl = f(xl);
fxu = f(xu);

if fxl * fxu > 0
  printf("Root doesn't exist between %f %f", xl, xu);
  return;
endif
cnt = 0;
maxcnt = 20;
es = 0.00001;
oldxm = 0;

while 1
  cnt = cnt + 1;
  fxl = f(xl);
  fxu = f(xu);
  xm = ((xu * fxl) - (xl * fxu)) / (fxl - fxu);
  fxm = f(xm);
  ea = (xm - oldxm) / xm;
  err(cnt) = ea;
  printf("%f %f %f %f %d\n", xl, xu, xm, ea, cnt);
  if fxm == 0
    printf("Root exists at %f after %d iteration", xm, cnt);
    break;
  elseif ea < es
    printf("Root exists at %f after %d iteration with minimized error", xm, cnt);
    break;
  endif
  if fxl * fxm > 0
    xl = xm;
  else
    xu = xm;
  endif
  if cnt > maxcnt
    break;
  endif
endwhile

#plot(err);
