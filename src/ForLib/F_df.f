      FUNCTION F_DF(F) bind(c,name="f_df_")
         !C VARIANCE RATIO DISTRIBUTION FUNCTION.
         use iso_c_binding
         implicit none
         real(c_double) :: F_DF,F,NF1,NF2,XF1H,XF2H,X,BETA_I
         real(c_double),parameter :: ONE=1.0,HALF=0.5

         COMMON /PARFT/ NF1,NF2
         XF1H=HALF*NF1
         XF2H=HALF*NF2
         X=(NF2*ONE)/(NF1*F+NF2)
         F_DF=ONE-BETA_I(X,XF2H,XF1H)
         RETURN
      END
