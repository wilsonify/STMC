      FUNCTION BINO_DF(N,K,P) bind(c,name="bino_df_")
        !C Copyright, Berg, October 23 1998.
        use iso_c_binding
        implicit none
        real(c_double) :: BINO_DF
        integer(c_int) :: N
        integer(c_int) :: K
        real(c_double) :: P
        real(c_double),parameter :: ZERO=0.0_c_double
        real(c_double),parameter :: ONE=1.0_c_double
        integer(c_int) :: i
        real(c_double) :: BINO_PD


      IF(K.GT.N.OR.N.LE.0.OR.K.LT.0) STOP "BINO_DF: False N or K."
      IF(P.LT.ZERO .OR. P.GT.ONE) STOP "BINO_DF: False P input."

      IF(P.EQ.ZERO) THEN
        BINO_DF=ONE
        RETURN
      END IF

      IF(P.EQ.ONE) THEN
        BINO_DF=ZERO
        IF(K.EQ.N) BINO_DF=ONE
        RETURN
      END IF

      I=0
      BINO_DF=BINO_PD(N,I,P)
      DO I=1,K
        BINO_DF=BINO_DF+BINO_PD(N,I,P)
      END DO

      RETURN
      END
