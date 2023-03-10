      subroutine XY_act(sta,ipf,ns,nd,act)
         !C Copyright, Bernd Berg, Feb 20 2002.
         !C Calculates action value iact of potts.com.
         use iso_c_binding
         implicit none
         real(c_double) :: sta,act
         real(c_double),parameter :: zero=0.0
         integer(c_int) :: ipf,ns,nd,IS,ID

         dimension sta(2,ns),ipf(nd,ns)
         act=zero
         do is=1,ns
            do id=1,nd
               act=act+sta(1,is)*sta(1,ipf(id,is))+
     &          sta(2,is)*sta(2,ipf(id,is))
            end do
         end do
         return
      end
