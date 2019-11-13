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

## Gaussianelimination

## Author: Kmy Rojas <Kmy Rojas@KMYROJAS-VAIO>
## Created: 2011-10-18

function [ ret ] = Gaussianelimination()
clc
clear
[A,b,n]=matrixProgram;
m= increasedmatrixprogram (A,b,n);
m= elimination (m,n);
x= regresivesustitutionprogram(m,n);
disp(x)
endfunction
