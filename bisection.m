a = 1;
b = -0.165;
c = 3.993;
d = 0.0001;

f = @(x) a*x^3 + b*x^2 + c*d;
xl = 0.0;
xu = 0.11;
c=0;
fxl = f(xl);
fxu = f(xu);
hasroot = false;
if fxl * fxu < 0
  hasroot = true
  printf("there is at least one root between %f and %f\n",xl, xu);
else
  printf("there is no root between %f and %f\n", xl, xu);
endif
oldxm = 0.0;
while 1
  c+=1;
  xm = (xl+xu)/2;
  printf("xm: %f\n", xm);
  
  fxm = f(xm);
  fxl = f(xl);
  if c != 1
    ea=(abs(xm-oldxm)/xm)*100.0;
    printf("ea: %f\n",ea);
    if ea < 5.0
      printf("root: %f\n", xm);
      break;
    endif
  endif
  if fxl*fxm > 0
    xl = xm;
  elseif fxl*fxm < 0
    xu = xm;
  endif
  oldxm=xm;
  #if c == 10
   # break;
  #endif
endwhile
