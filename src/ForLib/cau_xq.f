      FUNCTION CAU_XQ(Q) bind(c,name="cau_xq_")
         !C CAUCHY, CUMULATIVE DISTRIBUTIO FUNCTION. BERG, JUN 1, 1999.
         use iso_c_binding
         implicit none
         real(c_double) :: CAU_XQ,Q,QQ
         real(c_double), parameter :: HALF=0.5,PI=3.14159
         QQ=PI*(Q-HALF)
         CAU_XQ=TAN(QQ)
         RETURN
      END
