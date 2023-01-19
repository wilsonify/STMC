      FUNCTION STUD_PD(T) bind(c,name="stud_pd_")
         use iso_c_binding
         implicit none
         real(c_double) :: STUD_PD,T,F,FHALF,SF,BETA
         real(c_double),parameter :: ONE=1.0,HALF=0.5,TWO=2.0
         integer( c_int) :: NF
         COMMON /PARSTUD/ NF

         F=NF*ONE
         FHALF=HALF*F
         SF=SQRT(F)
         STUD_PD=(ONE+(T/SF)**2)**(-(F+ONE)/TWO)/SF/BETA(HALF,FHALF)

         RETURN
      END
