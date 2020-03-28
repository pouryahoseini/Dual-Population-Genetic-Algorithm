function [ average_fitness, average_time, average_evaluations, std_fitness, std_time, std_evaluations ] = average_Dual_Population_GA_DeleteOldest( reruns_number, test_function, population_size, chromosome_size, iteration_number, tournament_size, crossover_rate, mutation_rate, selection_type, crossover_type, termination_condition, max_evaluations )
%The function to take average of the steady-state genetic algorithm with the
%delete-the-oldest dual-population scheme enabled

%Deciding to print verbosely
Printing_Enabled = false;

%displaying maximum possible fitness
[~, max_fitness] = Fitness_Function([1, 1], 2, test_function);
if Printing_Enabled==true
    fprintf('Fitness function #: %d\nMaximum possible fitness is %d\n', test_function, max_fitness);
end

%running Delete-the-Oldest Dual-Population GA
fitness = zeros(1, reruns_number);
proc_time = zeros(1, reruns_number);
eval_number = zeros(1, reruns_number);
average_fitness=0;
average_time=0;
average_evaluations = 0;
for count=1:reruns_number
    [fitness(count), proc_time(count), eval_number(count)] = Dual_Population_GA_DeleteOldest( test_function, population_size, chromosome_size, iteration_number, tournament_size, crossover_rate, mutation_rate, selection_type, crossover_type, termination_condition, max_evaluations );
    average_fitness = average_fitness + fitness(count);
    average_time = average_time + proc_time(count);
    average_evaluations = average_evaluations + eval_number(count);
end
average_fitness = average_fitness / reruns_number;
average_time = average_time / reruns_number;
average_evaluations = average_evaluations / reruns_number;

std_fitness = sum((fitness - average_fitness).^2)/reruns_number;
std_time = sum((proc_time - average_time).^2)/reruns_number;
std_evaluations = sum((eval_number - average_evaluations).^2)/reruns_number;

if Printing_Enabled==true
    fprintf('Delete-the-Oldest Dual-Population GA''s average fitness is %d over %d runs. Average processing time is %d. Average number of evaluations is %d\n', average_fitness, reruns_number, average_time, average_evaluations);
end

end