      subroutine potts1_wght(wrat,beta,nd)
         !C Copyright, Bernd Berg, Sep 15 2000.
         !C Initialize ratios of weights for MUCA or canonical Metropolis:
         use iso_c_binding
         implicit none
         real(c_double) :: wrat,beta
         real(c_double) :: TWO=2.0
         integer(c_int) :: nd,id

         dimension wrat(-2*nd:2*nd)
         do id=-2*nd,2*nd
            wrat(id)=exp(two*beta*id)
         end do
         return
      end
