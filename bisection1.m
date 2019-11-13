a = 5;
b = -5;
c = 6;
d = -2;

f = @(x) a*x^3 + b*x^2 + c*x+d;
xl = 0;
xu = 1;
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
  
  fxm = f(xm);
  fxl = f(xl);
  printf("%f %f %f %f\n", xl, xu, xm, fxm);
  
  if c != 1
    ea=(abs(xm-oldxm)/xm);
    #printf("ea: %f\n",ea);
    if ea < 0.01
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
