
      real(c_double) FUNCTION BBI_DF(N,K,P) bind(c,name="bbi_df_")
         !C Copyright, Berg, October 23 1998.
         use iso_c_binding
         implicit none
         integer(c_int) N
         integer(c_int) K
         real(c_double) P
         real(c_double), parameter :: ONE = 1.0_c_double
         real(c_double), parameter :: ZERO = 0.0_c_double
         real(c_double) XKP1
         real(c_double) XNMK
         real(c_double) BETA_I
         IF(K.GT.N) STOP "BBI_DF: K cannot be > N"
         IF(N.LE.0) STOP "BBI_DF: N cannot be < 0"
         IF(K.LT.0) STOP "BBI_DF: K cannot be < 0"
         IF(K.GT.N.OR.N.LE.0.OR.K.LT.0) STOP "BBI_DF: False N or K."
         IF(P.LT.ZERO .OR. P.GT.ONE) STOP "BBI_DF: False P input."

         IF(P.EQ.ZERO) THEN
            BBI_DF=ONE
            RETURN
         END IF

         IF(P.EQ.ONE) THEN
            BBI_DF=ZERO
            IF(K.EQ.N) BBI_DF=ONE
            RETURN
         END IF

         XKP1=ONE*(K+1)
         XNMK=ONE*(N-K)
         BBI_DF=ONE-BETA_I(P,XKP1,XNMK)

         RETURN
      END
