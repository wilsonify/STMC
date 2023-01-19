      subroutine XY_act1(sta,ipf,ns,nd,act)
         !C Calculates action value iact of potts.com.
         use iso_c_binding
         implicit none
         real(c_double) :: sta,act,ph1
         real(c_double),parameter :: ZERO=0.0
         integer(c_int) :: ipf,ns,nd,IS,ID

         dimension sta(ns),ipf(nd,ns)
         act=zero
         do is=1,ns
            ph1=sta(is)
            do id=1,nd
               act=act+cos(abs(sta(ipf(id,is))-ph1))
            end do
         end do
         return
      end
