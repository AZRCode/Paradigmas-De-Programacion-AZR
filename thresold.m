clear, clc 
xA = [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
1 1 1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1
1 1 1 1 1 -1 -1 -1 -1 -1 -1 -1 -1
1 1 1 1 1 1 -1 -1 -1 -1 -1 -1 -1
-1 -1 -1 -1 1 1 1 -1 -1 -1 -1 -1 -1
-1 -1 -1 -1 -1 1 1 1 -1 -1 -1 -1 -1
-1 -1 -1 1 -1 -1 1 1 1 -1 -1 -1 -1
-1 -1 1 1 1 -1 -1 1 1 1 -1 -1 -1
-1 1 1 1 -1 -1 -1 -1 1 1 1 1 1
1 1 1 -1 -1 -1 -1 -1 -1 1 1 1 1
1 1 -1 -1 -1 -1 -1 -1 -1 -1 1 1 1];

x1 = reshape(xA,1,169)
x1
 
xB = [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 1
-1 -1 1 -1 -1 -1 -1 -1 -1 -1 1 -1 1
-1 -1 1 1 -1 -1 -1 -1 -1 1 -1 -1 1
-1 -1 1 -1 1 -1 -1 -1 1 -1 -1 -1 1
-1 -1 1 -1 -1 1 -1 1 -1 -1 -1 -1 1
-1 -1 1 -1 -1 -1 1 -1 -1 -1 -1 -1 1
-1 -1 1 -1 -1 1 -1 1 -1 -1 -1 -1 1
-1 -1 1 -1 1 -1 -1 -1 1 -1 -1 -1 1
-1 -1 1 1 -1 -1 -1 -1 -1 1 -1 -1 1
-1 -1 1 -1 -1 -1 -1 -1 -1 -1 1 -1 1
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 1
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1
];

x2 = reshape(xB,1,169)
%x2 
x1mul = x1(:) * x1(:)'; 
%x1mul 

x2mul = x2(:) * x2(:)'; 
%x2mul 

w1 = x1mul + x2mul; 
%w1 

w = w1 - diag(diag(w1)); 
%w 

% input ( valor a encontrar ) 

C = [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
1 1 1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1
1 1 1 1 1 -1 -1 -1 -1 -1 -1 -1 -1
1 1 1 1 1 1 -1 -1 -1 -1 -1 -1 -1
-1 -1 -1 -1 1 1 1 -1 -1 -1 -1 -1 -1
-1 -1 -1 -1 -1 1 1 1 -1 -1 -1 -1 -1
-1 -1 -1 1 -1 -1 1 1 1 -1 -1 -1 -1
-1 -1 1 1 1 -1 -1 1 1 1 -1 -1 -1
-1 1 1 1 -1 -1 -1 -1 1 1 1 1 1
1 1 1 -1 -1 -1 -1 -1 -1 1 1 1 1
1 1 -1 -1 -1 -1 -1 -1 -1 -1 1 1 1];

x = reshape(C,1,169)

%mul sum(w * x) 
u0 = x; 
c=1; 
%x 
ulast = x; 

while (1) 

u0 = u0 * w; 

% aplicar funcion de activacion thresold 
for i=1:1:169
if u0(i) > 0 
u0(i) = 1; 
else 
u0(i) = -1; 
endif 
endfor 
%c 
%u0 
%ulast 
if (u0 == ulast) 
fprintf(' encontrado \n'); 
%u0 
%ulast 
%c 
break; 
endif
c = c + 1; 
ulast = u0; 

end
u02 = reshape(u0, 13, 13)
u02

ulast02 = reshape(ulast,13,13)
ulast02