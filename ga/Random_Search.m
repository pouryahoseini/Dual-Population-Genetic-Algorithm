function [ best_found, processing_time, evaluation_number ] = Random_Search( test_function, population_size, chromosome_size  )
%The function to run the random search
%   Outputs:
%       1- 'best_found': The best-found solution by the GA
%       2- 'processing_time': The time taken to do all the GA operations as
%       well as the fitness estimation
%

%setting up default values for the function parameters
if nargin<3
    chromosome_size = 30;
    if nargin<2
        population_size = 2100;
        if nargin<1
            test_function = 1;
        end
    end
end

%setting up
tic;
rng('shuffle');
evaluation_number = 0;

%initialization
ga_population(1:population_size,1:chromosome_size)=randi(2,population_size,chromosome_size)-1;
ga_fitness=zeros(population_size,1);

for i=1:population_size
    ga_fitness(i,1)=Fitness_Function(ga_population(i,:), chromosome_size, test_function);
    evaluation_number = evaluation_number + 1;
end

best_found=max(ga_fitness); %[best_found,best_index]=max(ga_fitness);
%best_chromosome=ga_population(best_index,:);

processing_time = toc;

end

