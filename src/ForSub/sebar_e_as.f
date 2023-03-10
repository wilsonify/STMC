      SUBROUTINE SEBAR_E_AS(N,PC,EBUP,EBDO)
         !C
         !C ERROR BAR FOR THE GAUSSIAN ERROR BAR.
         !C =================================
         !C INPUT:  NUMBER OF GAUSSIAN DATA, CONFIDENCE INTERVAL.
         !C OUTPUT: UPPER AND LOWER ERROR BAR LIMITS (ASYMPTOTIC FORMULA).
         !C
         use iso_c_binding
         implicit none
         real(c_double) :: PC,EBUP,EBDO,SDV,GAU_XQ
         real(c_double),parameter :: ZERO=0.0,HALF=0.5,ONE=1.0,TWO=2.0
         integer(c_int) :: N

         IF(PC.LE.ZERO) SDV=GAU_XQ(HALF*(ONE+0.68268949D00))
         IF(PC.GT.ZERO) SDV=GAU_XQ(HALF*(ONE+PC))
         EBUP=ONE+SDV/SQRT(TWO*(N-1))
         EBDO=ONE-SDV/SQRT(TWO*(N-1))
         RETURN
      END
