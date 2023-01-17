      FUNCTION GAU_PD(X) bind(c,name="gau_pd_")
         !C COPYRIGHT BERND BERG, JUN 1, 1999.
         !C GAUSSIAN PROBABILITY DENSITY FUNCTION.
         use iso_c_binding
         implicit none
         real(c_double) :: GAU_PD,X
         real(c_double),parameter :: HALF=0.5,TWO=2.0,PI=3.14159
         GAU_PD=EXP(-HALF*X**2)/SQRT(TWO*PI)
         RETURN
      END
