      FUNCTION STUD_XQ(Q) bind(c,name="stud_xq_")
         use iso_c_binding
         implicit none
         real(c_double) :: STUD_XQ,Q,STUD_DF,X1,X2,FI1
         real(c_double),parameter :: HALF=0.5,ZERO=0.0,ONE=1.0
         integer(c_int) :: NF

         EXTERNAL STUD_DF
         COMMON /PARSTUD/ NF
C
         IF(Q.EQ.HALF)                THEN
            STUD_XQ=ZERO
            RETURN
         ENDIF
         X1=ZERO
         X2=ZERO
         IF(Q.GT.HALF)                THEN
    1       X2=X2+ONE
            IF(STUD_DF(X2).LE.Q) GO TO 1
         ELSE
    2       X1=X1-ONE
            IF(STUD_DF(X1).GE.Q) GO TO 2
         ENDIF
C
         STUD_XQ=FI1(STUD_DF,Q,X1,X2)
C
         RETURN
      END
