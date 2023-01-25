      subroutine On_ran(sta,n,ns) bind(c,name="on_ran_")
         !C Copyright, Bernd Berg, Feb 10 2002.
         !C Assigns random (i.e. beta=0) values to the states ista(is).
         use iso_c_binding
         implicit none

         real(c_double) :: sta,SUM,RMAFUN,FN
         real(c_double),parameter :: ZERO=0.0,TWO=2.0,half=0.5,ONE=1.0
         integer(c_int) :: n,ns,is,i

         dimension sta(n,ns)
         do is=1,ns
    1       sum=zero
            do i=1,n
               sta(i,is)=two*(rmafun()-half)
               sum=sum+sta(i,is)**2
            end do
            if(sum.gt.one) go to 1
            fn=one/sqrt(sum)
            do i=1,n
               sta(i,is)=fn*sta(i,is)
            end do
         end do
         return
      end
