      FUNCTION CHI2_PD(CHI2) bind(c,name="chi2_pd_")
         !C Copyright, Bernd Berg, July 1 1999.
         !C CHI2 probability density.
         use iso_c_binding
         implicit none
         real(c_double) :: CHI2_PD, CHI2,NF,XNF,A,ALN,XCHI2,CLN,YLN
         real(c_double) :: GAMMA_LN
         real(c_double),parameter :: ONE=1.0,HALF=0.5,ZERO=0.0,EPS=0.001

         COMMON /CHI2PAR/ NF
         IF (NF.LE.ZERO) THEN
            NF=EPS
         END IF
         XNF=ONE*NF
         A=HALF*XNF
         ALN=LOG(A)
         XCHI2=CHI2/XNF
         CLN=LOG(XCHI2)
         YLN=ALN-a*XCHI2+(A-ONE)*(ALN+CLN)-GAMMA_LN(A)
         CHI2_PD=EXP(YLN)/XNF
         RETURN
      END
