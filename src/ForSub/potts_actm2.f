      FUNCTION potts_actm2(iamin,iamax,ha)
         !C Copyright, Bernd Berg, Apr 17 2002.
         !C Calculation of the mean action variable from its histogram.
         !C Works for the mean of any histogram.
         use iso_c_binding
         implicit none
         real(c_double) :: potts_actm2, potts_actm, hsum
         real(c_double),parameter :: ZERO=0.0
         integer(c_int) :: iamin,iamax,ha,ia


         dimension ha(iamin:iamax)
         potts_actm=zero
         hsum=zero
         do ia=iamin,iamax
            potts_actm=potts_actm+ia*ha(ia)
            hsum=hsum+ha(ia)
         end do
         potts_actm2=potts_actm/hsum ! Average.
         return
      end
