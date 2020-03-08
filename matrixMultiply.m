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