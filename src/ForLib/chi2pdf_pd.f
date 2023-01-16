      FUNCTION CHI2PDF_PD(CHI2) bind(c,name="chi2pdf_pd_")
         use iso_c_binding
         implicit none
         real(c_double) :: CHI2PDF_PD,CHI2,NF,A,ALN,CLN,YLN,GAMMA_LN
         real(c_double), parameter :: HALF=0.5,ONE=1.0
         COMMON /CHI2PAR/ NF
         A=HALF*NF
         ALN=LOG(A)
         CLN=LOG(CHI2)
         YLN=ALN-a*CHI2+(A-ONE)*(ALN+CLN)-GAMMA_LN(A)
         CHI2PDF_PD=EXP(YLN)
         RETURN
      END
