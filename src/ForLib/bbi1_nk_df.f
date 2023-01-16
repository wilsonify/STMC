      FUNCTION BBI1_NK_DF(P) bind(c,name="bbi1_nk_df_")
         !C Copyright, Berg, October 23 2000.
         use iso_c_binding
         implicit none
         real(c_double) :: BBI1_NK_DF,P,XK,XNMKM1,BETA_I
         integer(c_int) :: N,K
         real(c_double),parameter :: ONE=1.0,ZERO=0.0


         COMMON/BINOM/ N,K
         IF(K.GT.N.OR.N.LE.0.OR.K.LT.0) STOP "BBI1_NK_DF: False N or K."
         IF(P.LT.ZERO .OR. P.GT.ONE) STOP "BBI1_NK_DF: False P input."
C
         IF(P.EQ.ZERO) THEN
            BBI1_NK_DF=ZERO
            IF(K.EQ.0) BBI1_NK_DF=ONE
            RETURN
         END IF
C
         IF(P.EQ.ONE) THEN
            BBI1_NK_DF=ONE
            RETURN
         END IF
C
         XK=ONE*K
         XNMKM1=ONE*(N-K+1)
         BBI1_NK_DF=BETA_I(P,XK,XNMKM1)
C
         RETURN
      END
