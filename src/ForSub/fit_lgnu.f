      SUBROUTINE FIT_LGNU(IUD,N,X,Y,EY,A,SGA,COV,PROB) bind(c,name="fit_lgnu_")
     &    bind(c,name="fit_lgnu_")
         !C Copyright, Bernd Berg, Dec 13, 2000.
         !C PROB:  CONFIDENCE LEVEL FOR THE ELLIPSE.
         use iso_c_binding
         implicit none
         real(c_double) :: X,Y,EY,A,SGA,COV,PROB,covdd,sgb,eigvs
         real(c_double) :: delx,xx,varb1,varb2,ym,yy,yp
         integer(c_int) :: IUD,N,NFIG,I

         PARAMETER(NFIG=200)
         DIMENSION X(N),Y(N),EY(N), A(2),SGA(2),COV(2,2)
         DIMENSION COVDD(2),SGB(2),EIGVS(2,2)

         !C 1. REGRESSION LINE

         OPEN(UNIT=IUD,FILE='lfit.d1',STATUS='UNKNOWN')
         DO I=1,N
            WRITE(IUD,200) X(I),Y(I),EY(I)
  200       FORMAT(1X,4G16.7)
         END DO
         CLOSE(IUD)

         !C 2. CONFIDENCE ELLIPSE:

         CALL EIGEN_2X2(COV,COVDD,EIGVS)
         SGB(1)=SQRT(COVDD(1))
         SGB(2)=SQRT(COVDD(2))
         CALL ELLIPSE(A,SGA,SGB,EIGVS,PROB,IUD)

         !C 3. INCLUDE CONFIDENCE LIMITS FOR REGRESSION LINE:

         DELX=(X(N)-X(1))/NFIG

         OPEN(UNIT=IUD,FILE='lfit.d2',STATUS='UNKNOWN')
         DO I=0,NFIG
            XX=X(1)+I*DELX
            VARB1=ABS(EIGVS(1,1)+XX*EIGVS(2,1))**2*COVDD(1)
            VARB2=ABS(EIGVS(1,2)+XX*EIGVS(2,2))**2*COVDD(2)
            YM=A(1)+A(2)*XX-SQRT(VARB1+VARB2)
            YY=A(1)+A(2)*XX
            YP=A(1)+A(2)*XX+SQRT(VARB1+VARB2)
            WRITE(IUD,200) XX,YM,YY,YP
         END DO
         CLOSE(IUD)

         RETURN
      END
