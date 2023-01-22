      subroutine potts_wght(wrat,beta,nlink,nd)
         !C Copyright, Bernd Berg, Nov 24 2000.
         !C Initialize ratios of weights for MUCA or canonical Metropolis:
         use iso_c_binding
         implicit none
         real(c_double) :: wrat,beta
         real(c_double),parameter :: TWO=2.0
         integer(c_int) :: nd,nlink,id,ilink

         dimension wrat(-2*nd:2*nd,0:nlink)
         do id=-2*nd,2*nd
            do ilink=0,nlink
               wrat(id,ilink)=exp(two*beta*id)
            end do
         end do
         return
      end
