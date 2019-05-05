function output = inv_zigzag(vector, num_rows, num_cols)

% initializing variables
cur_col = 1;
cur_row = 1;
vmin = 1;
hmin = 1;
output = zeros(num_rows, num_cols);
i = 1;

while ((cur_row <= num_rows) & (cur_col <= num_cols))

    if (mod(cur_col + cur_row, 2) == 0)                % going up

        if (cur_row == vmin)
            output(cur_row, cur_col) = vector(i);

            if (cur_col == num_cols)
	      cur_row = cur_row + 1;
	    else
              cur_col = cur_col + 1;
            end

            i = i + 1;

        elseif ((cur_col == num_cols) & (cur_row < num_rows))
            output(cur_row, cur_col) = vector(i);
            i;
            cur_row = cur_row + 1;
            i = i + 1;

        elseif ((cur_row > vmin) & (cur_col < num_cols))
            output(cur_row, cur_col) = vector(i);
            cur_row = cur_row - 1;
            cur_col = cur_col + 1;
            i = i + 1;
        end
        
    else                                   % going down

       if ((cur_row == num_rows) & (cur_col <= num_cols))
            output(cur_row, cur_col) = vector(i);
            cur_col = cur_col + 1;
            i = i + 1;
        
       elseif (cur_col == hmin)
            output(cur_row, cur_col) = vector(i);

            if (cur_row == num_rows)
	      cur_col = cur_col + 1;
	    else
              cur_row = cur_row + 1;
            end

            i = i + 1;

       elseif ((cur_row < num_rows) & (cur_col > hmin))
            output(cur_row, cur_col) = vector(i);
            cur_row = cur_row + 1;
            cur_col = cur_col - 1;
            i = i + 1;
       end

    end

    if ((cur_row == num_rows) & (cur_col == num_cols))
        output(cur_row, cur_col) = vector(i);
        break
    end

end