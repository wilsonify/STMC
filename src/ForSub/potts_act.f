      subroutine potts_act(ista,ipf,idel,ns,nqm1,nd,iact)
         use iso_c_binding
         implicit none
         integer(c_int) :: ista,ipf,idel,ns,nqm1,nd,iact
         integer(c_int) :: is,ista1,id,ista2


         !C Calculates action value iact of potts.com.

         dimension ipf(nd,ns),ista(ns),idel(0:nqm1,0:nqm1)
         iact=0
         do is=1,ns
            ista1=ista(is)
            do id=1,nd
               ista2=ista(ipf(id,is))
               iact=iact+idel(ista2,ista1)
            end do
         end do
         return
      end
