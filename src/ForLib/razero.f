      subroutine razero(ra,n0,n1)
C Initializes integer array to zero.

      dimension ra(n0:n1)
      do i=n0,n1
        ra(i)=zero
      end do
      return
      end
