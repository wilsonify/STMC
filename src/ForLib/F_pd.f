      FUNCTION F_PD(F) bind(c,name="f_pd_")
         !C Variance ratio probability density.
         use iso_c_binding
         implicit none
         real(c_double) :: F_PD,F,F1H,F2H,Y,FH,GAMMA_LN
         real(c_double),parameter :: HALF=0.5,ONE=1.0
         integer(c_int) :: NF1,NF2

         COMMON /PARFT/ NF1,NF2
         F1H=HALF*NF1
         F2H=HALF*NF2
         Y=F1H*F/F2H
         FH=F1H+F2H
         F_PD=F1H*EXP(-GAMMA_LN(F1H)-GAMMA_LN(F2H)+GAMMA_LN(FH))*
     &        Y**(F1H-ONE)*(Y+ONE)**(-FH)/F2H
         RETURN
      END
