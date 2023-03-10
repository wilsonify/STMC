      SUBROUTINE SEBAR_E(N,PC,EBUP,EBDO)
         ! C ERROR BAR FOR THE GAUSSIAN ERROR BAR.
         ! C =================================
         ! C INPUT:   NUMBER OF GAUSSIAN DATA, CONFIDENCE INTERVAL.
         ! C OUTPUT:  UPPER AND LOWER ERROR BAR LIMITS (EXACT).
         use iso_c_binding
         implicit none
         real(c_double) :: N,PC,EBUP,EBDO,NF,Q,P,chi2pdf_xq
         real(c_double), parameter :: ZERO=0.0,ONE=1.0,HALF=0.5

         COMMON /CHI2PAR/ NF
         NF=N-1
         IF(N.GT.17 000) CALL SEBAR_E_AS(N,PC,EBUP,EBDO)
         IF(N.GT.17 000) RETURN
         IF(PC.LE.ZERO) Q=HALF*(ONE-0.954499736D00)
         IF(PC.GT.ZERO) Q=HALF*(ONE-PC)
         P=ONE-Q
         EBUP=ONE/SQRT(chi2pdf_xq(Q))
         EBDO=ONE/SQRT(chi2pdf_xq(P))
         RETURN
      END
