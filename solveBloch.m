function [Mx, My, Mz] = solveBloch(B1, T1, T2, TR, TE, alpha, t)
% created by ChatGPT
    % Define the Bloch equations
    dMx_dt = (1/T2)*(-Mx + B1*My*cos(alpha));
    dMy_dt = (1/T2)*(-My - B1*Mx*cos(alpha));
    dMz_dt = (1/T1)*(Mx*sin(alpha) - Mz);
    
    % Use ode45 to solve the differential equations
    options = odeset('RelTol',1e-4,'AbsTol',1e-4);
    [~, M] = ode45(@(t,M) [dMx_dt; dMy_dt; dMz_dt], t, [1 0 0], options);
    Mx = M(:,1); My = M(:,2); Mz = M(:,3);
end
