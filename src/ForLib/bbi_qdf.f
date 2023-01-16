      FUNCTION BBI_QDF(N,K,P) bind(c,name="bbi_qdf_")
         !C Copyright, Berg, October 23 1999.
         use iso_c_binding
         implicit none
         real(c_double) :: BBI_QDF, BETA_I
         integer(c_int) :: N,K
         real(c_double) :: P,XKP1,XNMK
         real(c_double), parameter :: ZERO=0.0_c_double
         real(c_double), parameter :: ONE=1.0_c_double
         real(c_double), parameter :: HALF=0.5_c_double

         IF(K.GT.N.OR.N.LE.0.OR.K.LT.0) STOP "BBI_QDF: False N or K."
         IF(P.LT.ZERO .OR. P.GT.ONE) STOP "BBI_QDF: False P input."

         IF(P.EQ.ZERO.OR.P.EQ.ONE) THEN
            BBI_QDF=ZERO
            RETURN
         END IF

         XKP1=ONE*(K+1)
         XNMK=ONE*(N-K)
         BBI_QDF=ONE-BETA_I(P,XKP1,XNMK)
         IF(BBI_QDF.GT.HALF) BBI_QDF=ONE-BBI_QDF

         RETURN
      END
