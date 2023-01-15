      subroutine ac_int(nt, acor, acint) bind(c,name="ac_int_")
           use iso_c_binding
           implicit none       
           integer(c_int) :: nt
           real(c_double), dimension(0:nt) :: acor, acint
           real(c_double), parameter :: one = 1.0_c_double
           real(c_double), parameter :: two = 2.0_c_double
           integer(c_int) :: it
       
           acint(0) = one
           do it = 1, nt
               acint(it) = acint(it-1) + two * acor(it) / acor(0)
           end do
           return
       
       end subroutine ac_int
       