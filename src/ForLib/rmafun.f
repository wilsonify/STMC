      function rmafun() bind(c)
          use iso_c_binding
          
          implicit none

          real(c_double) :: rmafun
          real(c_double) :: uni
          integer(c_int) :: i, j
          real(c_double) :: c, cd, cm    
          real(c_double), dimension(97) :: u  
          

          common /raset1/ u, c, cd, cm, i, j
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
          rmafun=UNI
    
      end function rmafun