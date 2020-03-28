function [ cGA_average_fitness, ssGA_average_fitness, dpGAdw_average_fitness, dpGAdo_average_fitness, rs_average_fitness, cGA_average_time, ssGA_average_time, dpGAdw_average_time, dpGAdo_average_time, rs_average_time ] = Compare_Averages( test_function, reruns_number, population_size, chromosome_size, iteration_number, tournament_size, crossover_rate, mutation_rate, selection_type )
%The function to compare Dual-Population scheme with the standard
%steady-state and generational genetic algorithms and random search

%Deciding to print verbosely
Printing_Enabled = false;

%setting up default values for the function parameters
number_of_input_parameters = 9;
if nargin<number_of_input_parameters
    selection_type = 'tournament';
    if nargin < number_of_input_parameters-1
        mutation_rate = 0.01;
        if nargin < number_of_input_parameters-2
            crossover_rate = 0.95;
            if nargin < number_of_input_parameters-3
                tournament_size = 8;
                if nargin < number_of_input_parameters-4
                    iteration_number = 100; %generation_number is (iteration_number*2)/population_size
                    if nargin < number_of_input_parameters-5
                        chromosome_size = 50;
                        if nargin < number_of_input_parameters-6
                            population_size = 50;
                            if nargin < number_of_input_parameters-7
                                reruns_number = 50;
                                if nargin < number_of_input_parameters-8
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

generation_number = (iteration_number*2)/population_size;
random_population_size = 2 * iteration_number + population_size;

%displaying maximum possible fitness
[~, max_fitness] = Fitness_Function([1, 1], 2, test_function);
if Printing_Enabled==true
    fprintf('Fitness function #: %d\nMaximum possible fitness is %d\n', test_function, max_fitness);
end

%running the canonical generational GA
cGA_average_fitness=0;
average_time=0;
for count=1:reruns_number
    [fitness, proc_time] = Generational_GA( test_function, population_size, chromosome_size, generation_number, tournament_size, crossover_rate, mutation_rate, selection_type );
    cGA_average_fitness = cGA_average_fitness + fitness;
   average_time = average_time + proc_time;
end
cGA_average_fitness = cGA_average_fitness / reruns_number;
average_time = average_time / reruns_number;
cGA_average_time = average_time;
if Printing_Enabled==true
    fprintf('Canonical GA''s average fitness is %d over %d runs. Average processing time is %d.\n', cGA_average_fitness, reruns_number, average_time);
end

%running the standard steady-state GA
ssGA_average_fitness=0;
average_time=0;
for count=1:reruns_number
    [fitness, proc_time] = Steady_State_GA( test_function, population_size, chromosome_size, iteration_number, tournament_size, crossover_rate, mutation_rate, selection_type );
    ssGA_average_fitness = ssGA_average_fitness + fitness;
    average_time = average_time + proc_time;
end
ssGA_average_fitness = ssGA_average_fitness / reruns_number;
average_time = average_time / reruns_number;
ssGA_average_time = average_time;
if Printing_Enabled==true
    fprintf('Steady-state GA''s average fitness is %d over %d runs. Average processing time is %d.\n', ssGA_average_fitness, reruns_number, average_time);
end

%running the dual-population GA with Delete-the-Worst strategy
dpGAdw_average_fitness=0;
average_time=0;
for count=1:reruns_number
    [fitness, proc_time] = Dual_Population_GA_DeleteWorst( test_function, population_size, chromosome_size, iteration_number, tournament_size, crossover_rate, mutation_rate, selection_type );
    dpGAdw_average_fitness = dpGAdw_average_fitness + fitness;
    average_time = average_time + proc_time;
end
dpGAdw_average_fitness = dpGAdw_average_fitness / reruns_number;
average_time = average_time / reruns_number;
dpGAdw_average_time = average_time;
if Printing_Enabled==true
    fprintf('Delete-the-Worst Dual-Population''s average fitness is %d over %d runs. Average processing time is %d.\n', dpGAdw_average_fitness, reruns_number, average_time);
end

%running the dual-population GA with Delete-the-Oldest strategy
dpGAdo_average_fitness=0;
average_time=0;
for count=1:reruns_number
    [fitness, proc_time] = Dual_Population_GA_DeleteOldest( test_function, population_size, chromosome_size, iteration_number, tournament_size, crossover_rate, mutation_rate, selection_type );
    dpGAdo_average_fitness = dpGAdo_average_fitness + fitness;
    average_time = average_time + proc_time;
end
dpGAdo_average_fitness = dpGAdo_average_fitness / reruns_number;
average_time = average_time / reruns_number;
dpGAdo_average_time = average_time;
if Printing_Enabled==true
    fprintf('Delete-the-Oldest Dual-Population''s average fitness is %d over %d runs. Average processing time is %d.\n', dpGAdo_average_fitness, reruns_number, average_time);
end

%running the random search
rs_average_fitness=0;
average_time=0;
for count=1:reruns_number
    [fitness, proc_time] = Random_Search( test_function, random_population_size, chromosome_size );
    rs_average_fitness = rs_average_fitness + fitness;
   average_time = average_time + proc_time;
end
rs_average_fitness = rs_average_fitness / reruns_number;
average_time = average_time / reruns_number;
rs_average_time = average_time;
if Printing_Enabled==true
    fprintf('Random Search''s average fitness is %d over %d runs. Average processing time is %d.\n', rs_average_fitness, reruns_number, average_time);
    disp('*******');
end

end

