      FUNCTION CHI2PDF_XQ(Q) bind(c,name="chi2pdf_xq_")
       
      COMMON /CHI2PAR/ NF
      CHI2PDF_XQ=CHI2_XQ(Q)/NF
      RETURN
      END
