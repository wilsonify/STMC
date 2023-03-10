      subroutine p_mu_a(iact_min,nlink,namin,
     &   ndel_muca,beta0,b,a,hasum)
         !C Copyright Bernd Berg, Apr 23 2002.  Potts model, calculates the
         !C dimensionless microcanonical free energy parameters.
         use iso_c_binding
         implicit none
         integer(c_int) :: iact_min,nlink,namin
         integer(c_int) :: ndel_muca,beta0,b,a,hasum
         integer(c_int) :: iact_next,iact_old,iact
         real(c_double),parameter :: HALF=0.5

         dimension b(0:nlink),a(0:nlink),hasum(0:nlink)
         dimension ndel_muca(0:nlink) ! Eliminate in the final version!
C
         if(namin.le.0) stop "POTTS_ZLN: namin false."
         iact_next=namin+ndel_muca(namin) ! For test purposes only.
         a(iact_min)=-(beta0-b(iact_min))*namin ! Ferdinand-Fisher normalization.
         iact_old=iact_min
         do iact=(iact_min+1),nlink
            if(hasum(iact).gt.half) then
               a(iact)=a(iact_old)+(b(iact)-b(iact_old))*iact_old
               if(iact.gt.namin) then
                  if(iact.ne.iact_next) then
                     print'(" iact,_next,hasum:",2I10,1G15.6)',
     &                        iact,iact_next,hasum(iact)
                     stop "muca_a: iact_next problem."
                     if(iact.eq.nlink) stop "muca_a."
                  end if
                  iact_next=iact+ndel_muca(iact)
               end if
               iact_old=iact
            end if
         end do
C
         return
      end
