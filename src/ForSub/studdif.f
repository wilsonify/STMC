      SUBROUTINE STUDDIF(XM1,EB1,NDAT1,XM2,EB2,NDAT2,Q)

         !C Q: STUDENT'S DIFFERENCE TEST: COMPARISION OF TWO MEANS.
         use iso_c_binding
         implicit none
         real(c_double) :: XM1,EB1,XM2,EB2,Q
         real(c_double) :: S12,S22,S2,T,STUD_DF
         real(c_double),parameter :: ONE=1.0,TWO=2.0
         integer(c_int) :: NF,NF1,NF2,NDAT1,NDAT2


         COMMON /PARSTUD/ NF
         COMMON /PARFT/   NF1,NF2
C
C DEGREES OF FREEDOM:
         NF=NDAT1+NDAT2-2
C VARIANCES SQUARED:
         S12=NDAT1*EB1**2
         S22=NDAT2*EB2**2
         S2=((NDAT1-1)*S12+(NDAT2-1)*S22)/(NF*ONE)
         S2=(ONE/NDAT1+ONE/NDAT2)*S2
         PRINT*,'NDAT1,NDAT2,S2:',NDAT1,NDAT2,S2
C
         T=ABS(XM1-XM2)/SQRT(S2)
         Q=TWO*STUD_DF(-T)
C
         RETURN
      END
