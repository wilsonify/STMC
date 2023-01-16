      FUNCTION CHI2_QDF(CHI2) bind(c,name="chi2_qdf_")
C Copyright, Bernd Berg, July 2 1999.
C CHI2 peaked distribution function.
         use iso_c_binding
         implicit none
         real(c_double) :: CHI2_QDF,CHI2,NF,A,X,GAMMA_P
         real(c_double), parameter :: ONE=1.0,HALF=0.5,ZERO=0.0,EPS=0.001

         COMMON /CHI2PAR/ NF
         if (NF.LE.ZERO) THEN
            NF=EPS
        END IF
         A=HALF*NF
         X=HALF*CHI2
         CHI2_QDF=GAMMA_P(A,X)
         IF(CHI2_QDF.GT.HALF) CHI2_QDF=ONE-CHI2_QDF
         RETURN
      END
