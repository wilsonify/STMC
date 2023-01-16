      SUBROUTINE AUTCORA(NT,NDAT,DATA,ACOR,LMEAN)
         ! C Copyright, Bernd Berg, Feb 11 2001.
         ! C Calculates the entire array ACOR of autocorrelations: IT=0,1,...
         ! C Small difference to acorf.f, because for IT.NE.NT acorf.f takes
         ! C                              more data into account.

         use iso_c_binding
         implicit none
         real(c_double) :: DATA,ACOR,DMEAN,STMEAN
         real(c_double),parameter :: ZERO=0.0,ONE=1.0
         integer(c_int) :: NT,NDAT,IT,I,NN
         logical(c_bool) :: LMEAN
         DIMENSION DATA(NDAT),ACOR(0:NT)

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
     &                           ((NDAT*ONE)/(NDAT*ONE-ONE))
            IF(.NOT.LMEAN) ACOR(IT)=ACOR(IT)/(NN*ONE)
         END DO
         RETURN
      END
