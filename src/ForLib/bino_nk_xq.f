      FUNCTION BINO_NK_XQ(Q) bind(c,name="bino_nk_xq_")
         !C Copyright, Berg, October 23 2000.
         use iso_c_binding
         implicit none
         real(c_double) :: BINO_NK_XQ,Q,BINO_NK_DF_INV
         integer(c_int) :: N,K
         real(c_double),parameter :: ONE=1.0,ZERO=0.0

         COMMON/BINOM/ N,K
         external BINO_NK_DF
         IF(N.LE.0) STOP "BBI_NK_XK: N.LE.0."
         IF(K.LT.0.OR.K.GT.N) STOP "BBI_NK_XK: K out of range."
         IF(K.EQ.N) BINO_NK_XQ=ONE
         IF(K.EQ.N) RETURN
         BINO_NK_XQ=BINO_NK_DF_INV(Q,ZERO,ONE)
         RETURN
      END
