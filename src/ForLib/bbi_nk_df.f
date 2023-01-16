      FUNCTION BBI_NK_DF(P) bind(c,name="bbi_nk_df_")
         ! C Copyright, Berg, October 23 2000.
         include 'binom.com'
         BBI_NK_DF=BBI_DF(N,K,P)
         RETURN
      END
