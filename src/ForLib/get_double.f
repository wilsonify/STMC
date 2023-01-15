      real(c_double) function GET_DOUBLE() bind(c,name="get_double_")
          use iso_c_binding
          implicit none      
          real(c_double) :: x
          x = 0.314159
          GET_DOUBLE = x
      end function GET_DOUBLE
      