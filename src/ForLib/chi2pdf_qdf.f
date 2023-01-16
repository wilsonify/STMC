      FUNCTION CHI2PDF_QDF(CHI2) bind(c,name="chi2pdf_qdf_")
         !C Coyright, Bernd Berg, July 3 1999.
         !C CHI2 pdf: peaked distribution function.
         use iso_c_binding
         implicit none
         real(c_double) :: CHI2PDF_QDF,CHI2,NF,A,X,GAMMA_P
         real(c_double), parameter :: HALF=0.5,ONE=1.0

         COMMON /CHI2PAR/ NF
         A=HALF*NF
         X=HALF*NF*CHI2
         CHI2PDF_QDF=GAMMA_P(A,X)
         IF(CHI2PDF_QDF.GT.HALF) CHI2PDF_QDF=ONE-CHI2PDF_QDF
         RETURN
      END
