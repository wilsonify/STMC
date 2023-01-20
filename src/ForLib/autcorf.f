      function AUTCORF(IT, NDAT, DATA, LMEAN)
     &    bind(c, name='autocorf_')
         ! C Copyright, Bernd Berg, Feb 11 2001.
         ! C The function calculates the autocorrelation
         ! at IT from the input array
         ! C DATA of autocorrelations.
         ! Allowed values of IT are IT=0,1, ... < NDAT.
         use iso_c_binding
         implicit none
         integer(c_int) :: IT
         integer(c_int) :: NDAT
         integer(c_int) :: NN
         integer(c_int) :: I
         real(c_double), dimension(NDAT) :: DATA
         real(c_double) :: AUTCORF,first_term
         real(c_double) :: DMEAN,second_term
         real(c_double) :: STMEAN
         logical(c_bool) :: LMEAN
         real(c_double), parameter :: ONE = 1.0
         real(c_double), parameter :: ZERO = 0.0
         DMEAN=ZERO
         IF(LMEAN) DMEAN=STMEAN(NDAT,DATA)
         NN=NDAT-IT
         AUTCORF=ZERO
         DO I=1,NN
            AUTCORF=AUTCORF+
     &       (DATA(I)-DMEAN)*
     &       (DATA(I+IT)-DMEAN)
         END DO
         IF(LMEAN) THEN
            first_term=NN*ONE
            second_term=((NDAT*ONE)/(NDAT*ONE-ONE))
            AUTCORF=AUTCORF/first_term*second_term
         END IF
         IF(.NOT.LMEAN) THEN
            AUTCORF=AUTCORF/(NN*ONE)
         END IF
         RETURN
      END

