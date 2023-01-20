      FUNCTION STUD_DF(T) bind(c,name="stud_df_")
         use iso_c_binding
         implicit none
         real(c_double) :: STUD_DF,T,A,B,X,BETA_I
         integer(c_int) :: NF
         real(c_double),parameter :: ONE=1.0,ZERO=0.0,HALF=0.5

         COMMON /PARSTUD/ NF
         IF (NF.LE.ZERO) THEN
            NF=1.0
         END IF
C
         A=HALF*NF
         B=HALF
         X=(NF*ONE)/((NF*ONE)+T**2)
         IF(T.EQ.ZERO) STUD_DF = HALF
         IF(T.LT.ZERO) STUD_DF = HALF*BETA_I(X,A,B)
         IF(T.GT.ZERO) STUD_DF = ONE-HALF*BETA_I(X,A,B)
C
         RETURN
      END
