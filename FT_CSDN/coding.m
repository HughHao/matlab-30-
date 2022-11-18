%% Coding
%Coding is based on the step of the job
initial=[];
for i = 1:num_of_jobs
    for j = 1:number_of_machines
        initial=[initial i];
    end
end
%Generate population with chromosome containing random genes 
for i = 1:PopSize
    population(i,:)=initial(randperm(length(initial(:))));
end
