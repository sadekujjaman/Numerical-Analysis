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
  
  ## partialpivotingprogram
  
  ## Author: Kmy Rojas <Kmy Rojas@KMYROJAS-VAIO>
  ## Created: 2011-10-30
  
  function [ ret ] = partialpivotingprogram ()
    clc
    clear
    [A,b,n]=matrixProgram;
    h= increasedmatrixprogram (A,b,n);
    for k = 1: n-1
      fila = k;
      mayor=0;
      for p = k :1: n
        if abs(h(p,k))> mayor
          mayor = abs(h(p,k));
          fila = p;
        end
      end
      if mayor==0
        fprintf('system does not has unique solution');
        else
          if mayor ~= h(k,k)
            for w = k : n+1
              auxi = h(k,w);
              h(k,w) = h(fila,w);
              h(fila,w) = auxi;
            end
          end
        end
        for i=k+1:n
          multi(i,k)= h(i,k)/h(k,k);
          for j = k:n+1
            h(i,j)= h(i,j)-(multi(i,k)*h(k,j));
          end
        end
      end
      x =  regresivesustitutionprogram (h,n);
      disp(x)
    endfunction
    
    
