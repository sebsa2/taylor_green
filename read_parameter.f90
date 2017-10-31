program test_readfile
    
    implicit none
    
    use, intrinsic :: iso_fortran_env
    character (len=200) :: line
    real :: param
    integer :: nlines, RetCode
    
    open(unit=1, file="parameters.txt")
    nlines = 0
    write(*,*) 'nlines=',nlines
    do
        read_loop: do
            read (1, *, iostat=RetCode)  line
            if ( RetCode == iostat_end)  exit read_loop
            if ( RetCode /= 0 ) exit read_loop
            if ( index (line, "#") /= 0 )  cycle read_loop
            read (line, *) param
        end do read_loop
        
        nlines = nlines + 1
        
    end do
    close(unit=1)
    
    write(*,*) 'nlines=',nlines, line
    
end program