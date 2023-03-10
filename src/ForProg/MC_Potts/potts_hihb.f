      program potts_hihb
C Copyright, Bernd Berg, Oct 25 2001.
C Heat Bath algorithm: MC production runs for histograms of the 
C      energy (action) and magnetization, ha and hm respectively.
      
      
      character cd*1,cq*2,cl*3
      include 'lat.par'
      include 'mc.par'
      include 'potts.par'
      common /lat/ ns,nla(nd),ipf(nd,ms),ipb(nd,ms)'
      include '../../ForLib/potts_hb.com'
      include 'lat.dat'
C
      lpri=.true.
      call potts_inithb(lpri) ! Initialize Potts Heatbath MC.
C
      do iequi=1,nequi        ! Sweeps for reaching equilibrium.
        call potts_mchb
      end do
C
      write(cd,'(I1.1)') nd
      write(cq,'(I2.2)') nq
      write(cl,'(I3.3)') nla(1)
      open(iud1,file="p"//cd//"d"//cq//"q"//cl//".d",
     &     form="unformatted",status="unknown")
      write(iud1) beta,nd,nq,nla,nlink,nequi,nrpt,nmean
      do irpt=1,nrpt ! nrpt repititions of nmeas measurement sweeps.
        acpt=zero
        call razero(ha,0,nlink)
        do iq=0,nqm1
        do is=0,ms
          hm(is,iq)=zero
        end do
        end do
        do imeas=1,nmeas
          call potts_mchb
        end do
        write(iud1) ha,acpt,irpt,nstate(0),hm
        call write_progress(iud2,"irpt,iact,acpt:",irpt,iact,acpt)
      end do
      close(iud1)
C
      stop
      end

      include 'potts_inithb.f'
      include 'potts_mchb.f'

      include '../../ForLib/ipointer.f'
      include '../../ForLib/isfun.f'
      include '../../ForLib/ixcor.f'
      include '../../ForLib/lat_init.f'
      include '../../ForLib/nsfun.f'

      include '../../ForLib/potts_act.f'
      include '../../ForLib/potts_act_tab.f'
      include '../../ForLib/potts_ran.f'
      include '../../ForLib/potts_wghb.f'
      include '../../ForLib/razero.f'

      include '../../ForLib/ranmar.f'
      include '../../ForLib/rmaset.f'
      include '../../ForLib/rmasave.f'
      include '../../ForLib/write_progress.f'
