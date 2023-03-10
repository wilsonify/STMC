      FUNCTION BINO_COEF(N,K) bind(c,name="bino_coef_")
         ! C Copyright, Bernd Berg, May 5 2002.
         ! C Binomial probability density. Fast calculation see below.

         ! C For fast calculation activate the next three lines and call the
         ! C FCT_LN_INIT before running the present routine.
         ! c     PARAMETER(NMAX=500)
         ! c     COMMON /BINO/ FCT_LN(0:NMAX),IBINO
         ! c     IF(IBINO.NE.1) STOP "BINO_COEF: COMMON BINO not initialized."
        use iso_c_binding
        implicit none
        real(c_double) :: BINO_COEF
        integer(c_int) :: N
        integer(c_int) :: K 
        real(c_double) :: FCT_LN
        
        IF(N.LE.0 .OR. K.LT.0 .OR. K.GT.N) THEN
            PRINT*,'BINO_COEF: N or K false. N,K =',N,K
            STOP 'BINO_COEF: N or K false.'
         END IF
         BINO_COEF=EXP( FCT_LN(N)-FCT_LN(K)-FCT_LN(N-K) )
         RETURN
      END
