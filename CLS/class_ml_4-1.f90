program CLS_

  implicit none

  integer,   parameter   :: startyear = 2001, endyear = 2040
  integer,   parameter   :: ndata = 8 

  integer                :: xsize, ysize, zsize, tsize, nvars, dset,  &
       &                    n, z, t, zmin, zmax, tindex, season
  real                   :: miss
  real,      allocatable :: lon( : ), lat( : ), lev( : ), tmp( :, : ), &
       &                    data( :, :, : )
  character, allocatable :: vars( : )*20, dims( : ) * 4
  character              :: file_monthly*50, file_seasonal*50, &
       &                    file_clim*50,    file_stdv*50,     &
       &                    title*100, description*100,        &
       &                    history*100,                       &
       &                    zname*20, zunits*20, tunits*20,    &
       &                    units*20, longname*50
  logical                :: exist_seasonal, exist_clim, exist_stdv


  read(10, ""
  )

  w()
  t()

  y=


  do dset = 1, ndata
     file_monthly  = trim( dataset( dset ) )//".nc"
     file_seasonal = trim( dataset( dset ) )//"_seasonal.nc"
     file_clim     = trim( dataset( dset ) )//"_seasonal_clim.nc"
     file_stdv     = trim( dataset( dset ) )//"_seasonal_stdv.nc"


             &          zname, zunits, tunits, title, history, description )
     end if
     inquire( file = trim( file_stdv ), exist = exist_stdv )
     if ( exist_stdv ) then
        call open_nc( trim( file_stdv ), writable = .true. )
     else
        call create_nc( trim( file_stdv ), xsize, ysize, zsize, 4,          &
             &          zname, zunits, tunits, title, history, description )
     end if

     allocate( vars( nvars ), dims( nvars ), &
          &    lon( xsize ), lat( ysize ), lev( zsize ), &
          &    tmp( xsize, ysize ), data( xsize, ysize, tsize / 12 ) )
     call list_var_nc( trim( file_monthly ), nvars, vars, dims )

  enddo
end program CLS_
