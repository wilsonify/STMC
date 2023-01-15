      FUNCTION BETA(A,B) bind(c,name="beta_")
C INCOMPLETE BETA FUNCTION
         real :: A
         real :: B
         BETA=EXP(GAMMA_LN(A)+GAMMA_LN(B)-GAMMA_LN(A+B))
         RETURN
      END
