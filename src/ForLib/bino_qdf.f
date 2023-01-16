      FUNCTION BINO_QDF(N,K,P) bind(c,name="bino_qdf_")
         !C Copyright, Berg, October 23 1998.
         use iso_c_binding
         implicit none
         real(c_double) :: BINO_QDF,P,ZERO=0.0,ONE=1.0,BINO_PD,HALF=0.5
         integer(c_int) :: N,K,I

         IF(K.GT.N.OR.N.LE.0.OR.K.LT.0) STOP "BINO_QDF: False N or K."
         IF(P.LT.ZERO .OR. P.GT.ONE) STOP "BINO_QDF: False P input."

         IF(P.EQ.ZERO.OR.P.EQ.ONE) THEN
            BINO_QDF=ZERO
            RETURN
         END IF

         I=0
         BINO_QDF=BINO_PD(N,I,P)
         DO I=1,K
            BINO_QDF=BINO_QDF+BINO_PD(N,I,P)
         END DO
         IF(BINO_QDF.GT.HALF) BINO_QDF=ONE-BINO_QDF

         RETURN
      END
