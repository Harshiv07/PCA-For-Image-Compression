%I = imread('C:\Users\Param Raval\Documents\MATLAB\coen_grayscale.bmp');
%pc = jdev1(I);
function poc = main(vecIm)



end
pc = jdev1(M);
function pc = jdev1(M)

%M = rgb2gray(I);
n=32;
%M=randi([0 255],32);
%n=32;
A = zeros(32,32);
A= matrixMultiply(M,findTranspose(M));
%[V,E]=eig(A);
%covar = A;
%coeff=pcacov(A);
[row,col]=size(A);
eigenVectorMatrix = eye(row,col);

%eigenvalues=eig(A);
theta=0;
theta=findTheta(A);
[~,r,c]=findLargestElement(A);  
G=zeros(row,col);
for i=1:length(G)
    G(i,i)=1;
end
G(r,r)=cos(theta);
G(r,c)=-sin(theta);
G(c,r)=sin(theta);
G(c,c)=cos(theta);

D=matrixMultiply(matrixMultiply(findTranspose(G),A),G);
D=precision(D);
eigenVectorMatrix = eigenVectorMatrix*G;

for t = ~isDiagonal(D)
%while(~isDiagonal(D))
    [row,col]=size(D);
    theta=findTheta(D);
    [~,r,c]=findLargestElement(D);
    G=zeros(row,col);
    for i=1:length(G)
        G(i,i)=1;
    end
    G(r,r)=cos(theta);
    G(r,c)=-sin(theta);
    G(c,r)=sin(theta);
    G(c,c)=cos(theta);
    D=matrixMultiply(matrixMultiply(findTranspose(G),D),G);
    D=precision(D);
    eigenVectorMatrix = eigenVectorMatrix*G;
    
    
end
v = eigenVectorMatrix;
%size(D)
d = diag(D);
for i = (1:n)
    for j = (i:n)
        if(d(j)<d(i))
            tempe = d(j);
            d(j) = d(i);
            d(i) = tempe;
            tempv = v(:,j);
            v(:,j) = v(:,i);
            v(:,i) = tempv;
        end
    end
end
%disp('SORTED EIGENVECTORS');

pc = v;
%v
%A;
%coeff;
%V;
%{
disp('PCA RMS ERROR');
pc = pcacov(covar);
s = zeros(n,1);
for i = (1:n)
    s = s + ((abs(v(:,i))-abs(pc(:,i))).^2);
end
%errv = sqrt(s/n)




abs(sort(diag(D))-eigenvalues);
eigenvalues;
D;

disp('EIGENVALUES RMS ERROR');

di = abs(sort(diag(D)));
e = abs(sort(eigenvalues));

sum=0;
for i = (1:n)
    sum = sum + ((di(i)-e(i))^2);
end
err = sqrt(sum/n)

%}
%{
function [largest,row_index,col_index] = findLargestElement(A)

[row,col] = size(A);
largest = abs(A(1,2));
row_index = 1;
col_index = 2;
for n1 = 1:row
    for n2 = n1+1: col
        if( n1 ~= n2)            
            if(abs(A(n1,n2))>=largest)
                largest = abs(A(n1,n2));
                row_index = n1;
                col_index = n2;
            end
        end    
    end
end
end






function [theta] = findTheta(A)
[largest , row_ind , col_ind] = findLargestElement(A);

if(A(row_ind,col_ind) == (A(row_ind,row_ind) - A(col_ind,col_ind)) && largest == 0)
    theta = 0;
else
    X = (2*A(row_ind,col_ind))/(A(row_ind,row_ind) - A(col_ind,col_ind));
    %theta = atan(X)/2;
    theta = X;
end
end


function [multiplied_matrix,status] = matrixMultiply(A,B)

[row_A,col_A] = size(A);
[row_B,col_B] = size(B);

multiplied_matrix = zeros(row_A,col_B);
status = false;

if(col_A == row_B)
    status = true;
    for n1 = 1:row_A
        for n2 = 1:col_A
             sum = uint8(0);
             for k = 1:col_B
                sum = sum + A(n1,k)*B(k,n2);
             end
             multiplied_matrix(n1,n2) = sum;
        end
    end
end
end

function A = findTranspose(A)
[row,col]=size(A);
for ti=1:row
    for tj=1:col
        if(ti<tj)
            temp=A(ti,tj);
            A(ti,tj)=A(tj,ti);
            A(tj,ti)=temp;
        end
    end
    
end

end



function [result] = isDiagonal(A)
[row,col] = size(A);
cnt = 0;
for n1 = 1:row
    for n2 = 1:col
        if(n1~=n2)
            if(abs(A(n1,n2))>(10^-10))
                cnt = cnt + 1;
            end
        end
    end
end
if(cnt == 0)
    result = true;
else
    result = false;
end
end



function [A] = precision(A)

[row,col] = size(A);
for n1 = 1 : row
    for n2 = 1 : col
        if(abs(A(n1,n2))<= 10^-5)
            A(n1,n2) = 0;
        end
    end
end
end
%}
end
