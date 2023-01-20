      FUNCTION GAMMA_LN(X) bind(c,name="gamma_ln_")
         !C BERG, JUNE 23, 1999.
         !C LN OF GAMMA FUNCTION ALA LANCZOS, SIAM Num. Anal. B1 (1964) 1.
         use iso_c_binding
         implicit none
         real(c_double) X
         real(c_double) SER
         real(c_double) GAMMA_LN
         real(c_double) Y
         real(c_double) first_term
         real(c_double) second_term
         real(c_double) third_term
         real(c_double) log_x
         real(c_double), parameter :: ZERO = 0.0_c_double
         real(c_double), parameter :: HALF = 0.5_c_double
         real(c_double), parameter :: ONE = 1.0_c_double
         real(c_double), parameter :: TWO = 2.0_c_double
         real(c_double), parameter :: THREE = 3.0_c_double
         real(c_double), parameter :: FOUR = 4.0_c_double
         real(c_double), parameter :: FNINE_HALF = 4.5_c_double
         real(c_double), parameter :: FIVE = 5.0_c_double
         real(c_double), parameter :: c1_l = 76.18009173_c_double
         real(c_double), parameter :: c2_l = -86.50532033_c_double
         real(c_double), parameter :: c3_l = 24.01409822_c_double
         real(c_double), parameter :: c4_l = -1.231739516_c_double
         real(c_double), parameter :: c5_l = 0.120858003_c_double
         real(c_double), parameter :: c6_l = -0.536382_c_double
         real(c_double), parameter :: stp_l = 2.50662827465_c_double
         
         IF(X.LE.ZERO) THEN
            PRINT*,"GAMMA_LN: Argument X =",X
            STOP 'GAMMA_LN: illegal argument.'
        END IF

         IF(X.GT.ONE) THEN ! Full accuracy of Lanczos formula.
            Y=X
         ELSE ! Use Gamma(z+1)=z*Gamma(z).
            Y=ONE+X
         ENDIF
         SER=((ONE+C1_L/Y)+C2_L/(Y+ONE))+C3_L/(Y+TWO)
         SER=((SER+C4_L/(Y+THREE))+C5_L/(Y+FOUR))+
     &    C6_L/(Y+FIVE)

         first_term=(Y-HALF) * LOG(Y+FNINE_HALF)
         second_term=(Y+FNINE_HALF)
         third_term=LOG(STP_L*SER)

         GAMMA_LN = first_term - second_term + third_term
         IF(X.GT.ONE) RETURN
         log_x=LOG(X)
         GAMMA_LN=GAMMA_LN-log_x

         RETURN
      END
