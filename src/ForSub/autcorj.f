      SUBROUTINE AUTCORJ(IT,NDAT,NBINS,DATA,WORK,ACORJ,LMEAN) bind(c,name="autcorj_")
         !C Copyright, Bernd Berg, Feb 11, 2001.
         !C Calculates the jackknife array of autocorrelation at IT (0\le IT).
         use iso_c_binding
         implicit none
         real(c_double) :: DATA,WORK,ACORJ,DMEAN,STMEAN
         integer(c_int) :: IT,NDAT,NBINS,NN,NBIN,NNJ,IBINS,I1,I2,I
         logical(c_bool) :: LMEAN
         real(c_double),parameter :: ZERO=0.0
         real(c_double) :: first_term, second_term, second_term_one
         real(c_double) :: second_term_two
         DIMENSION DATA(NDAT),WORK(NBINS),ACORJ(NBINS)


         DMEAN=ZERO
         IF(LMEAN) DMEAN=STMEAN(NDAT,DATA)
         NN=NDAT-IT

         NBIN=NN/NBINS
         NNJ=NBINS*NBIN-NBIN
         IF(NBIN.LE.1) STOP "AUTCORJ: NBIN.LE.1!"
         IF(NNJ.LE.IT) STOP "AUTCORJ: NNJ.LE.IT!"
         DO IBINS=1,NBINS
            WORK(IBINS)=ZERO
            I1=1+(IBINS-1)*NBIN
            I2=IBINS*NBIN
            DO I=I1,I2
               first_term = WORK(IBINS)
               second_term_one = DATA(I) - DMEAN
               second_term_two = DATA(I+IT) - DMEAN
               second_term = second_term_one * second_term_two
               WORK(IBINS) = first_term + second_term
            END DO
            WORK(IBINS)=WORK(IBINS)/NBIN
         END DO
         CALL DATJACK(NBINS,WORK,ACORJ)
         ! Correction of bias from DMEAN:
         IF(LMEAN) THEN
            DO IBINS=1,NBINS
               ACORJ(IBINS)=(ACORJ(IBINS)*NDAT)/(NDAT-1)
            END DO
         END IF

         RETURN
      END
