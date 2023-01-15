      FUNCTION CHI2PDF_PD(CHI2) bind(c,name="chi2pdf_pd_")

      COMMON /CHI2PAR/ NF
      A=HALF*NF
      ALN=LOG(A)
      CLN=LOG(CHI2)
      YLN=ALN-a*CHI2+(A-ONE)*(ALN+CLN)-GAMMA_LN(A)
      CHI2PDF_PD=EXP(YLN)
      RETURN
      END
