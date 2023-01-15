      FUNCTION CHI2_QDF(CHI2) bind(c)
C Copyright, Bernd Berg, July 2 1999.
C CHI2 peaked distribution function.

      COMMON /CHI2PAR/ NF
      A=HALF*NF
      X=HALF*CHI2
      CHI2_QDF=GAMMA_P(A,X)
      IF(CHI2_QDF.GT.HALF) CHI2_QDF=ONE-CHI2_QDF
      RETURN
      END
