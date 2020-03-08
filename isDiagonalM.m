a = [1 0 0; 0 1 0; 2 0 1];
st = isDiagonal(a, 3);
st

function status = isDiagonal(a,n)

    for i=1:n
        for j=1:n
            if(i==j)
            else
                if(a(i,j)==0)
                    status=true;
                else
                    status=false;
                    break;
                end
            end
        end
        if(status==false)
            break;
        end
    end
   
            
end