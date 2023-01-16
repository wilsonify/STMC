      FUNCTION BBI_NK_XQ(Q) bind(c,name="bbi_ck_xq_")
C Copyright, Berg, October 23 2000.

      include 'binom.com'
      external BBI_NK_DF
      IF(N.LE.0) STOP "BBI_NK_XK: N cannot be < 0"
      IF(K.LT.0.OR.K.GT.N) STOP "BBI_NK_XK: K out of range 0 < K < N"
      IF(K.EQ.N) BBI_NK_XQ=ONE 
      IF(K.EQ.N) RETURN
      BBI_NK_XQ=FI1(BBI_NK_DF,Q,ZERO,ONE)
      RETURN
      END
