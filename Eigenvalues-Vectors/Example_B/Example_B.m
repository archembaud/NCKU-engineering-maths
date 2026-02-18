function [] = Example_B()
    % Find the eigenvalues and vectors of this matrix
    A  = [0, 1, 1; 
          1, 0, 1;
          1, 1, 0];

    % Use MATLAB's built in function eig() to solve these
    [eigenvectors, eigenvalues] = eig(A);

    % Show these one at a time
    for i = 1:1:length(A)
        S = sprintf('---- Eigenvalue %d and its associated Eigenvector ----', i);
        disp(S);
        eigenvalue = eigenvalues(i,i)
        eigenvector = eigenvectors(:,i)
        % The eigenvalues returned by default in Matlab are normalized
        % such that the magnitude of the eigenvector is 1.
        % This can be demonstrated using:
        sum(eigenvector.^2)
    end

end