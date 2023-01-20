      FUNCTION BETA(A,B) bind(c,name="beta_")
C INCOMPLETE BETA FUNCTION
         use iso_c_binding
         implicit none
         real(c_double) :: A,B,BETA,GAMMA_LN
         BETA=EXP(GAMMA_LN(A)+GAMMA_LN(B)-GAMMA_LN(A+B))
         RETURN
      END
