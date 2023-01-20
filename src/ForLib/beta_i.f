      FUNCTION BETA_I(X,A,B) bind(c, name="beta_i_")
         !C INCOMPLETE BETA FUNCTION. Copyright, Bernd Berg, Apr 2 2000.

         use iso_c_binding
         implicit none
         real(c_double) GAMMA_LN
         real(c_double) BETA_I
         real(c_double) X
         real(c_double) A
         real(c_double) B
         real(c_double) BT
         real(c_double), parameter :: ZERO = 0.0_c_double
         real(c_double), parameter :: HALF = 0.5_c_double
         real(c_double), parameter :: ONE = 1.0_c_double
         real(c_double), parameter :: TWO = 2.0_c_double
         integer(c_int), parameter :: ITER_MAX = 200
         real(c_double), parameter :: EPS = 1.D-10
         real(c_double) :: one_minux_x
         real(c_double) :: first_term
         real(c_double) :: second_term
         real(c_double) :: third_term
         real(c_double) :: fourth_term
         real(c_double) :: fifth_term
         real(c_double) :: exp_term
         real(c_double) :: XX
         real(c_double) :: AA
         real(c_double) :: BB
         real(c_double) :: APB
         real(c_double) :: AP1
         real(c_double) :: AM1
         real(c_double) :: BCFM
         real(c_double) :: BM
         real(c_double) :: BCF
         real(c_double) :: BZ
         integer(c_int) :: ITER
         real(c_double) :: XITER
         real(c_double) :: TWO_ITER
         real(c_double) :: BCFP
         real(c_double) :: BP
         real(c_double) :: BPP
         real(c_double) :: BCFOLD
         real(c_double) :: C1
         real(c_double) :: C2

         IF(X.LT.ZERO .OR. X.GT.ONE) THEN
            STOP 'BAD ARGUMENT X IN BETA_I'
         END IF
         IF(X.EQ.ZERO .OR. X.EQ.ONE) THEN
            BT=ZERO
         ELSE
            one_minux_x = ONE-X
            first_term = GAMMA_LN(A+B)
            second_term = GAMMA_LN(A)
            third_term = GAMMA_LN(B)
            fourth_term = A*LOG(X)
            fifth_term = B*LOG(one_minux_x)
            exp_term = first_term - second_term -
     &                  third_term + fourth_term +
     &                  fifth_term
            BT = EXP(exp_term)
         ENDIF

         IF(X.LT.(A+ONE)/(A+B+TWO)) THEN
            XX=X
            AA=A
            BB=B
         ELSE
            XX=ONE-X
            AA=B
            BB=A
         END IF

         APB=AA+BB
         AP1=AA+ONE
         AM1=AA-ONE
         BCFM=ONE
         BM=ONE
         BCF=ONE
         BZ=ONE-APB*XX/AP1
         DO ITER=1,ITER_MAX
            XITER=ITER*ONE
            TWO_ITER=XITER+XITER
            C1 = XITER*
     &       (BB-XITER)*
     &       XX/((AM1+TWO_ITER)*
     &       (AA+TWO_ITER))
            C2 = -(AA+XITER)*
     &       (APB+XITER)*
     &       XX/((AA+TWO_ITER)*
     &       (AP1+TWO_ITER))
            BCFP=BCF+C1*BCFM
            BP=BZ+C1*BM
            BPP=BP+C2*BZ
            BCFOLD=BCF
            BCFM=BCFP/BPP
            BM=BP/BPP
            BCF=(BCFP+C2*BCF)/BPP
            BZ=ONE
            IF(ABS(BCF-BCFOLD).LT.EPS*ABS(BCF)) GO TO 1
         END DO
         STOP 'BETA_I: A or B too big, or ITER_MAX too small'

    1    IF(X.LT.(A+ONE)/(A+B+TWO)) THEN
            BETA_I=BT*BCF/A
         ELSE
            BETA_I=ONE-BT*BCF/B
         ENDIF
         RETURN
      END
