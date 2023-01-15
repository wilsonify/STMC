
      real(c_double) function STMEAN(N,X) bind(c,name="STMEAN")
         ! C COPYRIGHT BERND BERG, FEB 10 1990.
         ! C CALCULATION OF THE MEAN VALUE FOR N DATA IN X(N).
         use iso_c_binding
         implicit none
         integer(c_int), value :: N
         real(c_double) :: N_float
         integer(c_int) :: I
         real(c_double), dimension(N) :: X
         real(c_double) :: XM
         real(c_double), parameter :: ZERO = 0.0_c_double
         N_float=real(N,kind=c_double)
         XM = ZERO
         do i = 1, size(X)
            XM = XM + X(i)
         end do
         STMEAN=XM/N_float
         return
      end function STMEAN

