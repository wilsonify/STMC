      subroutine XY_ran1(sta,ns)
         !C Copyright, Bernd Berg, Feb 10 2002.
         !C Assigns random (i.e. beta=0) values 0,..,nq-1 to the states ista(is).
         use iso_c_binding
         implicit none
         real(c_double) :: sta,tpi,rmafun
         integer(c_int) :: ns,is

         dimension sta(ns)
         do is=1,ns
            sta(is)=tpi*rmafun()
         end do
         return
      end
