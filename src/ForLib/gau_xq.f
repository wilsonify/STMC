      FUNCTION GAU_XQ(Q) bind(c,name="gau_xq_")
         use iso_c_binding
         implicit none
         real(c_double) :: GAU_XQ,Q,GAU_DF,X1,X2,GAU_DF_INV
         real(c_double),parameter :: HALF=0.5,ZERO=0.0,ONE=1.0

         EXTERNAL GAU_DF

         IF(Q.EQ.HALF)                  THEN
            GAU_XQ=ZERO
            RETURN
         ENDIF
         X1=ZERO
         X2=ZERO
         IF(Q.GT.HALF)                  THEN
    1       X2=X2+ONE
            IF(GAU_DF(X2).LE.Q) GO TO 1
         ELSE
    2       X1=X1-ONE
            IF(GAU_DF(X1).GE.Q) GO TO 2
         ENDIF
         GAU_XQ=GAU_DF_INV(Q,X1,X2)

         RETURN
      END
