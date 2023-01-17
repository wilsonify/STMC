      INTEGER(c_int) FUNCTION NSUM(N1,N2,NA) bind(c,name="nsum_")
         !C SUM of an integer array. Copyright Bernd Berg, Dec 15, 2001.
         use iso_c_binding
         implicit none
         integer(c_int) :: N1,N2,NA,I

         DIMENSION NA(N1:N2)
         NSUM=0
         DO I=N1,N2
            NSUM=NSUM+NA(I)
         END DO
         RETURN
      END
