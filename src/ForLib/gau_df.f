      FUNCTION GAU_DF(X) bind(c,name="gau_df_")
C GAUSSIAN, CUMULATIVE DISTRIBUTION FUNCTION. BERG, JUN 1, 1999.
         use iso_c_binding
         implicit none
         real(c_double) :: GAU_DF,X,ERROR_F,XX
         real(c_double),parameter :: TWO=2.0,HALF=0.5
         XX=X/SQRT(TWO)
         GAU_DF=HALF+HALF*ERROR_F(XX)
         RETURN
      END
