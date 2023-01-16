      FUNCTION F_QDF(F) bind(c,name="f_qdf_")
         !C VARIANCE RATIO DISTRIBUTION FUNCTION.
         use iso_c_binding
         implicit none
         real(c_double) :: F_QDF,F,XF1H,XF2H,X,BETA_I
         real(c_double) :: ONE=1.0,HALF=0.5
         integer(c_int) :: NF1,NF2

         COMMON /PARFT/ NF1,NF2
         XF1H=HALF*NF1
         XF2H=HALF*NF2
         X=(NF2*ONE)/(NF1*F+NF2)
         F_QDF=ONE-BETA_I(X,XF2H,XF1H)
         IF(F_QDF.GT.HALF) F_QDF=ONE-F_QDF
         RETURN
      END
