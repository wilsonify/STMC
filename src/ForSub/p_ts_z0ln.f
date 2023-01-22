      SUBROUTINE P_TS_Z0LN(nq,ns,nlink,nmeas,b,a,tsa,Zln)
         !C Copyright Bernd Berg, Jul 9 2002.
         !C Potts model, time series partition function fraction at beta0=0.
         use iso_c_binding
         implicit none
         real(c_double) :: b,a,tsa,Zln,zln1,addln
         real(c_double),parameter :: TWO=2.0
         integer(c_int) :: nq,ns,nlink,nmeas,imeas,iact

         dimension b(0:nlink),a(0:nlink),tsa(nmeas)
C
         do imeas=1,nmeas
            iact=nint(tsa(imeas))
            if(imeas.eq.1) then
               Zln=two*(-b(iact)*iact+a(iact))
            else
               Zln1=two*(-b(iact)*iact+a(iact))
               Zln=addln(Zln,Zln1)
            end if
         end do
C
         return
      end
