      FUNCTION BINO_NK_DF(P) bind(c,name="bino_nk_df_")
         !C Copyright, Berg, October 23 2000.
         use iso_c_binding
         implicit none
         real(c_double) :: BINO_NK_DF,P,ZERO=0.0,ONE=1.0,BINO_PD
         integer(c_int) :: N,K,I


         COMMON/BINOM/ N,K
         IF(K.GT.N.OR.N.LE.0.OR.K.LT.0) STOP "BINO_NK_DF: False N or K."
         IF(P.LT.ZERO .OR. P.GT.ONE) STOP "BINO_NK_DF: False P input."
C
         IF(P.EQ.ZERO) THEN
            BINO_NK_DF=ONE
            RETURN
         END IF
C
         IF(P.EQ.ONE) THEN
            BINO_NK_DF=ZERO
            IF(K.EQ.N) BINO_NK_DF=ONE
            RETURN
         END IF
C
         I=0
         BINO_NK_DF=BINO_PD(N,I,P)
         DO I=1,K
            BINO_NK_DF=BINO_NK_DF+BINO_PD(N,I,P)
         END DO
C
         RETURN
      END
