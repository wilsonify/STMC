      FUNCTION BBI_NK_DF(P) bind(c,name="bbi_nk_df_")
         use iso_c_binding
         implicit none
         real(c_double) :: BBI_NK_DF,P,BBI_DF
         integer(c_int) :: N,K
         ! C Copyright, Berg, October 23 2000.
         COMMON/BINOM/ N,K
         BBI_NK_DF=BBI_DF(N,K,P)
         RETURN
      END
