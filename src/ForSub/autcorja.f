      SUBROUTINE AUTCORJA(NT,NDAT,NBINS,DATA,WORK,ACORJ,LMEAN) bind(c,name="autcorja_")
     &   bind(c,name="autcorja_")
C Copyright, Bernd Berg, Apr 20 2002.
C Jackknife array of autocorrelation at IT (0\le IT).
         use iso_c_binding
         implicit none
         logical(c_bool) :: LMEAN
         real(c_double) :: DMEAN, WORK1(NDAT),WORK2(NBINS), WORK
         real(c_double) :: DATA,ACORJ,STMEAN
         real(c_double),parameter :: ZERO=0.0
         integer(c_int) :: NN, I, IBINS, I1, I2, NBIN, NNJ,IT
         integer(c_int) :: NT,NDAT,NBINS

         DIMENSION DATA(NDAT),ACORJ(NBINS,0:NT)

         DMEAN=ZERO
         IF(LMEAN) DMEAN=STMEAN(NDAT,DATA)
         NN=NDAT-IT
         DO I=1,NN
            WORK1(I)=(DATA(I)-DMEAN)*(DATA(I+IT)-DMEAN)
         END DO
c
         NBIN=NN/NBINS
         NNJ=NBINS*NBIN-NBIN
         IF(NBIN.LE.1)   STOP "AUTCORJ: NBIN.LE.1!"
         IF(NNJ.LE.IT) STOP "AUTCORJ: NNJ.LE.IT!"
         DO IBINS=1,NBINS
            WORK2(IBINS)=ZERO
            I1=1+(IBINS-1)*NBIN
            I2=IBINS*NBIN
            DO I=I1,I2
               WORK2(IBINS)=WORK2(IBINS)+WORK1(I)
            END DO
            WORK2(IBINS)=WORK2(IBINS)/NBIN
         END DO
         CALL DATJACK(NBINS,WORK2,ACORJ)
C Correction of bias from DMEAN:
         IF(LMEAN) THEN
            DO IBINS=1,NBINS
               ACORJ(IBINS, 0:NT)=(ACORJ(IBINS, 0:NT)*NDAT)/(NDAT-1)
            END DO
         END IF
c
         RETURN
      END
