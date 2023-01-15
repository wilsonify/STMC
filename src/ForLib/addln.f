      real(c_double) function ADDLN(ALN,BLN) bind(c,name="addln_")
      ! C Copyright Bernd Berg, Aug 19 2003.
      ! C Given ln(A) and ln(B), the function returns ln(C) with C=A+B.
         use iso_c_binding
         implicit none
         real(c_double) :: ALN
         real(c_double) :: BLN
         real(c_double), parameter :: ONE = 1.0_c_double
         real(c_double) :: first_term
         real(c_double) :: second_term
         first_term = MAX(ALN,BLN)
         second_term = LOG(ONE+EXP(-ABS(ALN-BLN)))
         ADDLN =  first_term + second_term
         RETURN
      END

      
      

