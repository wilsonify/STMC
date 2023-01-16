      FUNCTION LPT_EX_IA(BETA1,BETA2,IACT1,IACT2) 
     &   bind(c,name="lpt_ex_ia_")
         use iso_c_binding
         implicit none
         real(c_double) :: BETA1,BETA2,IACT1,IACT2,DELH,RMAFUN
         logical :: LPT_EX_IA
         LPT_EX_IA=.FALSE.
         DELH=(BETA2-BETA1)*(IACT2-IACT1)
         IF(RMAFUN().LT.EXP(-DELH)) LPT_EX_IA=.TRUE.
         RETURN
      END
