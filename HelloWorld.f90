program Hello

    !$ use omp_lib
    !$OMP PARALLEL
    write(*,*) 'Thread Number:',OMP_GET_THREAD_NUM()
    write(*,*) 'Number of Threads:',OMP_GET_NUM_THREADS()
    
    write(*,*) 'Hello World'
    
    !$OMP END PARALLEL
    
end program