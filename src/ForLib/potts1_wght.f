      subroutine potts1_wght(wrat,beta,nd)
         !C Copyright, Bernd Berg, Sep 15 2000.
         !C Initialize ratios of weights for MUCA or canonical Metropolis:
         use iso_c_binding
         implicit none

         dimension wrat(-2*nd:2*nd)
         do id=-2*nd,2*nd
            wrat(id)=exp(two*beta*id)
         end do
         return
      end
