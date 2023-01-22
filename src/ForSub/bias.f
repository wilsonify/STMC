      SUBROUTINE BIAS(N,XJ,XM,XMM,BIASM) bind(c,name="bias_")
         !C Copyright, Bernd Berg, Jan 10 1992.
         !C ESTIMATES THE BIAS (ASSUMPTION: BIAS=CONST/N)  BIASM  AND
         !C THE BIAS-CORRECTED MEAN VALUE  XMM  FROM THE FOLLOWING
         !C INPUT:  XJ(N) JACKKNIFE BINS AND
         !C         XM    MEAN VALUE FROM ENTIRE STATISTICS.
         !C
         use iso_c_binding
         implicit none
         real(c_double) :: XJ,XM,XMM,BIASM,XJM,STMEAN
         integer(c_int) :: N
         DIMENSION XJ(N)
         XJM=STMEAN(N,XJ)
         BIASM=(N-1)*(XM-XJM)
         XMM=XM+BIASM
         RETURN
      END
