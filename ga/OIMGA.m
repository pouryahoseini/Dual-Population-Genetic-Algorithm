function [ best_found, processing_time, evaluation_number ] = OIMGA( test_function, population_size, chromosome_size, search_size, t_gens, k_gens, d_adjustor, mutation_rate, termination_condition, max_evaluations )
%This function implements Optimum Individual Monogenetic Genetic Algorithm

%setting up default values for the function parameters
if nargin < 10
    max_evaluations = 5000;
    if nargin < 9
        termination_condition = 'No-Improvement'; % 'No-Improvement' or 'Max-Evaluations'
        if nargin < 8
            mutation_rate = 0.382;
            if nargin < 7
                d_adjustor = 4;
                if nargin < 6
                    k_gens = 5;
                    if nargin < 5
                        t_gens = 6;
                        if nargin < 4
                            search_size = 16;
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
        end
    end
end

%setting up
tic;
rng('shuffle');
evaluation_number = 0;
best_found = -inf;
top_fitness = -inf;
if strcmp(termination_condition, 'Max-Evaluations')
    t_gens = inf;
    warning('off', 'all');
end

g = t_gens;
while g > 0
    d = d_adjustor;
    for i = 1:population_size
        loiChrom = randi(2, 1, chromosome_size) - 1;
        loiFit = Fitness_Function(loiChrom, chromosome_size, test_function);
        evaluation_number = evaluation_number + 1;
        if (evaluation_number >= max_evaluations) && strcmp(termination_condition, 'Max-Evaluations')
            best_found = top_fitness;
            processing_time = toc;
            return;
        end
        if loiFit > best_found
            best_chromosome = loiChrom;
            best_found = loiFit;
        end
    end
    
    k = k_gens;
    while k > 0
        
        update = 0;
        
        for i=1:search_size
            tempChrom = best_chromosome;
            for j=d:1
                if rand() < mutation_rate
                    tempChrom(j) = not(tempChrom(j));
                end
            end
            tempFit = Fitness_Function(tempChrom, chromosome_size, test_function);
            evaluation_number = evaluation_number + 1;
            if (evaluation_number >= max_evaluations) && strcmp(termination_condition, 'Max-Evaluations')
                best_found = top_fitness;
                processing_time = toc;
                return;
            end
            if tempFit > best_found
                best_chromosome = tempChrom;
                best_found = tempFit;
                update = update + 1;
                k = k_gens;
                d = d_adjustor;
            end
        end
        
        if update == 0
            d = d + 1;
        end
        
        k= k - 1;
        
    end
    
    if best_found > top_fitness
        %top_chromosome = best_chromosome;
        top_fitness = best_found;
        g = t_gens;
    end
    
    g = g - 1;
end

best_found = top_fitness;
processing_time = toc;

end

