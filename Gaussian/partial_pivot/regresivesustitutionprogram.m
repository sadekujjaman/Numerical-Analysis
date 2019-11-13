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

## regresivesustitutionprogram

## Author: Kmy Rojas <Kmy Rojas@KMYROJAS-VAIO>
## Created: 2011-10-23

function [ x ] = regresivesustitutionprogram (h,n)
x(n)= h(n, n+1)/h(n,n);
for i=n-1:-1:1
	acum = 0; 
	for p = i+1:n
		acum = acum + (h(i,p)*x(p));
	end
	x(i)= (h(i, n + 1) - acum)/h(i, i);
end
endfunction


  