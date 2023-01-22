      subroutine razero(ra,n0,n1)
         !C Initializes integer array to zero.
         use iso_c_binding
         implicit none
         real(c_double) :: ra
         real(c_double),parameter :: ZERO=0.0
         integer(c_int) :: n0,n1,i

         dimension ra(n0:n1)
         do i=n0,n1
            ra(i)=zero
         end do
         return
      end
