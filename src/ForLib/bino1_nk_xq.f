      FUNCTION BINO1_NK_XQ(Q) bind(c,name="bino1_nk_xq_")
C Copyright, Berg, October 23 2000.
         use iso_c_binding
         implicit none
         real(c_double) :: BINO1_NK_XQ,BINO1_NK_DF_INV,BBI1_NK_XQ
         real(c_double) :: Q,ZERO=0.0,ONE=1.0
         integer(c_int) :: N,K

         COMMON/BINOM/ N,K
         external BINO1_NK_DF
         IF(N.LE.0) STOP "BBI_NK_XQ: N.LE.0."
         IF(K.LT.0.OR.K.GT.N) STOP "BBI_NK_XQ: K out of range."
         IF(K.EQ.0) BBI1_NK_XQ=ZERO
         IF(K.EQ.0) RETURN
         BINO1_NK_XQ=BINO1_NK_DF_INV(Q,ZERO,ONE)
         RETURN
      END
