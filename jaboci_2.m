%M = [1 2 1 1 1 1;3 4 1 1 1 1;1 1 1 1 1 1;1 2 1 2 0 1;0 0 0 0 0 0;2 2 2 2 2 2];
%M = eye(15, 15);
M = randi([0 255], 6);
%R = imread('C:\Users\Param Raval\Documents\MATLAB\coen (1).bmp');

%M = rgb2gray(R);
n=6;
p=1;
q=2;
clc;
A = double(M)*double(M');
temp=A;
eigenvalues = eig(temp);
ittr = n*(n+1)/2;
for k = (1:ittr)
    %A=temp;
    max = temp(1,2);
    for i = (1:n)
        for j = (i + 1:n)
           if(abs(max)<abs(temp(i,j)))
             max = temp(i,j);
             p=i;
             q=j;                                  
           end
        end
    end
    p;
    q;
    %disp("P" + p);
    %disp("Q" + q);
    
    if temp(p,q)==0
        t=0;
    else
    w =(temp(q,q)-temp(p,p))/(2*temp(p,q));
    
    t = -(w + ((w*w +1)^0.5));
    end
    c = 1/(1 + t*t)^0.5;
    s = t/(1 + t*t)^0.5;
    
    %a11 = temp(p,p) - t*temp(p,q);
    %a22 = temp(q,q) + t*temp(p,q);
    
    P=eye(n,n);

    P(p,p) = c;
    P(q,q) = c;
    P(p,q) = s;
    P(q,p) = -s;
    
    D = P'*temp*P;
    temp = D;
    
    %disp("----------------------------------------------------------------------------------------" + k);
    
    %disp("D:");
    %disp(D);
end
temp;
diag(temp)
eigenvalues

sort(diag(temp))-sort(eigenvalues)
