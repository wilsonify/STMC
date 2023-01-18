      SUBROUTINE RMACAU(XR)
         !C Copyright, Bernd Berg, Sep 21, 2000.
         !C  CALCULATES CAUCHY DISTRIBUTED RANDOM NUMBERS (RELYING ON RANMAR(XR)).
         !C  PROBABILITY DENSITY: 1/[pi*(1+x**2)].
         use iso_c_binding
         implicit none
         real(c_double) :: XR,TPI

         CALL RANMAR(XR)
         XR=TAN(TPI*XR)
         RETURN
      END
