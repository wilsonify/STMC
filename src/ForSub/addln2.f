      SUBROUTINE ADDLN2(ALN,BLN,CLN,ISGN) bind(c,name="addln2_")
C Copyright, Bernd Berg, Aug 20, 2003.
C Given ln(A) and ln(B), A>0,B>0. Output for
C ISGN=+1: CLN=ln(C) with C=A+B, ISGN unchanged,
C ISGN=-1: CLN=ln(C) with C=|A-B|, ISGN=+1 for A>B and ISGN=-1 for A<B.
         use iso_c_binding
         implicit none
         real(c_double) :: ALN,BLN,CLN,abs_ln
         integer(c_int) :: ISGN

         real(c_double), parameter :: EM11 = 1.D-11
         real(c_double), parameter :: ONE = 1.0_c_double
         real(c_double), parameter :: EPS=EM11,CUT_OFF=700*ONE ! Change with precission!
         ABS_LN=ABS(ALN-BLN)
         IF(ABS_LN.GT.CUT_OFF) THEN
            CLN=MAX(ALN,BLN)
         ELSE
            IF(ISGN.EQ.1) THEN
               CLN=MAX(ALN,BLN)+LOG(ONE+EXP(-ABS_LN))
            ELSE
               IF(ABS_LN.LT.EPS) THEN
                  PRINT*,"SUBROUTINE ADDLN2: C=0."
                  STOP "SUBROUTINE ADDLN2: C=0."
               END IF
               IF(ALN.GT.BLN) ISGN=+1
               CLN=MAX(ALN,BLN)+LOG(ONE-EXP(-ABS_LN))
            END IF
         END IF
         RETURN
      END


