      subroutine razero(ra,n0,n1)
         !C Initializes integer array to zero.
         use iso_c_binding
         implicit none

         dimension ra(n0:n1)
         do i=n0,n1
            ra(i)=zero
         end do
         return
      end
