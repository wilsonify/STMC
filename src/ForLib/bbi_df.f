
      FUNCTION BBI_DF(N,K,P) bind(c,name="bbi_df_")
         !C Copyright, Berg, October 23 1998.
         use iso_c_binding
         implicit none
         integer(c_int) :: N
         integer(c_int) :: K
         real(c_double) :: P
         real(c_double), parameter :: ONE = 1.0_c_double
         real(c_double), parameter :: ZERO = 0.0_c_double
         real(c_double) :: XKP1
         real(c_double) :: XNMK
         real(c_double) :: BETA_I
         real(c_double) :: BBI_DF
         IF(K.GT.N) THEN
            STOP "BBI_DF: K cannot be > N"
         end if
         IF(N.LE.0) THEN
            STOP "BBI_DF: N cannot be < 0"
         END IF
         IF(K.LT.0) THEN
            STOP "BBI_DF: K cannot be < 0"
         END IF
         IF(K.GT.N.OR.N.LE.0.OR.K.LT.0) THEN
            STOP "BBI_DF: False N or K."
         END IF
         IF(P.LT.ZERO .OR. P.GT.ONE) THEN
            STOP "BBI_DF: False P input."
         END IF
         IF(P.EQ.ZERO) THEN
            BBI_DF=ONE
            RETURN
         END IF

         IF(P.EQ.ONE) THEN
            BBI_DF=ZERO
            IF(K.EQ.N) THEN
               BBI_DF=ONE
            END IF
            RETURN
         END IF

         XKP1=ONE*(K+1)
         XNMK=ONE*(N-K)
         BBI_DF=ONE-BETA_I(P,XKP1,XNMK)

         RETURN
      END
