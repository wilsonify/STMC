      function ADDLN(ALN,BLN) bind(C,name="ADDLN")
         ! C Copyright Bernd Berg, Aug 19 2003.
         ! C Given ln(A) and ln(B), the function returns ln(C) with C=A+B.
         use iso_c_binding
         real(c_double) :: ADDLN
         real(c_double) :: ALN
         real(c_double) :: BLN
         real(c_double), parameter :: ONE = 1.0_c_double
         ADDLN=MAX(ALN,BLN)+LOG(ONE+EXP(-ABS(ALN-BLN)))
         RETURN
      END


