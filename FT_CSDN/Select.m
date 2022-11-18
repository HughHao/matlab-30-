    %% Selection using Roulette Wheel
    Parent = [];   
    TotalFitness=sum(Pfit_value);                                           % Calculate the total fitness value - the denominator used in roulette  
    for i=1:PopSize                                                               % Calculate the probability of each individual being selected, 
        Pfit_value(i)=Pfit_value(i)/TotalFitness;                           % the molecule used in roulette
    end
                                                 
    
     % select (PopSize-1)/2
    SelectedChromosome=zeros(1,len_of_chromosome);

    for memeber=1:(PopSize-1)/2
        WheelSelectionNumber=rand;                                       
        Toltal = 0;
        for i=1:PopSize
            Toltal=Toltal+Pfit_value(i);          
            if (Toltal-Pfit_value(i))< WheelSelectionNumber && Toltal>=WheelSelectionNumber
                for gene = 1:len_of_chromosome
                    SelectedChromosome(gene)=population(i,gene);           % select one chromosome
                end
                break
            else    
                for gene = 1:len_of_chromosome
                    SelectedChromosome(gene)=population(i,gene);           % select current chromosome
                end  
            end
        end

        for gene = 1:len_of_chromosome
            Parent(memeber,gene)=SelectedChromosome(gene);
        end
    end 
