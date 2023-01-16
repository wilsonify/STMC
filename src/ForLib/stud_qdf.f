      FUNCTION STUD_QDF(T)  bind(c,name="stud_qdf_")
         use iso_c_binding
         implicit none

         COMMON /PARSTUD/ NF
C
         A=HALF*NF
         B=HALF
         X=(NF*ONE)/((NF*ONE)+T**2)
         IF(T.EQ.ZERO) STUD_QDF=    HALF
         IF(T.LT.ZERO) STUD_QDF=    HALF*BETA_I(X,A,B)
         IF(T.GT.ZERO) STUD_QDF=ONE-HALF*BETA_I(X,A,B)
         IF(STUD_QDF.GT.HALF) STUD_QDF=ONE-STUD_QDF
C
         RETURN
      END
