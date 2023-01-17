      SUBROUTINE GAUDIF(XM1,EB1,XM2,EB2,Q) bind(c, name="gaudif_")
         !C BERG, JUNE 13, 1999.
         !C COMPARISION OF TWO MEANS: (GAUSSIAN DIFFERENCE TEST).
         !C INPUT: TWO GAUSSIAN DATA POINTS, MEAN VALUES AND ERROR BARS.
         !C OUPUT: LIKELIHOOD Q  THAT THE DISCREPANCY IS DUE TO CHANCE.
         use iso_c_binding
         implicit none
         real(c_double) :: XM1,EB1,XM2,EB2,Q,SIGMA,XX,ERROR_F
         real(c_double),parameter :: TWO=2.0,ONE=1.0
         SIGMA=SQRT(EB1**2+EB2**2)
         XX=+ABS(XM1-XM2)/(SIGMA*SQRT(TWO))
         Q=ONE-ERROR_F(XX)
         RETURN
      END
