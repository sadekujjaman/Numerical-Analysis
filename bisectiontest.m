f = @(x)5*x^4-2.7*x^4-2*x+0.5;
xl = 0.1;
xr = 0.5;
fxl = f(xl);
fxr = f(xr);
if fxl * fxr > 0
  printf("Root is not in range %f %f\n\n",xl,xr);
  return;
endif

oldxm = 0;
cnt = 0;
es = 0.00001;
while 1
  cnt = cnt + 1;
  xm = (xl + xr) / 2;
  fxm = f(xm);
  if fxm == 0
    printf("Root is at %f and after %d iteration\n\n",xm, cnt);
    break;
  end
  ea = (xm - oldxm) / xm;
  if ea < es
    printf("Root is at %f and after %d iteration \n\n",xm, cnt);
    break;
  end
  printf("%f %f %f %f %d\n", xl, xr, xm, ea, cnt);
  oldxm = xm;
  if fxl * fxm > 0
    xl = xm;
  else
    xr = xm;
  end;
end