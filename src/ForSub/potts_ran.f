      subroutine potts_ran(ista,ns,nq)
         !C Copyright, Bernd Berg, Nov 10 2000.
         !C Assigns random (i.e. beta=0) values 0,..,nq-1 to the states ista(is).
         use iso_c_binding
         implicit none
         real(c_double) :: xr,q
         real(c_double),parameter :: ONE=1.0
         integer(c_int) :: ista,ns,nq,is

         dimension ista(ns)
         q=one*nq
         do is=1,ns
            call ranmar(xr)
            ista(is)=int(q*xr)
         end do
         return
      end
