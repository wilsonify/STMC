      subroutine potts_order(ista,iact,nd,ns,iq)
         !C Copyright Bernd Berg, Nov 7 2002
         !C Assigns the value iq to the states ista(is) kept in potts.com
         !C and returns the corresponding action variable iact.
         use iso_c_binding
         implicit none
         integer(c_int) :: ista,iact,nd,ns,iq,is

         dimension ista(ns)
         iact=nd*ns
         do is=1,ns
            ista(is)=iq
         end do
         return
      end
