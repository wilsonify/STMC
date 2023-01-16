      FUNCTION F_XQ(Q) bind(c,name="f_xq_")
         use iso_c_binding
         implicit none
         real(c_double) :: F_XQ, Q,F_DF,NF1,NF2,X1,X2,FI1
         real(c_double),parameter :: ZERO=0.0,ONE=1.0,HALF=0.5,TEN=10.0

C

         EXTERNAL F_DF
         COMMON /PARFT/ NF1,NF2
C
         IF(Q.EQ.HALF) THEN
            F_XQ=ONE
            RETURN
         ENDIF
         X2=ONE+ONE/TEN
         IF(Q.GT.HALF) THEN
            X1=ONE-ONE/TEN
    1       X2=X2+ONE
            IF(F_DF(X2).LE.Q) GO TO 1
         ELSE
            X1=ZERO
         ENDIF
C
         F_XQ=FI1(F_DF,Q,X1,X2)
C
         RETURN
      END
