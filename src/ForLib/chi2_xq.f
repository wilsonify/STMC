      FUNCTION CHI2_XQ(Q) bind(c,name="chi2_xq_")
         use iso_c_binding
         implicit none
         real(c_double) :: CHI2_XQ,Q,CHI2_DF,CHI2_DF_INV
         real(c_double) :: X1,X2,Q1,Q2,QT,FI1
         integer(c_int) :: NF
         real(c_double),parameter :: ZERO=0.0,ONE=1.0,EPS=0.001


         COMMON /CHI2PAR/ NF
         IF (NF.LE.ZERO) THEN
            NF = 1.0
         END IF
         X1=ZERO
         X2=ZERO
         Q1=CHI2_DF(x1)
    1    X2=X2+ONE*NF
         QT=CHI2_DF(X2)
         IF(QT.LE.Q) GO TO 1
         Q2=CHI2_DF(x2)

         CHI2_XQ=CHI2_DF_INV(Q,X1,X2)
         RETURN
      END
