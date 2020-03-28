function [ best_found, processing_time, evaluation_number ] = Compact_GA( test_function, population_size, chromosome_size, termination_condition, max_evaluations  )
%This function implements Compact Genetic Algorithm

%setting up default values for the function parameters
if nargin < 5
    max_evaluations = 5000;
    if nargin < 4
        termination_condition = 'No-Improvement'; % 'No-Improvement' or 'Max-Evaluations'
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

%setting up
tic;
rng('shuffle');
evaluation_number = 0;

%initialization
p = ones(1,chromosome_size) * 0.5;

a = zeros(1, chromosome_size);
b = zeros(1, chromosome_size);

%main loop
not_converged = true;
while not_converged
    
    %generating two random chromosomes
    for gene_counter = 1:chromosome_size
        if rand() < p(gene_counter)
            a(gene_counter) = 1;
        else
            a(gene_counter) = 0;
        end
        
        if rand() < p(gene_counter)
            b(gene_counter) = 1;
        else
            b(gene_counter) = 0;
        end
    end
    
    %fitness evaluation
    a_fitness = Fitness_Function(a, chromosome_size, test_function);
    b_fitness = Fitness_Function(b, chromosome_size, test_function);
    evaluation_number = evaluation_number + 2;
    if (evaluation_number >= max_evaluations - 1) && strcmp(termination_condition, 'Max-Evaluations')
        best_found = Fitness_Function((p>0.5), chromosome_size, test_function);
        evaluation_number = evaluation_number + 1;
        processing_time = toc;
        return;
    end
    
    %updating probability
    for gene_counter = 1:chromosome_size
        if a_fitness > b_fitness
            if a(gene_counter) == 1 && b(gene_counter) == 0
                p(gene_counter) = min(1, p(gene_counter)+(1/population_size));
            end
            
            if a(gene_counter) == 0 && b(gene_counter) == 1
                p(gene_counter) = max(0, p(gene_counter)-(1/population_size));
            end
        else
            if a(gene_counter) == 1 && b(gene_counter) == 0
                p(gene_counter) = max(0, p(gene_counter)-(1/population_size));
            end
            
            if a(gene_counter) == 0 && b(gene_counter) == 1
                p(gene_counter) = min(1, p(gene_counter)+(1/population_size));
            end
        end
    end
    if (~any(~((p==0)+(p==1))))
        not_converged = false;
    end
end

best_found = Fitness_Function(p, chromosome_size, test_function);
evaluation_number = evaluation_number + 1;
processing_time = toc;

end

