sz = [4,3];
default_input_matrix = string(int32(rand(sz(1), sz(2)) * 200 - 100));
labelsv = 'row '+string(1:sz(1));
labelsh = 'col '+string(1:sz(2));
rep = x_mdialog('Enter a matrix',...
                 labelsv, labelsh, default_input_matrix)
disp(rep)
