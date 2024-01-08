function C_next = orientationDCM(C, u,omega)
         C_next = -crossV(omega) * C;
end