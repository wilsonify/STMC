      FUNCTION ADDLN_CUT(ALN,BLN) bind(c,name="addln_cut_")
      ! Copyright Bernd Berg, May 25 2001.
      ! Given ln(A) and ln(B), the function returns ln(C) with C=A+B.
      ! include 'implicit.sta'
      ! include 'constants.par'
      use iso_c_binding          
      implicit none
      real(c_double) :: ADDLN_CUT
      real(c_double) :: ALN
      real(c_double) :: BLN
      real(c_double), parameter :: ONE = 1.0_c_double 
      real(c_double) :: ABS_LN
      real(c_double) :: CUT_OFF
      
      PARAMETER(CUT_OFF=700*ONE) ! Change with precision!
      ABS_LN=ABS(ALN-BLN)
      IF(ABS_LN.GT.CUT_OFF) THEN
        ADDLN_CUT=MAX(ALN,BLN)
      ELSE
        ADDLN_CUT=MAX(ALN,BLN)+LOG(ONE+EXP(-ABS_LN))
      END IF
      RETURN
      END
