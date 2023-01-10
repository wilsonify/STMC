      FUNCTION CAU_DF(X) bind(c)
C CAUCHY, CUMULATIVE DISTRIBUTIO FUNCTION. BERG, JUN 1, 1999.
      include 'implicit.sta'
      include 'constants.par'
      CAU_DF=HALF+ATAN(X)/PI
      RETURN
      END
