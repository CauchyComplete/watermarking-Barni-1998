function out=zigzag(matrix)
[num_rows,num_cols]=size(matrix);
out=zeros(1,num_rows*num_cols);
cur_row=1;	cur_col=1;	cur_index=1;

%out(1)=in(1,1);
while cur_row<=num_rows & cur_col<=num_cols
	if cur_row==1 & mod(cur_row+cur_col,2)==0 & cur_col~=num_cols
		out(cur_index)=matrix(cur_row,cur_col);
		cur_col=cur_col+1;							%move right at the top
		cur_index=cur_index+1;
		
	elseif cur_row==num_rows & mod(cur_row+cur_col,2)~=0 & cur_col~=num_cols
		out(cur_index)=matrix(cur_row,cur_col);
		cur_col=cur_col+1;							%move right at the bottom
		cur_index=cur_index+1;
		
	elseif cur_col==1 & mod(cur_row+cur_col,2)~=0 & cur_row~=num_rows
		out(cur_index)=matrix(cur_row,cur_col);
		cur_row=cur_row+1;							%move down at the left
		cur_index=cur_index+1;
		
	elseif cur_col==num_cols & mod(cur_row+cur_col,2)==0 & cur_row~=num_rows
		out(cur_index)=matrix(cur_row,cur_col);
		cur_row=cur_row+1;							%move down at the right
		cur_index=cur_index+1;
		
	elseif cur_col~=1 & cur_row~=num_rows & mod(cur_row+cur_col,2)~=0
		out(cur_index)=matrix(cur_row,cur_col);
		cur_row=cur_row+1;		cur_col=cur_col-1;	%move diagonally left down
		cur_index=cur_index+1;
		
	elseif cur_row~=1 & cur_col~=num_cols & mod(cur_row+cur_col,2)==0
		out(cur_index)=matrix(cur_row,cur_col);
		cur_row=cur_row-1;		cur_col=cur_col+1;	%move diagonally right up
		cur_index=cur_index+1;
		
	elseif cur_row==num_rows & cur_col==num_cols	%obtain the bottom right element
        out(end)=matrix(end);							%end of the operation
		break										
    end
end