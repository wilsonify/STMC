      SUBROUTINE KOLM2_AS(N,Fxct,DEL,Q) bind(c,name="kolm2_as_")
         !C Copyright, Bernd Berg, Apr 19, 2001.
         !C Asymptotic two-sided Kolmogorov test in the form of
         !C M.A. Stephens, J. Royal Stat. Soc. B 32 (1970) 115.
         use iso_c_binding
         implicit none
         real(c_double) ::  Fxct,DEL,Q,FEMP,SQN,A,SIGN_TWO,CUT,ADD
         real(c_double),parameter :: ONE=1.0,ZERO=0.0,TWO=2.0
         integer(c_int) :: N,I,J

         DIMENSION Fxct(N)
C
         DEL=ZERO
         DO I=1,N
            Femp=(ONE*(I-1))/N
            DEL=MAX(DEL,Fxct(I)-Femp)
            Femp=(ONE*I)/N
            DEL=MAX(DEL,Femp-Fxct(I))
         END DO
C
         SQN=SQRT(N*ONE)
         A=-TWO*(SQN*DEL+(12*DEL)/100+(11*DEL)/(100*SQN))**2
         SIGN_TWO=TWO
         Q=ZERO
         CUT=ZERO
         DO J=1,100
            ADD=SIGN_TWO*EXP(A*J**2)
            Q=Q+ADD
            IF(ABS(ADD).LT.CUT) RETURN
            SIGN_TWO=-SIGN_TWO
            CUT=ABS(ADD)/1000
         END DO
         Q=ONE
C
         RETURN
      END
