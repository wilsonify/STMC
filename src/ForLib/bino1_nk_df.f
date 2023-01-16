      FUNCTION BINO1_NK_DF(P) bind(c,name="bino1_nk_df_")
         !C Copyright, Berg, October 23 2000.
         use iso_c_binding
         implicit none
         real(c_double) :: BINO1_NK_DF,P,ZERO=0.0,ONE=1.0,BINO_PD
         integer(c_int) :: N,K,I,KP1

         COMMON/BINOM/ N,K
         IF(K.GT.N.OR.N.LE.0.OR.K.LT.0) STOP "False N or K."
         IF(P.LT.ZERO .OR. P.GT.ONE) STOP "False P input."

         IF(P.EQ.ZERO) THEN
            BINO1_NK_DF=ZERO
            IF(K.EQ.0) BINO1_NK_DF=ONE
            RETURN
         END IF

         IF(P.EQ.ONE) THEN
            BINO1_NK_DF=ONE
            RETURN
         END IF

         BINO1_NK_DF=BINO_PD(N,K,P)
         KP1=K+1
         DO I=KP1,N
            BINO1_NK_DF=BINO1_NK_DF+BINO_PD(N,I,P)
         END DO

         RETURN
      END
