      FUNCTION BETA(A,B) bind(c,name="beta_")
C INCOMPLETE BETA FUNCTION
         use iso_c_binding
         real(c_double) :: A
         real(c_double) :: B
         BETA=EXP(GAMMA_LN(A)+GAMMA_LN(B)-GAMMA_LN(A+B))
         RETURN
      END
