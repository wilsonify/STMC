      SUBROUTINE STEB2(N,DAT,EB,W,XM,XE)
         !C  COPYRIGHT BERND BERG, MARCH 4, 1990.
         !C  INPUT:   DATA (GAUSSIAN), ERROR BARS  AND  (OPTIONAL) WEIGHT
         !C           FACTORS. (IF WEIGHT FACTORS ARE NOT GIVEN: PUT
         !C           W(1) < 0  AND WEIGHT FACTORS WILL WE CALCULATED
         !C           FROM THE ERROR BARS EB.)
         !C  OUTPUT:  MEAN VALUE XM AND ITS ERROR BAR XE.
         !C           WEIGHT FACTORS ARE RETURNED NORMALIZED TO ONE.
         use iso_c_binding
         implicit none
         real(c_double) :: DAT,EB,W,XM,XE,WNORM,XV,WNORMI
         real(c_double),parameter :: ZERO=0.0,ONE=1.0
         integer(c_int) :: N,I

         DIMENSION DAT(N),EB(N),W(N)
C
C CALCULATION OF WEIGHTS FROM ERROR BARS
C (IF WEIGHTS ARE NOT EXPLICITLY GIVEN)
C
         IF(W(1).LE.ZERO) THEN
            DO I=1,N
               W(I)=ONE/EB(I)**2
            END DO
         END IF
C
C NORMALIZE WEIGHT FACTORS TO ONE:
C
         WNORM=ZERO
         DO I=1,N
            WNORM=WNORM+W(I)
         END DO
         WNORMI=ONE/WNORM
         DO I=1,N
            W(I)=WNORMI*W(I)
         END DO
C
C WEIGHTED MEAN VALUE:
C
         XM=ZERO
         DO I=1,N
            XM=XM+W(I)*DAT(I)
         END DO
C
C WEIGHTED ERROR:
C
         XE=ZERO
         DO I=1,N
            XE=XE+W(I)**2*EB(I)**2
         END DO
         XE=SQRT(XE)
C
C VARIANCE:
C
         XV=XE*SQRT((N*ONE))
C
         RETURN
      END
