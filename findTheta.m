function [theta] = findTheta(A)
theta=0;
[largest , row_ind , col_ind] = findLargestElement(A);

if(A(row_ind,col_ind) == (A(row_ind,row_ind) - A(col_ind,col_ind)) && largest == 0)
    theta = 0;
else
    X = (2*A(row_ind,col_ind))/(A(row_ind,row_ind) - A(col_ind,col_ind));
    %theta = atan(X)/2;
    theta = X;
end
end