      subroutine fit_gc(ndat, x, y, sigy, nfit, a, amat, b, dyda, chi2, subg) bind(c,name="fit_gc_")
         ! C
         ! C Copyright Bernd Berg, October 4, 2002.
         ! C Subroutine for FIT_G.
         ! C
         ! C NDAT:   NUMBER OF DATA POINTS.
         ! C NFIT:   NUMBER OF FIT PAPRAMETERS.
         ! C
         ! C X:      ARGUMENTS OF DATA POINT, Y(I)=Y(X(I)), I=1,...,NDAT.
         ! C Y:      Y(I),    I=1,...,NDAT, DATA POINTS.
         ! C SIGY:   SIGY(I), I=1,...,NDAT, STANDARD DEVIATONS OF THE DATA POINTS.
         ! C A:      FIT PARAMETERS;  LAST NFIT-NFIT VALUES ARE HELD CONSTANT.
         ! C SUBG:   USER SUPPLIED FIT SUBROUTINE  SUBG(XX,A,YFIT,DYDA,NFIT).
         ! C
         ! C A:      ARRAY (VECTOR) FIT PARAMETERS.
         ! C COVA:   COVARIANCE MATRIX ON OUTPUT.
         ! C AMAT:   CURVATURE  MATRIX ON OUTPUT.
         ! C CHI2:   CHI SQUARED.
         ! C Q:      PROBABILITY THAT OBSERVED DEVIATIONS OF DATA FROM BEST FIT
         ! C         ARE DUE TO CHANCE (ASSUMING GAUSSIAN DISTRIBUTION OF DATA)
         ! C
         use iso_c_binding
         implicit none
         integer(c_int) :: ndat
         real(c_double), dimension(ndat) :: x
         real(c_double), dimension(ndat) :: y
         real(c_double), dimension(ndat) :: sigy
         integer(c_int) :: nfit
         integer(c_int) :: k
         real(c_double), dimension(nfit) :: a
         real(c_double), dimension(nfit, nfit) :: AMAT
         real(c_double), dimension(nfit) :: b
         real(c_double), dimension(nfit) :: dyda
         real(c_double) :: chi2

         integer(c_int) :: i, j
         real(c_double) :: yfit, sum, tmp
         real(c_double),parameter :: ZERO=0.0_c_double
         real(c_double),parameter :: ONE=1.0_c_double
         real(c_double) :: sigy2i
         real(c_double) :: dely, das2i
         EXTERNAL SUBG

         DO J=1,NFIT
            B(J)=ZERO
            DO K=1,J
               AMAT(J,K)=ZERO
            END DO
         END DO
         CHI2=ZERO
         DO I=1,NDAT
            CALL SUBG(X(I),A,YFIT,DYDA,NFIT)
            SIGY2I=ONE/(SIGY(I)*SIGY(I))
            DELY=Y(I)-YFIT
            DO J=1,NFIT
               DAS2I=DYDA(J)*SIGY2I
               B(J)=B(J)+DAS2I*DELY
               DO K=1,J
                  AMAT(J,K)=AMAT(J,K)+DAS2I*DYDA(K)
               END DO
            END DO
            CHI2=CHI2+DELY*(DELY*SIGY2I)
         END DO
         DO J=2,NFIT
            DO K=1,J-1
               AMAT(K,J)=AMAT(J,K)
            END DO
         END DO
         RETURN
      END

