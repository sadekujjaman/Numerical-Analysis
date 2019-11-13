## Copyright (C) 2011 Kmy Rojas
## 
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## totalpivotingprogram

## Author: Kmy Rojas <Kmy Rojas@KMYROJAS-VAIO>
## Created: 2011-10-30

function [ ret ] = totalpivotingprogram ()
[A,b,n]=matrixProgram;
h=increasedmatrixprogram(A,b,n);
v = 1:1:n;
for k=1:n-1
	row =k;
	column=k;
	mayor=0;
	for p=k:1:n 
		for r= k:n
			if abs(h(p,r))>mayor
				mayor=abs(h(p,r));
				row =p;
				column= r;
			end 
		end 
	end 
	if mayor==0 
		fprintf('the system doesn’t has unique solution')
		else if mayor ~=h(k,k)
				for y = k : n+1
					auxx = h(k,y);
					h(k,y) = h(row,y);
					h(row,y) = auxx;
				end 
			    for q=1:n
					auxx=h(q,k);
					h(q,k)=h(q, column);
					h(q, column)=auxx;
				end 
				aux2=vk;
				vk=v(column);
				v(column)=aux2;
		   end
	end
	for i=k+1:n
		mult=h(i,k)/h(k,k);
		for j=k:n+1
			h(i,j)=h(i,j)-mult(k)*h(k,j);
    	end 
	end 
	X(v(n))=h(n,n+1)/h(n,n);
	for i=n-1:-1:1
		acumm =0;
		for p=i+1:n
			acumm =acumm+h(i,p)*xp;
		end 
		xi= (h (i,(n+1))-acumm)/h(i,i);
	end 
end 
disp(x(i))
endfunction
