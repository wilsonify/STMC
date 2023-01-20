      FUNCTION F_DF(F) bind(c,name="f_df_")
         !C VARIANCE RATIO DISTRIBUTION FUNCTION.
         use iso_c_binding
         implicit none
         real(c_double) :: F_DF, F
         integer(c_int) :: NF1, NF2
         real(c_double) :: XF1H, XF2H, X, BETA_I
         real(c_double) :: numerator,denominator
         real(c_double), parameter :: ONE=1.0,ZERO=0.0,HALF=0.5

         COMMON /PARFT/ NF1,NF2
         IF (NF1.LE.ZERO) THEN
            NF1=1.0
         END IF
         IF (NF2.LE.ZERO) THEN
            NF2=1.0
         END IF

         XF1H=HALF*NF1
         XF2H=HALF*NF2
         numerator=NF2*ONE
         denominator=NF1*F+NF2
         X=numerator/denominator
         F_DF=ONE-BETA_I(X,XF2H,XF1H)
         RETURN
      END
