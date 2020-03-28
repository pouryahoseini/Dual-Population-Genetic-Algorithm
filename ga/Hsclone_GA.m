function [ best_found, processing_time, evaluation_number ] = Hsclone_GA( test_function, population_size, chromosome_size, generation_number, crossover_type, termination_condition, max_evaluations )
%This function implements Half-Sibling-and-a-Clone Genetic Algorithm

%setting up default values for the function parameters
if nargin < 7
    max_evaluations = 5000;
    if nargin < 6
        termination_condition = 'No-Improvement'; % 'Convergence' or 'No-Improvement' or 'Max-Evaluations' or 'Fixed'
        if nargin < 5
            crossover_type = 'Uniform'; % 'One-Point' or 'Uniform'
            if nargin < 4
                generation_number = 20;
                if nargin < 3
                    chromosome_size = 30;
                    if nargin < 2
                        population_size = 100;
                        if nargin < 1
                            test_function = 1;
                        end
                    end
                end
            end
        end
    end
end

%setting up
tic;
rng('shuffle');
evaluation_number = 0;
if strcmp(termination_condition, 'Convergence') || strcmp(termination_condition, 'No-Improvement') || strcmp(termination_condition, 'Max-Evaluations')
    generation_number = inf;
    warning('off','all');
end

%initialization
ga_population(1:population_size,1:chromosome_size)=randi(2,population_size,chromosome_size)-1;
best_chromosome = ga_population(1, :);
best_found = Fitness_Function(best_chromosome, chromosome_size, test_function);
evaluation_number = evaluation_number + 1;
last_time_improvement = evaluation_number;
ga_fitness = zeros(population_size, 1);

%main loop
for generation=1:generation_number
    
    worst_found = best_found/4;
    
    for chromosome_counter = 1:population_size
        
        ga_fitness(chromosome_counter) = Fitness_Function(ga_population(chromosome_counter, : ), chromosome_size, test_function);
        evaluation_number = evaluation_number + 1;
        if (evaluation_number >= max_evaluations) && strcmp(termination_condition, 'Max-Evaluations')
            processing_time = toc;
            return;
        end
        
        if ga_fitness(chromosome_counter) > best_found
            best_chromosome = ga_population(chromosome_counter, : );
            best_found = ga_fitness(chromosome_counter);
            last_time_improvement = evaluation_number;
        elseif ga_fitness(chromosome_counter) < worst_found
            ga_population(chromosome_counter, : ) = Crossover_Hsclone( best_chromosome, randi(2, 1, chromosome_size)-1, chromosome_size, crossover_type );
        else
            ga_population(chromosome_counter, : ) = Crossover_Hsclone( best_chromosome, ga_population(chromosome_counter, : ), chromosome_size, crossover_type );
        end
        
    end
    
    %in the case of non-fixed termination condition
    %check for no improvement in the best found solution
    if strcmp(termination_condition, 'No-Improvement')
        if evaluation_number > last_time_improvement + 10*population_size
            processing_time = toc;
            return;
        end
    elseif strcmp(termination_condition, 'Convergence') %check for convergence
        if ~any(~(ga_fitness > ( best_found - abs(best_found)/100)))
            processing_time = toc;
            return;
        end
    end
    
end

processing_time = toc;

end

function [ offspring ] = Crossover_Hsclone( parent_1, parent_2, chromosome_size, crossover_type )
%The function to perform crossover for Hsclone GA

if strcmp(crossover_type, 'One-Point')
    %One-Point Crossover
    crossover_point = randi(chromosome_size-1)+1;
    offspring = parent_1;
    offspring(crossover_point:chromosome_size) = parent_2(crossover_point:chromosome_size);
else %Uniform Crossover
    offspring = parent_1;
    for gene_counter=1:chromosome_size
        if rand() < 0.5
            offspring(gene_counter)=parent_2(gene_counter);
        end
    end
end

end

