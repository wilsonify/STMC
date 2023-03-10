      FUNCTION GAMMA_P(A,X) BIND(C,NAME="gamma_p_")
         !C INCOMPLETE GAMMA FUNCTION. BERG JUNE 8, 1999.
         use iso_c_binding
         implicit none
         real(c_double) :: GAMMA_P,A,X,GLN,GAMMA_LN
         real(c_double) :: SUM,ADD,GOLD,A0,A1,B0,B1,G,XITER,XITERMA
         integer(c_int) :: ITER_MAX,ITER
         real(c_double),parameter :: ZERO=0.0,ONE=1.0,HALF=0.5
         logical :: LBAD2
         logical :: LBAD1
         real(8) :: EPS
         PARAMETER (ITER_MAX=800,EPS=3.D-9)
         LBAD1=.FALSE.
         LBAD2=.FALSE.
         IF(X.LT.ZERO.OR.A.LE.ZERO) PRINT*,'A,X:',A,X
         IF(X.LT.ZERO.OR.A.LE.ZERO) STOP 'GAMMA_P - INPUT NOT COVERED'
         GLN=GAMMA_LN(A)
    3    CONTINUE
         IF(X.LT.A+ONE.AND..NOT.LBAD2.OR.LBAD1) THEN ! Series expansion
            GAMMA_P=ZERO
            IF(X.LE.ZERO) RETURN
            SUM=ONE/A
            ADD=SUM
            DO ITER=1,ITER_MAX
               ADD=ADD*X/(A+ITER)
               SUM=SUM+ADD
               IF(ABS(ADD).LT.ABS(SUM)*EPS)GO TO 1
            END DO
            IF(LBAD1) STOP 'A too large, ITER_MAX too small'
            LBAD2=.TRUE.
            GO TO 3
    1       GAMMA_P=SUM*EXP(-X+A*LOG(X)-GLN)
         ELSE ! Continued fraction expansion
            GOLD=ZERO
            A0=X+ONE-A
            B0=ONE
            A1=X*A0+X
            B1=X*B0+ONE
            DO ITER=2,ITER_MAX
               XITER=ITER*ONE
               XITERMA=XITER-A
               A0=(A1+A0*XITERMA)/A1
               B0=(B1+B0*XITERMA)/A1
               B1=X*B0+XITER*B1/A1
               A1=X*A0+XITER
               IF(A1.EQ.ZERO) STOP 'A1 ZERO in GAMMA_P'
               G=B1/A1
               IF(ABS((G-GOLD)/G).LT.EPS) GO TO 2
               GOLD=G
            END DO
            If(LBAD2) STOP 'A too large, ITER_MAX too small'
            LBAD1=.TRUE.
            GO TO 3
    2       GAMMA_P=ONE-EXP(-X+A*LOG(X)-GLN)*G ! and take its complement
         ENDIF
         RETURN
      END
