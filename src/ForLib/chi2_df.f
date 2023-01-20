      FUNCTION CHI2_DF(CHI2) bind(c,name="chi2_df_")
         !C Copyright, Bernd Berg, July 1 1999.
         !C CHI2 cumulative distribution function.
         use iso_c_binding
         implicit none
         real(c_double) :: CHI2_DF,CHI2,NF,A,X,GAMMA_P
         real(c_double), parameter :: HALF=0.5,ZERO=0.0,EPS=0.001
         COMMON /CHI2PAR/ NF
         IF (NF.LE.ZERO) THEN
            NF = EPS
         END IF
         A=HALF*NF
         X=HALF*CHI2
         CHI2_DF=GAMMA_P(A,X)
         RETURN
      END
