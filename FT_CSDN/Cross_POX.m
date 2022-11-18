 Children_group1=[];
    for i=1:(PopSize-1)/2
        %Parent individuals are selected for crossover operation:
        %Parent1 is selected sequentially and Parent2 is selected randomly.
        index_parent2 = randi([1,(PopSize-1)/2]);
        for gene = 1:len_of_chromosome
            Parent1(gene)=Parent(i,gene);
            %Parent2(gene)=BestChromosome(gene);%Cross with best chromosome
            Parent2(gene)=Parent(index_parent2,gene);
        end
        
        Children1=zeros(1,len_of_chromosome);
        Children2=zeros(1,len_of_chromosome);
        if rand(1)<=Pc                                                     %The probability is used to determine whether crossover operations are required
            %Randomly divide the set of jobs {1,2,3...,n} into two non-empty sub-sets J1 and J2.
            num_J1 = randi([1,num_of_jobs]);   
            if num_J1==num_of_jobs
                num_J1 = fix(num_of_jobs/2);  
            end
            J = randperm(num_of_jobs);        
            J1 =J(1:num_J1);
           % J2 =J(num_J1+1:n); 
            %Copy the jobs that Parent1 contains in J1 to Children1,
            %and Parent2 contains in J1 to Children2, and keep them in place.
            for index = 1:num_J1
                %Look for the jobs that Parent1 and Parent2 contain in J1
                job = J1(index);
                for j = 1:len_of_chromosome
                    if job == Parent1(j)
                        Children1(j)=Parent1(j);
                        Parent1(j)=0;
                    end
                    if job == Parent2(j)
                        Children2(j)=Parent2(j);
                        Parent2(j)=0;
                    end   
                end  
               
            end
                               
            %Copy the jobs that Parent1 contains in J2 to Children2, 
            %and Parent2 contains in J2 to Children1 in their order.
            for index=1:len_of_chromosome
                if Parent1(index)~=0
                    for j=1:len_of_chromosome
                        if Children2(j)==0
                           Children2(j)=Parent1(index);
                           break;
                        end   
                    end 
                end
                if Parent2(index)~=0
                    for j=1:len_of_chromosome
                        if Children1(j)==0
                           Children1(j)=Parent2(index);
                           break;
                        end   
                    end
                end
            end   %POX Cross over         
        else  
        Children1 = Parent1;
        Children2 = Parent2;  
        end
        

%        condtion = rand(1);
        for gene = 1:len_of_chromosome
%             if condtion>0.5
%                 Children_group1(i, gene)=Children1(gene);
%             else
%                 Children_group1(i, gene)=Children2(gene);
%             end 
        Children_group1(2*i-1, gene)=Children1(gene);
        Children_group1(2*i, gene)=Children2(gene);
        end
    end
