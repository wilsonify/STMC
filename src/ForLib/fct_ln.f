      FUNCTION FCT_LN(K)
         !C Calculates the Log of the factorial k!.
         use iso_c_binding
         implicit none
         real(c_double) :: FCT_LN
         integer(c_int) :: K
         real(c_double) :: XKP1
         real(c_double), parameter :: ONE=1.0
         real(c_double) :: GAMMA_LN

         XKP1=(K+1)*ONE
         FCT_LN=GAMMA_LN(XKP1)
         RETURN
      END
