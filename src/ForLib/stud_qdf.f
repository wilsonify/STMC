      FUNCTION STUD_QDF(T)  bind(c,name="stud_qdf_")
         use iso_c_binding
         implicit none
         real(c_double) :: STUD_QDF,T,A,B,X,BETA_I
         real(c_double),parameter :: HALF=0.5,ONE=1.0,ZERO=0.0
         integer(c_int) :: NF

         COMMON /PARSTUD/ NF
         IF (NF.LE.ZERO) THEN
            NF=1.0
         END IF

         A=HALF*NF
         B=HALF
         X=(NF*ONE)/((NF*ONE)+T**2)
         IF(T.EQ.ZERO) STUD_QDF=    HALF
         IF(T.LT.ZERO) STUD_QDF=    HALF*BETA_I(X,A,B)
         IF(T.GT.ZERO) STUD_QDF=ONE-HALF*BETA_I(X,A,B)
         IF(STUD_QDF.GT.HALF) STUD_QDF=ONE-STUD_QDF

         RETURN
      END
