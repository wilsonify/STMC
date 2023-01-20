      FUNCTION BBI_NK_XQ(Q) bind(c,name="bbi_ck_xq_")
         !C Copyright, Berg, October 23 2000.
         use iso_c_binding
         implicit none
         real(c_double) :: BBI_NK_XQ,Q,BBI_NK_DF_INV
         real(c_double),parameter :: ONE=1.0,ZERO=0.0
         integer(c_int) :: N,K

         COMMON/BINOM/ N,K
         external BBI_NK_DF
         IF(N.LE.0) STOP "BBI_NK_XK: N cannot be < 0"
         IF(K.LT.0.OR.K.GT.N) STOP "BBI_NK_XK: K out of range 0 < K < N"
         IF(K.EQ.N) BBI_NK_XQ=ONE
         IF(K.EQ.N) RETURN
         BBI_NK_XQ=BBI_NK_DF_INV(Q,ZERO,ONE)
         RETURN
      END
