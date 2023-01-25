      SUBROUTINE DATJACK(N,X,XJ) bind(c,name="datjack_")
         ! C Copyright, Bernd Berg, Dec 13 2000.
         ! C CALCULATION OF  N  JACKKNIFE BINS  XJ(N)  FOR  N  DATA IN  X(N).
         use iso_c_binding
         implicit none
         real(c_double) :: X,XJ,XSUM,FACTOR
         real(c_double), parameter :: ZERO=0.0,ONE=1.0
         integer(c_int) :: N,I

         DIMENSION X(N),XJ(N)
         XSUM=ZERO
         DO I=1,N
            XSUM=XSUM+X(I)
         END DO
         FACTOR=ONE/(N-1)
         DO I=1,N
            XJ(I)=FACTOR*(XSUM-X(I))
         END DO
         RETURN
      END
