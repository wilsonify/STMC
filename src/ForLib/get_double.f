      real(c_double) function get_double() bind(c)
          use iso_c_binding
          implicit none
      
          real(c_double) :: x
      
          x = 0.314159
          get_double = x
      end function get_double
      