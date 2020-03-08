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