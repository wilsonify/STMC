      FUNCTION CHI2PDF_XQ(Q) bind(c)
      include 'implicit.sta' 
      COMMON /CHI2PAR/ NF
      CHI2PDF_XQ=CHI2_XQ(Q)/NF
      RETURN
      END
