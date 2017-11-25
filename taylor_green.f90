program taylor_green
! This script aims to provide the position and the veloicty of given particules introduced 
! into Taylor_Green vortex

    implicit none
    
    ! Define parameters for the script
    real, parameter :: Pi=3.1415927
    real :: St, deltat
    integer :: N, P, nb_part_alltime, nb_outputs_allpart, i,j,k,part
    double precision, dimension(:,:), allocatable :: X,Y,U,V
    double precision :: Ug, Vg
    double precision, dimension(:), allocatable :: rand_part
    character(len=1024) :: filenameX_all, filenameY_all, filenameU_all, filenameV_all
    character(len=1024) :: filenameX_some, filenameY_some, filenameU_some, filenameV_some
    
    ! Open and read physical paramaters from params.txt
    open(unit=31, file="params.txt",form='formatted')
    read(31,*) St, deltat
    read(31,*) N, P, nb_part_alltime, nb_outputs_allpart
    
    ! Create of the final arrays X,Y,U,V
    allocate(X(N,P))
    allocate(Y(N,P))
    allocate(U(N,P))
    allocate(V(N,P))
    allocate(rand_part(nb_part_alltime))

    ! Create name of the output files
    write (filenameX_all, '("output_X_St",I5,"_P",I7,"_Tf",I3,"_dt",I3,"alltime.txt")' )&
    int(1000*St),P,int(N*deltat),int(1000*deltat)
    write (filenameY_all, '("output_Y_St",I5,"_P",I7,"_Tf",I3,"_dt",I3,"alltime.txt")' )&
    int(1000*St),P,int(N*deltat),int(1000*deltat)
    write (filenameU_all, '("output_U_St",I5,"_P",I7,"_Tf",I3,"_dt",I3,"alltime.txt")' )&
    int(1000*St),P,int(N*deltat),int(1000*deltat)
    write (filenameV_all, '("output_V_St",I5,"_P",I7,"_Tf",I3,"_dt",I3,"alltime.txt")' )&
    int(1000*St),P,int(N*deltat),int(1000*deltat)
    write (filenameX_some, '("output_X_St",I5,"_P",I7,"_Tf",I3,"_dt",I3,"sometime.txt")' )&
    int(1000*St),P,int(N*deltat),int(1000*deltat)
    write (filenameY_some, '("output_Y_St",I5,"_P",I7,"_Tf",I3,"_dt",I3,"sometime.txt")' )&
    int(1000*St),P,int(N*deltat),int(1000*deltat)
    write (filenameU_some, '("output_U_St",I5,"_P",I7,"_Tf",I3,"_dt",I3,"sometime.txt")' )&
    int(1000*St),P,int(N*deltat),int(1000*deltat)
    write (filenameV_some, '("output_V_St",I5,"_P",I7,"_Tf",I3,"_dt",I3,"sometime.txt")' )&
    int(1000*St),P,int(N*deltat),int(1000*deltat)
    
    ! Create output files : 1* for the particules followed at each timestep,
    ! 2* for all the particules followed at some timesteps
    open (unit=11, file=filenameX_all)
    open (unit=12, file=filenameY_all)
    open (unit=13, file=filenameU_all)
    open (unit=14, file=filenameV_all)
    open (unit=21, file=filenameX_some)
    open (unit=22, file=filenameY_some)
    open (unit=23, file=filenameU_some)
    open (unit=24, file=filenameV_some)    
    
    ! Define initial conditions
    call random_number( X(1,:) )
    call random_number( Y(1,:) )
    U(1,:) = 0
    V(1,:) = 0
    
    ! Choose randomly the particules we want to follow at each timestep
    call random_number(rand_part)
    rand_part = FLOOR(P*rand_part)
    
    write (11, *) ( X(1,rand_part(k)), k=1,nb_part_alltime )
    write (12, *) ( Y(1,rand_part(k)), k=1,nb_part_alltime )
    write (13, *) ( U(1,rand_part(k)), k=1,nb_part_alltime )
    write (14, *) ( V(1,rand_part(k)), k=1,nb_part_alltime )
    
    write (21, *) X(1,:)
    write (22, *) Y(1,:)
    write (23, *) U(1,:)
    write (24, *) V(1,:)
    
    ! Loop on time and particules
    do i=1,N-1,1
        do j=1,P,1
            Ug = -dsin(2*Pi*X(i,j)) * dcos(2*Pi*Y(i,j))
            Vg = dcos(2*Pi*X(i,j)) * dsin(2*Pi*Y(i,j))
            
            X(i+1,j) = X(i,j) + deltat*U(i,j)
            Y(i+1,j) = Y(i,j) + deltat*V(i,j)
            U(i+1,j) = U(i,j) + deltat*(Ug-U(i,j)) / St;
            V(i+1,j) = V(i,j) + deltat*(Vg-V(i,j)) / St;
        enddo
        
        write (11, *) ( X(i,rand_part(k)), k=1,nb_part_alltime )
        write (12, *) ( Y(i,rand_part(k)), k=1,nb_part_alltime )
        write (13, *) ( U(i,rand_part(k)), k=1,nb_part_alltime )
        write (14, *) ( V(i,rand_part(k)), k=1,nb_part_alltime )
        
        ! Write in 2* files at some timesteps
        if (modulo(i,N/nb_outputs_allpart) == 0) then
            write (21, *) X(i,:)
            write (22, *) Y(i,:)
            write (23, *) U(i,:)
            write (24, *) V(i,:)
        endif
        
    enddo

end program

