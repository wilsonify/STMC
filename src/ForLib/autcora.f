      SUBROUTINE AUTCORA(NT,NDAT,DATA,ACOR,LMEAN)
C Copyright, Bernd Berg, Feb 11 2001.
C Calculates the entire array ACOR of autocorrelations: IT=0,1,...
C Small difference to acorf.f, because for IT.NE.NT acorf.f takes
C                              more data into account.

      DIMENSION DATA(NDAT),ACOR(0:NT)
      logical :: LMEAN
      DMEAN=ZERO
      IF(LMEAN) DMEAN=STMEAN(NDAT,DATA)
      DO IT=0,NT
        ACOR(IT)=ZERO
      END DO
C
      NN=NDAT-NT
      DO I=1,NN
        DO IT=0,NT
          ACOR(IT)=ACOR(IT)+(DATA(I)-DMEAN)*(DATA(I+IT)-DMEAN)
        END DO
      END DO
C
      DO IT=0,NT
        IF(LMEAN) ACOR(IT)=ACOR(IT)/(NN*ONE)*
     &                       ((NDAT*ONE)/(NDAT*ONE-ONE))
        IF(.NOT.LMEAN) ACOR(IT)=ACOR(IT)/(NN*ONE)
      END DO
      RETURN
      END
