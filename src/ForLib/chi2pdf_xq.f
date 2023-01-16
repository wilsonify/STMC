      FUNCTION CHI2PDF_XQ(Q) bind(c,name="chi2pdf_xq_")
         use iso_c_binding
         implicit none
         real(c_double) :: CHI2PDF_XQ,Q,NF,CHI2_XQ
         COMMON /CHI2PAR/ NF
         CHI2PDF_XQ=CHI2_XQ(Q)/NF
         RETURN
      END
