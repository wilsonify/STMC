
      FUNCTION STMEAN(N,X) bind("C",name="STMEAN")
         ! C COPYRIGHT BERND BERG, FEB 10 1990.
         ! C CALCULATION OF THE MEAN VALUE FOR N DATA IN X(N).
         use iso_c_binding
         !   integer(c_int), value :: IT, NDAT
         !   integer(c_int) :: I
         !   real(c_double), dimension(NDAT), intent(in) :: DATA
         !   real(c_double) :: AUTCORF, DMEAN
         !   logical(c_bool) :: NN, LMEAN
         !   real(c_double), parameter :: ONE = 1.0_c_double
         !   real(c_double), parameter :: ZERO = 0.0_c_double
         real(c_int) :: N
         real(c_double), dimension(N) :: X
         real(c_double) :: STMEAN
         real(c_double), parameter :: ZERO = 0.0_c_double
         XM=ZERO
         DO I=1,N
            XM=XM+X(I)
         END DO
         STMEAN=XM/N
         RETURN
      END
