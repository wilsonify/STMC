      FUNCTION FI1(F,Y,X1,X2) bind(c,name="fi1_")
         ! Copyright Bernd Berg, Sep 17, 2000.
         ! INVERSE OF THE FUNCTION F.
         ! RESULT:     FI1=X SUCH THAT Y=F(X).
         ! PRECISSION: EPS=1/10**8 can be changed, see below.
         ! METHOD:     BISECTING INTERVAL, INITIAL RANGE [X1,X2] (X1<X2).
         ! ASSUMPTION: F(X) MONOTON (IN- OR DECREASING) IN THE INTERVAL [X1,X2].
         use iso_c_binding
         implicit none

         real(c_double) :: FI1,Y,X1,X2
         real(c_double) :: F
         real(c_double) :: XX1,XX2,Y1,Y2,XX,FF
         integer(c_int) :: ITER,ITERMAX
         real(c_double) :: EPS
         real(c_double), parameter :: ONE=1.0,TEN=10.0,HALF=0.5

         EXTERNAL F
         EPS=ONE/TEN**8
         !C MAXIMUM NUMBER OF ITERATIONS:
         ITERMAX=1000
         ITER=0

         XX1=X1
         XX2=X2
    1    Y1=F(XX1)
         Y2=F(XX2)

         IF(Y1.GT.Y2) THEN
            XX1=X2
            XX2=X1
            GO TO 1
         END IF

         IF(Y.LE.Y1 .OR. Y.GE.Y2) GO TO 2

    3    CONTINUE
         ITER=ITER+1
         IF(ITER.GT.ITERMAX) GO TO 2
         XX=HALF*(XX1+XX2)
         FF=F(XX)
         IF(FF.LE.Y) XX1=XX
         IF(FF.GT.Y) XX2=XX
         IF(ABS(XX2-XX1).GT.EPS ) GO TO 3

         FI1=HALF*(XX2+XX1)

         RETURN
    2    PRINT*,'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
         PRINT*,'ITERMAX,EPS:',ITERMAX,EPS
         PRINT*,'Y1,Y,Y2:    ',Y1,Y,Y2
         STOP 'FI1'
      END
