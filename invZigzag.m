% clc;
% clear variables;
% close all;
% 
% I = [1, 2, 4, 7, 5, 3, 6, 8, 10, 11, 9, 12];

function out = invZigzag(I, num_rows, num_cols)
% Iitialise the output matrix
% num_rows = 512;
% num_cols = 512;
out=zeros(num_rows,num_cols);
tot_elem=length(I);
cur_row=1;	cur_col=1;	cur_Idex=1;

% First element
%out(1,1)=I(1);

while cur_Idex<=tot_elem
	if cur_row==1 && mod(cur_row+cur_col,2)==0 && cur_col~=num_cols
		out(cur_row,cur_col)=I(cur_Idex);
		cur_col=cur_col+1;							%move right at the top
		cur_Idex=cur_Idex+1;
		
	elseif cur_row==num_rows && mod(cur_row+cur_col,2)~=0 && cur_col~=num_cols
		out(cur_row,cur_col)=I(cur_Idex);
		cur_col=cur_col+1;							%move right at the bottom
		cur_Idex=cur_Idex+1;
		
	elseif cur_col==1 && mod(cur_row+cur_col,2)~=0 && cur_row~=num_rows
		out(cur_row,cur_col)=I(cur_Idex);
		cur_row=cur_row+1;							%move down at the left
		cur_Idex=cur_Idex+1;
		
	elseif cur_col==num_cols && mod(cur_row+cur_col,2)==0 && cur_row~=num_rows
		out(cur_row,cur_col)=I(cur_Idex);
		cur_row=cur_row+1;							%move down at the right
		cur_Idex=cur_Idex+1;
		
	elseif cur_col~=1 && cur_row~=num_rows && mod(cur_row+cur_col,2)~=0
		out(cur_row,cur_col)=I(cur_Idex);
		cur_row=cur_row+1;		cur_col=cur_col-1;	%move diagonally left down
		cur_Idex=cur_Idex+1;
		
	elseif cur_row~=1 && cur_col~=num_cols && mod(cur_row+cur_col,2)==0
		out(cur_row,cur_col)=I(cur_Idex);
		cur_row=cur_row-1;		cur_col=cur_col+1;	%move diagonally right up
		cur_Idex=cur_Idex+1;
		
	elseif cur_Idex==tot_elem						%Iput the bottom right element
        out(end)=I(end);							%end of the operation
		break										%termIate the operation
    end
end