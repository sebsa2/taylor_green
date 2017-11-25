program taylor_green
! This script aims to provide the position and the veloicty of given particules introduced 
! into Taylor_Green vortex
	
	!$ use omp_lib
    implicit none
    
    ! Define parameters for the script
    real, parameter :: Pi=3.1415927
    real :: St, deltat
    integer :: N, P, density_matrix_size, nb_outputs_allpart, i, j, k, counter
	integer :: p !p nombre de cases de maillage par coté
    double precision, dimension(:), allocatable :: X,Y,U,V !Particules position and velocity 
    double precision :: Ug, Vg !Gas velocity
	integer, allocatable :: D(:,:,:) !Array with all the density matrix
    character(len=1024) :: filename_output
    
    ! Open and read physical paramaters from params.txt
    open(unit=31, file="params_parallel.txt",form='formatted')
    read(31,*) St, deltat
    read(31,*) N, P, density_matrix_size, nb_outputs_allpart
    
    ! Create of the final arrays X,Y,U,V
    allocate(X(P))
    allocate(Y(P))
    allocate(U(P))
    allocate(V(P))
    
    ! Create name of the output files
    write (filename_output, '("output_density_matrix_St",I4,"_P",I7,"_Tf",I3,"_dt",I3,".txt")' )&
    int(1000*St),P,int(N*deltat),int(1000*deltat)
    
    ! Create output files : 1* for the particules followed at each timestep,
    ! 2* for all the particules followed at some timesteps
    open (unit=11, file=filename_output)

    ! Define initial conditions
	counter = 1
    call random_number(X(:))
    call random_number(Y(:))
    U(:) = 0
    V(:) = 0
	do j=1,P,1
		D(counter, floor(p*X(j))+1, floor(p*Y(j))+1) = 1 + D(1, floor(p*X(j))+1, floor(p*Y(j))+1)
	enddo
    
    write (11, *) ( D(counter,k,:), k=1,density_matrix_size )
    
    ! Loop on time and particules
    do i=1,N-1,1
	
		!$OMP PARALLEL DO
        do j=1,P,1
            Ug = -dsin(2*Pi*X(j)) * dcos(2*Pi*Y(j))
            Vg = dcos(2*Pi*X(j)) * dsin(2*Pi*Y(j))
            
            X(j) = X(j) + deltat*U(j)
            Y(j) = Y(j) + deltat*V(j)
            U(j) = U(j) + deltat*(Ug-U(j)) / St;
            V(j) = V(j) + deltat*(Vg-V(j)) / St;
			
			X(j) = abs(mod(X(j),1.0))
			Y(j) = abs(mod(Y(j),1.0))
			
        enddo
		!$OMP END PARALLEL DO
        
        if (modulo(i,N/nb_outputs_allpart) == 0) then
			counter = counter + 1
			D(counter, floor(p*X(j))+1, floor(p*Y(j))+1) = 1 + D(1, floor(p*X(j))+1, floor(p*Y(j))+1)
            write (11, *) ( D(counter,k,:), k=1,density_matrix_size )
        endif
        
    enddo
	
	close(11)
	close(31)

end program

