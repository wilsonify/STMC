      SUBROUTINE FCT_LN_INIT
         !C Initialization for fast calculations of binomial expressions.
         !C Transfer the FCT_LN array through the common block.
         use iso_c_binding
         implicit none
         real(c_double) :: FCT_LN,XKP1,GAMMA_LN
         real(c_double),parameter :: ONE=1.0
         integer(c_int) :: NMAX,NDAT,K,IBINO


         PARAMETER(NMAX=500)
         COMMON /BINO/ FCT_LN(0:NMAX),IBINO
         IF(NDAT.GT.NMAX) STOP "FCT_LN_INIT: NDAT.GT.NMAX."
         IBINO=1
         !C Log of the factorials:
         DO K=0,NDAT
            XKP1=(K+1)*ONE
            FCT_LN(K)=GAMMA_LN(XKP1)
         END DO
         RETURN
      END
