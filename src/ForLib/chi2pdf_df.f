      FUNCTION CHI2PDF_DF(CHI2) bind(c,name="chi2pdf_df_")
         use iso_c_binding
         implicit none
         real(c_double) :: CHI2PDF_DF,CHI2,NF,A,X,GAMMA_P
         real(c_double),parameter :: HALF=0.5
         COMMON /CHI2PAR/ NF
         A=HALF*NF
         X=HALF*NF*CHI2
         CHI2PDF_DF=GAMMA_P(A,X)
         RETURN
      END
