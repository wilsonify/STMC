      FUNCTION CAU_DF(X) bind(c,name="cau_df_")
         !C CAUCHY, CUMULATIVE DISTRIBUTIO FUNCTION. BERG, JUN 1, 1999.
         use iso_c_binding
         implicit none
         real(c_double) :: CAU_DF,X,HALF=0.5,PI=3.14159
         CAU_DF=HALF+ATAN(X)/PI
         RETURN
      END
