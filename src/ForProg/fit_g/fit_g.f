      SUBROUTINE FIT_G(NDAT,X,Y,SIGY,NFIT,A,COVAR,AMAT,CHI2,Q,SUBG,LPRI)
         ! C
         ! C Copyright Bernd Berg, October 4, 2002.
         ! C General fit with the LEVENBERG-MARQUARDT method.
         ! C
         ! C NDAT:     NUMBER OF DATA POINTS.
         ! C NFIT:     NUMBER OF FIT PAPRAMETERS.
         ! C MFIT:     MAXIMUM NUMBER OF FIT PARAMETERS.
         ! C NAX_ITER: MAXIMUM NUMBER OF STEPS (ITERATIONS).
         ! C
         ! C X:      ARGUMENTS OF DATA POINT, Y(I)=Y(X(I)), I=1,...,NDAT.
         ! C Y:      Y(I),    I=1,...,NDAT, DATA POINTS.
         ! C SIGY:   SIGY(I), I=1,...,NDAT, STANDARD DEVIATONS OF THE DATA POINTS.
         ! C A:      FIT PARAMETERS;  LAST NFIT-NFIT VALUES ARE HELD CONSTANT.
         ! C SUBG:   USER SUPPLIED FIT SUBROUTINE  SUBG(XX,A,YFIT,DYDA,NFIT).
         ! C LPRI:   IF .TRUE., INFORMATION ABOUT ITERATION PROCESS IS PRINTED.
         ! C EPS:    (INTERNAL) STOP PARAMETER FOR THE ITERATION.
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
         integer, parameter :: IUO = 6, MFIT = 20, MAX_ITER = 250
         real, parameter :: EPS = 1e-4, TEN = 10.0, ONE = 1.0, ZERO = 0.0
         
         integer(c_int), intent(in) :: ndat
         real(c_double), dimension(ndat), intent(in) :: x
         real(c_double), dimension(ndat), intent(in) :: y
         real(c_double), dimension(ndat), intent(in) :: sigy
         integer(c_int), intent(in) :: nfit
         real(c_double), dimension(nfit), intent(inout) :: A
         real(c_double), dimension(nfit) :: ATRY
         real(c_double), dimension(nfit, nfit), intent(out) :: covar
         real(c_double), dimension(nfit, nfit), intent(out) :: amat
         real(c_double), intent(out) :: chi2
         real(c_double), intent(out) :: q
         logical(c_bool), intent(in) :: lpri

         integer(c_int) :: i, j, k, iter
         real(c_double) :: chi2_try, dchi2, ndgf, gamma_p
         real(c_double), dimension(nfit) :: B
         real(c_double) :: N0Chi2, XLA
         real(c_double), dimension(nfit) :: dyda
         real(c_double), dimension(nfit) :: dela
         real(c_double), parameter :: HALF=0.5_c_double
         EXTERNAL SUBG
         
     
         
         real(c_double) :: yfit, sum, tmp

         IF(NFIT.GT.MFIT) STOP "FIT_G: Enlarge MFIT."
         N0Chi2=0
C
         XLA=one/ten**3 ! Initial value of lambda.
         !CALL FIT_GC(NDAT,X,Y,SIGY,NFIT,A,AMAT,B,DYDA,CHI2,SUBG)
         IF(LPRI) WRITE(IUO,'(/," FIG_G: CHI2_IN =",1G16.7,/)') CHI2
         IF(LPRI) WRITE(IUO,*) "  ITER     CHI2         DCHI2/CHI2"
C
         ITER=0
    1    ITER=ITER+1
         IF(NDAT.GT.NFIT .AND. CHI2.LT.EPS) THEN
            WRITE(IUO,'(" Check your error bars: CHI2 =",G16.7)') CHI2
            STOP "FIT_G: CHI2 too small."
         END IF
C
         DO J=1,NFIT
            DELA(J)=B(J)
            DO K=1,NFIT
               COVAR(J,K)=AMAT(J,K)
            END DO
            COVAR(J,J)=AMAT(J,J)*(ONE+XLA) ! Marquard's definition.
         END DO
C
         CALL MAT_GAU(COVAR,NFIT,DELA,1)
C
         DO J=1,NFIT
            ATRY(J)=A(J)+DELA(J)
         END DO
         !CALL FIT_GC( NDAT,X,Y,SIGY,NFIT,ATRY,COVAR,DELA,DYDA,CHI2_TRY,SUBG )
         IF(NDAT.GT.NFIT) Dchi2=(CHI2-CHI2_TRY)/CHI2
         IF(NDAT.EQ.NFIT) Dchi2=CHI2/EPS
C
         IF(CHI2_TRY.LT.CHI2) THEN ! Accept try
            XLA=XLA/TEN ! and decrease lambda by the factor ten.
            CHI2=CHI2_TRY
            DO J=1,NFIT
               B(J)=DELA(J)
               A(J)=ATRY(J)
               DO K=1,NFIT
                  AMAT(J,K)=COVAR(J,K)
               END DO
            END DO
         ELSE ! Reject try
            XLA=ten*XLA ! and enlarge lambda by the factor ten.
         ENDIF
C
         IF(LPRI) WRITE(IUO,'(I7,2G15.6)') ITER,CHI2,Dchi2
         IF(Dchi2.LT.ZERO .OR. Dchi2.GT.EPS) N0Chi2=0
         IF(Dchi2.LT.ZERO .OR. Dchi2.GT.EPS) GO TO 1
         IF(Dchi2.EQ.ZERO) THEN
            N0Chi2=N0Chi2+1
            IF(N0Chi2.LE.10) GO TO 1
            WRITE(IUO,'(" FIT_G Warning: N0Chi2.eq.10 reached.",/)')
         END IF
C
         DO J=1,NFIT
            DELA(J)=B(J)
            DO K=1,NFIT
               COVAR(J,K)=AMAT(J,K)
            END DO
         END DO
         CALL MAT_GAU(COVAR,NFIT,DELA,1)
         Q=-ONE
         NDGF=NDAT-NFIT
         IF(NDGF.GT.0) Q=ONE-GAMMA_P(HALF*NDGF,HALF*CHI2)
C
         RETURN
      END


