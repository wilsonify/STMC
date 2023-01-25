      SUBROUTINE DATJACK2(N,X,XJJ) bind(c,name="datjack2_")
         ! C Copyright Bernd Berg, Dec 13 2000.
         ! C CALCULATION OF  SECOND LEVEL JACKKNIFE BINS  XJJ(N-1,N)
         ! C FROM  N  DATA  X(N).
         use iso_c_binding
         implicit none
         real(c_double) :: X,XJJ,XSUM,FACTOR
         real(c_double),parameter :: ZERO=0.0,ONE=1.0
         integer(c_int) :: N,I,J,JJ,NM1

         DIMENSION X(N),XJJ(N-1,N)
C
         XSUM=ZERO
         DO I=1,N
            XSUM=XSUM+X(I)
         END DO
C
         NM1=N-1
         FACTOR=ONE/(N-2)
         DO I=1,N
            DO J=1,NM1
               JJ=J
               IF(J.GE.I) JJ=J+1
               XJJ(J,I)=FACTOR*(XSUM-X(I)-X(JJ))
            END DO
         END DO
         RETURN
      END
