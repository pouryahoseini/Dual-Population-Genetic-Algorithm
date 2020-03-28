function [ best_found, processing_time, evaluation_number ] = Dual_Population_GA_DeleteWorst( test_function, population_size, chromosome_size, iteration_number, tournament_size, crossover_rate, mutation_rate, selection_type, crossover_type, termination_condition, max_evaluations )
%The function to run the steady-state genetic algorithm with the
%dual-population scheme enabled
%   Outputs:
%       1- 'best_found': The best-found solution by the GA
%       2- 'processing_time': The time taken to do all the GA operations as
%       well as the fitness estimation
%

%setting up default values for the function parameters
if nargin<11
    max_evaluations = 5000;
    if nargin<10
        termination_condition = 'No-Improvement'; % 'Convergence' or 'No-Improvement' or 'Max-Evaluations' or 'Fixed'
        if nargin<9
            crossover_type = 'Uniform'; % 'Uniform' or 'One-Point'
            if nargin<8
                selection_type='roulette'; % 'roulette' or 'tournament'
                if nargin<7
                    mutation_rate = 0.25;
                    if nargin<6
                        crossover_rate = 0.8;
                        if nargin<5
                            tournament_size = 8;
                            if nargin<4
                                iteration_number = 1000;
                                if nargin<3
                                    chromosome_size = 30;
                                    if nargin<2
                                        population_size = 100;
                                        if nargin<1
                                            test_function = 1;
                                        end
                                    end
                                end
                            end
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
    iteration_number = inf;
    warning('off','all');
end

%initialization
ga_population_1(1:population_size,1:chromosome_size)=randi(2,population_size,chromosome_size)-1;
ga_fitness_1=zeros(population_size,1);

for i=1:population_size
    ga_fitness_1(i,1)=Fitness_Function(ga_population_1(i,:), chromosome_size, test_function);
    evaluation_number = evaluation_number + 1;
end

last_time_improvement = evaluation_number;

[best_found,~]=max(ga_fitness_1); %[best_found,best_index]=max(ga_fitness_1);
%best_chromosome=ga_population_1(best_index,:);

ga_population_2 = ga_population_1;
ga_fitness_2 = ga_fitness_1;

%starting the main loop
for iteration=1:iteration_number
    
    %Parent Selection
    if mod(iteration_number, 2) == 0
        if strcmp(selection_type, 'tournament') %Tournament selection
            contestants_index=randi(population_size, 1, tournament_size);
            [~, winner_index]=max(ga_fitness_1(contestants_index,1));
            child_1=ga_population_1(contestants_index(winner_index),:);

            contestants_index=randi(population_size, 1, tournament_size);
            [~,winner_index]=max(ga_fitness_1(contestants_index,1));
            child_2=ga_population_1(contestants_index(winner_index),:);
        else %Roulette wheel selection
            cumulative_fitness = ga_fitness_1 - min(ga_fitness_1);
            cumulative_fitness = cumsum(cumulative_fitness);
            cumulative_fitness = cumulative_fitness / max(cumulative_fitness);
            
            winner_index = find((cumulative_fitness >= rand()) == 1, 1, 'first');
            if ~isempty(winner_index)
                child_1=ga_population_1(winner_index,:);
            
                winner_index = find((cumulative_fitness >= rand()) == 1, 1, 'first');
                child_2=ga_population_1(winner_index,:);
            else 
                child_1=ga_population_1(randi(population_size),:);
                child_2=ga_population_1(randi(population_size),:);
            end
        end
    else
        %Parent Selection
        if strcmp(selection_type, 'tournament') %Tournament selection
            contestants_index=randi(population_size, 1, tournament_size);
            [~, winner_index]=max(ga_fitness_2(contestants_index,1));
            child_1=ga_population_2(contestants_index(winner_index),:);

            contestants_index=randi(population_size, 1, tournament_size);
            [~,winner_index]=max(ga_fitness_2(contestants_index,1));
            child_2=ga_population_2(contestants_index(winner_index),:);
        else %Roulette wheel selection
            cumulative_fitness = ga_fitness_2 - min(ga_fitness_2);
            cumulative_fitness = cumsum(cumulative_fitness);
            cumulative_fitness = cumulative_fitness / max(cumulative_fitness);
            
            winner_index = find((cumulative_fitness >= rand()) == 1, 1, 'first');
            if ~isempty(winner_index)
                child_1=ga_population_2(winner_index,:);
            
                winner_index = find((cumulative_fitness >= rand()) == 1, 1, 'first');
                child_2=ga_population_2(winner_index,:);
            else 
                child_1=ga_population_2(randi(population_size),:);
                child_2=ga_population_2(randi(population_size),:);
            end
        end
    end
    
    %Crossover
    if strcmp(crossover_type, 'One-Point')
        %One-Point Crossover
        if rand() < crossover_rate
            crossover_point = randi(chromosome_size-1)+1;
            crossover_stash = child_1(crossover_point:chromosome_size);
            child_1(crossover_point:chromosome_size) = child_2(crossover_point:chromosome_size);
            child_2(crossover_point:chromosome_size) = crossover_stash;
        end  
    else %Uniform Crossover
        if rand() < crossover_rate
            for gene_counter=1:chromosome_size
                if rand() < 0.5
                    crossover_stash=child_1(gene_counter);
                    child_1(gene_counter)=child_2(gene_counter);
                    child_2(gene_counter)=crossover_stash;
                end
            end
        end
    end

    %One point mutation
    %offspring 1
    if rand() < mutation_rate
        x=randi(chromosome_size);
        child_1(x)=abs(child_1(x)-1); %toggles selected bit
    end
    %offspring 2
    if rand() < mutation_rate
        x=randi(chromosome_size);
        child_2(x)=abs(child_2(x)-1); %toggles selected bit
    end

    %Fitness calculation
    [child_1_fitness]=Fitness_Function(child_1, chromosome_size, test_function);
    [child_2_fitness]=Fitness_Function(child_2, chromosome_size, test_function);
    evaluation_number = evaluation_number + 2;
    if (evaluation_number >= max_evaluations) && strcmp(termination_condition, 'Max-Evaluations')
        processing_time = toc;
        return;
    end
    
    %Replacing worst individuals by offspring
    if mod(iteration_number, 2) == 1
        [~, sorted_ga_index_1] = sort(ga_fitness_1(:));
        
        ga_population_1( sorted_ga_index_1(1), : ) = child_1;
        ga_population_1( sorted_ga_index_1(2), : ) = child_2;
        ga_fitness_1( sorted_ga_index_1(1) ) = child_1_fitness;
        ga_fitness_1( sorted_ga_index_1(2) ) = child_2_fitness;
    else
        [~, sorted_ga_index_2] = sort(ga_fitness_2(:));
        
        ga_population_2( sorted_ga_index_2(1), : ) = child_1;
        ga_population_2( sorted_ga_index_2(2), : ) = child_2;
        ga_fitness_2( sorted_ga_index_2(1) ) = child_1_fitness;
        ga_fitness_2( sorted_ga_index_2(2) ) = child_2_fitness;
    end
    
    %updating the best-found chromosome
    if (child_1_fitness > best_found)
         best_found = child_1_fitness;
         last_time_improvement = evaluation_number;
         %best_chromosome = child_1;
    end
    if (child_2_fitness > best_found)
        best_found = child_2_fitness;
        last_time_improvement = evaluation_number;
        %best_chromosome = child_2;
    end
    
    %in the case of non-fixed termination condition
    %check for no improvement in the best found solution
    if strcmp(termination_condition, 'No-Improvement')
        if evaluation_number > last_time_improvement + 10*population_size
            processing_time = toc;
            return;
        end
    elseif strcmp(termination_condition, 'Convergence') %check for convergence
        if (~any(~(ga_fitness_1 > ( best_found - abs(best_found)/100)))) || (~any(~(ga_fitness_2 > ( best_found - abs(best_found)/100))))
            processing_time = toc;
            return;
        end
    end
    
end

processing_time = toc;

end

