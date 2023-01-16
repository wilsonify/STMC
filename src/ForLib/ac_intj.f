      SUBROUTINE AC_INTJ(NT,NBINS,ACORJ,ACINTJ) bind(c,name="ac_intj_")
         ! C Copyright, Bernd Berg, Feb 11 2001.
         ! C Input:  Jackknife array of autocorrelations ACORJ.
         ! C Output: Jackknife array of integrated autocorrelation times ACINTJ.
         use iso_c_binding
         implicit none
         REAL(c_double) :: ACORJ,ACINTJ
         integer(c_int) ::NT,NBINS,IBINS,IT
         real(c_double),parameter :: TWO=2.0,ONE=1.0
         DIMENSION ACORJ(NBINS,0:NT),ACINTJ(NBINS,0:NT)
         DO IBINS=1,NBINS
            ACINTJ(IBINS,0)=ONE
            DO IT=1,NT
               ACINTJ(IBINS,IT)=ACINTJ(IBINS,IT-1)+TWO*ACORJ(IBINS,IT)
     &                                                /ACORJ(IBINS,0)
            END DO
         END DO
         RETURN
      END
