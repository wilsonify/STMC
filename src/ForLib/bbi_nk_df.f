      FUNCTION BBI_NK_DF(P) bind(c,name="bbi_nk_df_")
         use iso_c_binding
         implicit none
         real(c_double) :: BBI_NK_DF,P,BBI_DF
         real(c_double),parameter :: ZERO=0.0
         integer(c_int) :: N,K

         ! C Copyright, Berg, October 23 2000.
         COMMON/BINOM/ N,K
         if (N.LE.ZERO) THEN
            N=1
         END IF
         if (K.LE.ZERO) THEN
            K=1
         END IF

         BBI_NK_DF=BBI_DF(N,K,P)
         RETURN
      END
