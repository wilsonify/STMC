      SUBROUTINE RANMAR(XR)
         !C Berg, FEB 10, 1991.
         !C PSEUDO RANDOM NUMBER GENERATOR. PROPOSED BY
         !C MARSAGLIA, ZAMAN AND TSANG, Stat. Prob. 8 (1990) 35.
         use iso_c_binding
         implicit none
         real(c_double) :: XR,U,C,CD,CM,UNI
         integer(c_int) :: i,j
         real(c_double),parameter :: ZERO=0.0,ONE=1.0


         COMMON/RASET1/U(97),C,CD,CM,I,J
C
         UNI=U(I)-U(J)
         IF(UNI.LT.ZERO) UNI=UNI+ONE
         U(I)=UNI
         I=I-1
         IF(I.EQ.0) I=97
         J=J-1
         IF(J.EQ.0) J=97
         C=C-CD
         IF(C.LT.ZERO) C=C+CM
         UNI=UNI-C
         IF(UNI.LT.ZERO) UNI=UNI+ONE
         XR=UNI
C
         RETURN
      END
