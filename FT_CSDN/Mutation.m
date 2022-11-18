 %% Mutation 
    Children_group2=[];
    for i=1:(PopSize-1)
        for gene = 1:len_of_chromosome
            temp(gene)=Children_group1(i,gene);
        end
        if rand(1)<Pm
            for j=1:4
                pos1=randi([1,len_of_chromosome]);                         % Choose the sequence number of a gene to be mutated
                pos2=randi([1,len_of_chromosome]);                         % Choose the another sequence number of a gene to be mutated

                Gene=temp(pos1); 
                temp(pos1)=temp(pos2);
                temp(pos2)=Gene;
            end
        end
    
        for gene = 1:len_of_chromosome
            Children_group2(i,gene)=temp(gene);
        end
        
    end
