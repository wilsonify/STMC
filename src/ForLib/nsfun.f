      function nsfun(nla,nd) bind(c,name="nsfun_")
C Copyright, Bernd Berg, June 10, 1999.
C Calculates number of lattice sites ns from edges nla(1:nd)
      dimension nla(nd)
      nsfun=1
      do id=1,nd
        nsfun=nsfun*nla(id)
      end do
      return
      end
