      FUNCTION GAU_PD(X) bind(c,name="gau_pd_")
         !C COPYRIGHT BERND BERG, JUN 1, 1999.
         !C GAUSSIAN PROBABILITY DENSITY FUNCTION.
         use iso_c_binding
         implicit none

         GAU_PD=EXP(-HALF*X**2)/SQRT(TWO*PI)
         RETURN
      END
