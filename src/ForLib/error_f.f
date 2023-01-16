      FUNCTION ERROR_F(X) bind(c,name="error_f_")
         !C BERG MAY 30, 1999.
         !C RETURNS THE ERROR FUNCTION ERF(X). THE LONG NOTATION ERROR_F IS USED
         !C TO AVOID CONFLICTS WITH A POSSIBLY EXISTING INTRINSIC FUNCTION ERF.
         use iso_c_binding
         implicit none
         real(c_double) :: X,ERROR_F,GAMMA_P
         real(c_double),parameter :: ONE=1.0,HALF=0.5

         ERROR_F=SIGN(ONE,X)*GAMMA_P(HALF,X**2) ! Incomplete gamma function.
         RETURN
      END
