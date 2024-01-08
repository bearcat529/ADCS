% FIXME: Update equations below to include off axis inertia terms

function omega_next = eulersEquations(omega, M, param)
%         I_xx = .025;
%         I_yy = .025;
%         I_zz = .005;
        I_xx = param(1);
        I_yy = param(2);
        I_zz = param(3);

        M_x = M(1);
        M_y = M(2);        
        M_z = M(3);
        
        omega_next(1) = (1/I_xx)*(M_x-((I_yy - I_zz) * omega(3) * omega(2)));
        omega_next(2) = (1/I_yy)*(M_y-((I_zz - I_xx) * omega(3) * omega(1)));   
        omega_next(3) = (1/I_zz)*(M_z-((I_xx - I_yy) * omega(1) * omega(2)));
end