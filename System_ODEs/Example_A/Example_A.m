function [] = Example_A()
    % Solve this set of ODEs
    % x' = [  -1/10   3/40    x
    %          1/10   -1/5 ]  
    %
    % We can also write this as:
    % dx1dt = -1/10 x1 + 3/40 x2   and
    % dx2dt = 1/10 x1 - 1/5 x2
    % which is a useful form to use when putting the simulink model
    % together.
    % To solve this, we need to find the eigenvalues and eigenvectors
    % first.
    A  = [-1/10, 3/40; 
          1/10, -1/5];

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

    % Now, our initial conditions are x1(0) = -17 and x2(0) = -21.
    % Our general solution will be
    % y = A*Vector1*exp(lambda1*t) + B*Vector2*exp(lambda2)
    % We can solve for A and B by inverting the matrix
   x = inv(eigenvectors)*[-17; -21]
   
   % To make sense of this, I need to multiply
   disp('Meow')
   x(1)*eigenvectors(:,1)
   x(2)*eigenvectors(:,2)
   

   t = 0:0.01:10;
   x1 = x(1)*eigenvectors(1, 1)*exp(t.*eigenvalues(1,1)) + x(2)*eigenvectors(1, 2)*exp(t.*eigenvalues(2,2));
   x2 = x(1)*eigenvectors(2, 1)*exp(t.*eigenvalues(1,1)) + x(2)*eigenvectors(2, 2)*exp(t.*eigenvalues(2,2));

   % Plot the solution
   plot(t, x1, 'b')
   hold on
   plot(t, x2, 'r')

end