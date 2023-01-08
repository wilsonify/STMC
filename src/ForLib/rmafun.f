      function RMAFUN() bind(c)
          use iso_c_binding          
          implicit none
          real(c_double) :: RMAFUN
          real(c_double) :: UNI
          integer(c_int) :: I, J
          real(c_double) :: C, CD, CM    
          real(c_double), dimension(97) :: U          

          common /raset1/ U, C, CD, CM, I, J
          UNI=U(I)-U(J)
          IF(UNI.LT.0.0) UNI=UNI+1.0
          U(I)=UNI           
          I=I-1              
          IF(I.EQ.0) I=97    
          J=J-1              
          IF(J.EQ.0) J=97   
          C=C-CD            
          IF(C.LT.0) C=C+CM
          UNI=UNI-C
          IF(UNI.LT.0.0) UNI=UNI+1.0
          RMAFUN=UNI
    
      end function RMAFUN