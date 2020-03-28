function [ fitness, time, eval ] = Test_All( )
%Tests all the search functions developed

clc;

%set default variables
reruns_number = 10;   %%% reruns_number = 100;
number_of_test_functions = 6;   %% number_of_test_functions = 19;
starting_test_function = 14;   %% starting_test_function = 1;
default_population_size = 100;
default_chromosome_size = 30;
max_evaluations = 3000;
crossover_type = 'Uniform';
selection_type = 'roulette';
crossover_rate = 0.8;
default_convergence_termination = 'No-Improvement';
%Dual-Population
dpGA_mutation_rate = 0.25;
%Steady-State
ssGA_mutation_rate = 0.25;
%Generational
gGA_mutation_rate = 0.02;
%OIMGA
search_size = 16;
t_gens = 6;
k_gens = 5;
d_adjustor = 4;
OIMGA_mutation_rate = 0.382;

%Test 1: testing different population sizes (convergence termination condition)
disp('Starting Test 1');
population_size = [ 50, 100, 200, 500];
time_1=zeros(19, length(population_size), 7);
eval_1=zeros(19, length(population_size), 7);
fitness_1=zeros(19, length(population_size), 7);
std_time_1=zeros(19, length(population_size), 7);
std_eval_1=zeros(19, length(population_size), 7);
std_fitness_1=zeros(19, length(population_size), 7);
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    fprintf('-%d ', test_function);
    for population_size_counter = 1:length(population_size)
        [ fitness_1(test_function, population_size_counter, 1), time_1(test_function, population_size_counter, 1), eval_1(test_function, population_size_counter, 1), std_fitness_1(test_function, population_size_counter, 1), std_time_1(test_function, population_size_counter, 1), std_eval_1(test_function, population_size_counter, 1) ] = average_Generational_GA( reruns_number, test_function, population_size(population_size_counter), default_chromosome_size, 000, 000, crossover_rate, gGA_mutation_rate, selection_type, crossover_type, default_convergence_termination, 000 );
        [ fitness_1(test_function, population_size_counter, 2), time_1(test_function, population_size_counter, 2), eval_1(test_function, population_size_counter, 2), std_fitness_1(test_function, population_size_counter, 2), std_time_1(test_function, population_size_counter, 2), std_eval_1(test_function, population_size_counter, 2) ] = average_Steady_State_GA( reruns_number, test_function, population_size(population_size_counter), default_chromosome_size, 000, 000, crossover_rate, ssGA_mutation_rate, selection_type, crossover_type, default_convergence_termination, 000 );
        [ fitness_1(test_function, population_size_counter, 3), time_1(test_function, population_size_counter, 3), eval_1(test_function, population_size_counter, 3), std_fitness_1(test_function, population_size_counter, 3), std_time_1(test_function, population_size_counter, 3), std_eval_1(test_function, population_size_counter, 3) ] = average_Dual_Population_GA_DeleteWorst( reruns_number, test_function, population_size(population_size_counter), default_chromosome_size, 000, 000, crossover_rate, dpGA_mutation_rate, selection_type, crossover_type, default_convergence_termination, 000 );
        [ fitness_1(test_function, population_size_counter, 4), time_1(test_function, population_size_counter, 4), eval_1(test_function, population_size_counter, 4), std_fitness_1(test_function, population_size_counter, 4), std_time_1(test_function, population_size_counter, 4), std_eval_1(test_function, population_size_counter, 4) ] = average_Compact_GA( reruns_number, test_function, population_size(population_size_counter), default_chromosome_size, default_convergence_termination, 000 );
        [ fitness_1(test_function, population_size_counter, 5), time_1(test_function, population_size_counter, 5), eval_1(test_function, population_size_counter, 5), std_fitness_1(test_function, population_size_counter, 5), std_time_1(test_function, population_size_counter, 5), std_eval_1(test_function, population_size_counter, 5) ] = average_Hsclone_GA( reruns_number, test_function, population_size(population_size_counter), default_chromosome_size, 000, crossover_type, default_convergence_termination, 000 );
        [ fitness_1(test_function, population_size_counter, 6), time_1(test_function, population_size_counter, 6), eval_1(test_function, population_size_counter, 6), std_fitness_1(test_function, population_size_counter, 6), std_time_1(test_function, population_size_counter, 6), std_eval_1(test_function, population_size_counter, 6) ] = average_OIMGA( reruns_number, test_function, population_size(population_size_counter), default_chromosome_size, search_size, t_gens, k_gens, d_adjustor, OIMGA_mutation_rate, default_convergence_termination, 000 );
    end
end
fprintf('\n');
assignin('base', 'fitness_1', fitness_1);
assignin('base', 'time_1', time_1);
assignin('base', 'eval_1', eval_1);

%Test 2: testing different population sizes (max-evaluations termination condition)
disp('Starting Test 2');
population_size = [ 50, 100, 200, 500];
time_2=zeros(19, length(population_size), 7);
eval_2=zeros(19, length(population_size), 7);
fitness_2=zeros(19, length(population_size), 7);
std_time_2=zeros(19, length(population_size), 7);
std_eval_2=zeros(19, length(population_size), 7);
std_fitness_2=zeros(19, length(population_size), 7);
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    fprintf('-%d ', test_function);
    for population_size_counter = 1:length(population_size)
        [ fitness_2(test_function, population_size_counter, 1), time_2(test_function, population_size_counter, 1), eval_2(test_function, population_size_counter, 1), std_fitness_2(test_function, population_size_counter, 1), std_time_2(test_function, population_size_counter, 1), std_eval_2(test_function, population_size_counter, 1) ] = average_Generational_GA( reruns_number, test_function, population_size(population_size_counter), default_chromosome_size, 000, 000, crossover_rate, gGA_mutation_rate, selection_type, crossover_type, 'Max-Evaluations', max_evaluations );
        [ fitness_2(test_function, population_size_counter, 2), time_2(test_function, population_size_counter, 2), eval_2(test_function, population_size_counter, 2), std_fitness_2(test_function, population_size_counter, 2), std_time_2(test_function, population_size_counter, 2), std_eval_2(test_function, population_size_counter, 2) ] = average_Steady_State_GA( reruns_number, test_function, population_size(population_size_counter), default_chromosome_size, 000, 000, crossover_rate, ssGA_mutation_rate, selection_type, crossover_type, 'Max-Evaluations', max_evaluations );
        [ fitness_2(test_function, population_size_counter, 3), time_2(test_function, population_size_counter, 3), eval_2(test_function, population_size_counter, 3), std_fitness_2(test_function, population_size_counter, 3), std_time_2(test_function, population_size_counter, 3), std_eval_2(test_function, population_size_counter, 3) ] = average_Dual_Population_GA_DeleteWorst( reruns_number, test_function, population_size(population_size_counter), default_chromosome_size, 000, 000, crossover_rate, dpGA_mutation_rate, selection_type, crossover_type, 'Max-Evaluations', max_evaluations );
        [ fitness_2(test_function, population_size_counter, 4), time_2(test_function, population_size_counter, 4), eval_2(test_function, population_size_counter, 4), std_fitness_2(test_function, population_size_counter, 4), std_time_2(test_function, population_size_counter, 4), std_eval_2(test_function, population_size_counter, 4) ] = average_Compact_GA( reruns_number, test_function, population_size(population_size_counter), default_chromosome_size, 'Max-Evaluations', max_evaluations );
        [ fitness_2(test_function, population_size_counter, 5), time_2(test_function, population_size_counter, 5), eval_2(test_function, population_size_counter, 5), std_fitness_2(test_function, population_size_counter, 5), std_time_2(test_function, population_size_counter, 5), std_eval_2(test_function, population_size_counter, 5) ] = average_Hsclone_GA( reruns_number, test_function, population_size(population_size_counter), default_chromosome_size, 000, crossover_type, 'Max-Evaluations', max_evaluations );
        [ fitness_2(test_function, population_size_counter, 6), time_2(test_function, population_size_counter, 6), eval_2(test_function, population_size_counter, 6), std_fitness_2(test_function, population_size_counter, 6), std_time_2(test_function, population_size_counter, 6), std_eval_2(test_function, population_size_counter, 6) ] = average_OIMGA( reruns_number, test_function, population_size(population_size_counter), default_chromosome_size, search_size, t_gens, k_gens, d_adjustor, OIMGA_mutation_rate, 'Max-Evaluations', max_evaluations );
    end
end
fprintf('\n');
assignin('base', 'fitness_2', fitness_2);
assignin('base', 'time_2', time_2);
assignin('base', 'eval_2', eval_2);

%Test 3: testing different chromosome sizes (convergence termination condition)
disp('Starting Test 3');
chromosome_size = [ 10, 30, 50, 100];
time_3=zeros(19, length(chromosome_size), 7);
eval_3=zeros(19, length(chromosome_size), 7);
fitness_3=zeros(19, length(chromosome_size), 7);
std_time_3=zeros(19, length(chromosome_size), 7);
std_eval_3=zeros(19, length(chromosome_size), 7);
std_fitness_3=zeros(19, length(chromosome_size), 7);
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    fprintf('-%d ', test_function);
    for chromosome_size_counter = 1:length(chromosome_size)
        [ fitness_3(test_function, chromosome_size_counter, 1), time_3(test_function, chromosome_size_counter, 1), eval_3(test_function, chromosome_size_counter, 1), std_fitness_3(test_function, chromosome_size_counter, 1), std_time_3(test_function, chromosome_size_counter, 1), std_eval_3(test_function, chromosome_size_counter, 1) ] = average_Generational_GA( reruns_number, test_function, default_population_size, chromosome_size(chromosome_size_counter), 000, 000, crossover_rate, gGA_mutation_rate, selection_type, crossover_type, default_convergence_termination, 000 );
        [ fitness_3(test_function, chromosome_size_counter, 2), time_3(test_function, chromosome_size_counter, 2), eval_3(test_function, chromosome_size_counter, 2), std_fitness_3(test_function, chromosome_size_counter, 2), std_time_3(test_function, chromosome_size_counter, 2), std_eval_3(test_function, chromosome_size_counter, 2) ] = average_Steady_State_GA( reruns_number, test_function, default_population_size, chromosome_size(chromosome_size_counter), 000, 000, crossover_rate, ssGA_mutation_rate, selection_type, crossover_type, default_convergence_termination, 000 );
        [ fitness_3(test_function, chromosome_size_counter, 3), time_3(test_function, chromosome_size_counter, 3), eval_3(test_function, chromosome_size_counter, 3), std_fitness_3(test_function, chromosome_size_counter, 3), std_time_3(test_function, chromosome_size_counter, 3), std_eval_3(test_function, chromosome_size_counter, 3) ] = average_Dual_Population_GA_DeleteWorst( reruns_number, test_function, default_population_size, chromosome_size(chromosome_size_counter), 000, 000, crossover_rate, dpGA_mutation_rate, selection_type, crossover_type, default_convergence_termination, 000 );
        [ fitness_3(test_function, chromosome_size_counter, 4), time_3(test_function, chromosome_size_counter, 4), eval_3(test_function, chromosome_size_counter, 4), std_fitness_3(test_function, chromosome_size_counter, 4), std_time_3(test_function, chromosome_size_counter, 4), std_eval_3(test_function, chromosome_size_counter, 4) ] = average_Compact_GA( reruns_number, test_function, default_population_size, chromosome_size(chromosome_size_counter), default_convergence_termination, 000 );
        [ fitness_3(test_function, chromosome_size_counter, 5), time_3(test_function, chromosome_size_counter, 5), eval_3(test_function, chromosome_size_counter, 5), std_fitness_3(test_function, chromosome_size_counter, 5), std_time_3(test_function, chromosome_size_counter, 5), std_eval_3(test_function, chromosome_size_counter, 5) ] = average_Hsclone_GA( reruns_number, test_function, default_population_size, chromosome_size(chromosome_size_counter), 000, crossover_type, default_convergence_termination, 000 );
        [ fitness_3(test_function, chromosome_size_counter, 6), time_3(test_function, chromosome_size_counter, 6), eval_3(test_function, chromosome_size_counter, 6), std_fitness_3(test_function, chromosome_size_counter, 6), std_time_3(test_function, chromosome_size_counter, 6), std_eval_3(test_function, chromosome_size_counter, 6) ] = average_OIMGA( reruns_number, test_function, default_population_size, chromosome_size(chromosome_size_counter), search_size, t_gens, k_gens, d_adjustor, OIMGA_mutation_rate, default_convergence_termination, 000 );
    end
end
fprintf('\n');
assignin('base', 'fitness_3', fitness_3);
assignin('base', 'time_3', time_3);
assignin('base', 'eval_3', eval_3);

%Test 4: testing different chromosome sizes (max-evaluations termination condition)
disp('Starting Test 4');
chromosome_size = [ 10, 30, 50, 100];
time_4=zeros(19, length(chromosome_size), 7);
eval_4=zeros(19, length(chromosome_size), 7);
fitness_4=zeros(19, length(chromosome_size), 7);
std_time_4=zeros(19, length(chromosome_size), 7);
std_eval_4=zeros(19, length(chromosome_size), 7);
std_fitness_4=zeros(19, length(chromosome_size), 7);
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    fprintf('-%d ', test_function);
    for chromosome_size_counter = 1:length(chromosome_size)
        [ fitness_4(test_function, chromosome_size_counter, 1), time_4(test_function, chromosome_size_counter, 1), eval_4(test_function, chromosome_size_counter, 1), std_fitness_4(test_function, chromosome_size_counter, 1), std_time_4(test_function, chromosome_size_counter, 1), std_eval_4(test_function, chromosome_size_counter, 1) ] = average_Generational_GA( reruns_number, test_function, default_population_size, chromosome_size(chromosome_size_counter), 000, 000, crossover_rate, gGA_mutation_rate, selection_type, crossover_type, 'Max-Evaluations', max_evaluations );
        [ fitness_4(test_function, chromosome_size_counter, 2), time_4(test_function, chromosome_size_counter, 2), eval_4(test_function, chromosome_size_counter, 2), std_fitness_4(test_function, chromosome_size_counter, 2), std_time_4(test_function, chromosome_size_counter, 2), std_eval_4(test_function, chromosome_size_counter, 2) ] = average_Steady_State_GA( reruns_number, test_function, default_population_size, chromosome_size(chromosome_size_counter), 000, 000, crossover_rate, ssGA_mutation_rate, selection_type, crossover_type, 'Max-Evaluations', max_evaluations );
        [ fitness_4(test_function, chromosome_size_counter, 3), time_4(test_function, chromosome_size_counter, 3), eval_4(test_function, chromosome_size_counter, 3), std_fitness_4(test_function, chromosome_size_counter, 3), std_time_4(test_function, chromosome_size_counter, 3), std_eval_4(test_function, chromosome_size_counter, 3) ] = average_Dual_Population_GA_DeleteWorst( reruns_number, test_function, default_population_size, chromosome_size(chromosome_size_counter), 000, 000, crossover_rate, dpGA_mutation_rate, selection_type, crossover_type, 'Max-Evaluations', max_evaluations );
        [ fitness_4(test_function, chromosome_size_counter, 4), time_4(test_function, chromosome_size_counter, 4), eval_4(test_function, chromosome_size_counter, 4), std_fitness_4(test_function, chromosome_size_counter, 4), std_time_4(test_function, chromosome_size_counter, 4), std_eval_4(test_function, chromosome_size_counter, 4) ] = average_Compact_GA( reruns_number, test_function, default_population_size, chromosome_size(chromosome_size_counter), 'Max-Evaluations', max_evaluations );
        [ fitness_4(test_function, chromosome_size_counter, 5), time_4(test_function, chromosome_size_counter, 5), eval_4(test_function, chromosome_size_counter, 5), std_fitness_4(test_function, chromosome_size_counter, 5), std_time_4(test_function, chromosome_size_counter, 5), std_eval_4(test_function, chromosome_size_counter, 5) ] = average_Hsclone_GA( reruns_number, test_function, default_population_size, chromosome_size(chromosome_size_counter), 000, crossover_type, 'Max-Evaluations', max_evaluations );
        [ fitness_4(test_function, chromosome_size_counter, 6), time_4(test_function, chromosome_size_counter, 6), eval_4(test_function, chromosome_size_counter, 6), std_fitness_4(test_function, chromosome_size_counter, 6), std_time_4(test_function, chromosome_size_counter, 6), std_eval_4(test_function, chromosome_size_counter, 6) ] = average_OIMGA( reruns_number, test_function, default_population_size, chromosome_size(chromosome_size_counter), search_size, t_gens, k_gens, d_adjustor, OIMGA_mutation_rate, 'Max-Evaluations', max_evaluations );
        [ fitness_4(test_function, chromosome_size_counter, 7), time_4(test_function, chromosome_size_counter, 7), eval_4(test_function, chromosome_size_counter, 7), std_fitness_4(test_function, chromosome_size_counter, 7), std_time_4(test_function, chromosome_size_counter, 7), std_eval_4(test_function, chromosome_size_counter, 7) ] = average_Random_Search( reruns_number, test_function, max_evaluations, chromosome_size(chromosome_size_counter)  );
    end
end
fprintf('\n');
assignin('base', 'fitness_4', fitness_4);
assignin('base', 'time_4', time_4);
assignin('base', 'eval_4', eval_4);

%Test 5: testing different fix number of evaluations (i.e. max-evaluations termination condition)
disp('Starting Test 5');
evaluation_number = [ 1000, 3000, 6000, 10000 ];
time_5=zeros(19, length(evaluation_number), 7);
eval_5=zeros(19, length(evaluation_number), 7);
fitness_5=zeros(19, length(evaluation_number), 7);
std_time_5=zeros(19, length(evaluation_number), 7);
std_eval_5=zeros(19, length(evaluation_number), 7);
std_fitness_5=zeros(19, length(evaluation_number), 7);
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    fprintf('-%d ', test_function);
    for evaluation_number_counter = 1:length(evaluation_number)
        [ fitness_5(test_function, evaluation_number_counter, 1), time_5(test_function, evaluation_number_counter, 1), eval_5(test_function, evaluation_number_counter, 1), std_fitness_5(test_function, evaluation_number_counter, 1), std_time_5(test_function, evaluation_number_counter, 1), std_eval_5(test_function, evaluation_number_counter, 1) ] = average_Generational_GA( reruns_number, test_function, default_population_size, default_chromosome_size, 000, 000, crossover_rate, gGA_mutation_rate, selection_type, crossover_type, 'Max-Evaluations', evaluation_number(evaluation_number_counter) );
        [ fitness_5(test_function, evaluation_number_counter, 2), time_5(test_function, evaluation_number_counter, 2), eval_5(test_function, evaluation_number_counter, 2), std_fitness_5(test_function, evaluation_number_counter, 2), std_time_5(test_function, evaluation_number_counter, 2), std_eval_5(test_function, evaluation_number_counter, 2) ] = average_Steady_State_GA( reruns_number, test_function, default_population_size, default_chromosome_size, 000, 000, crossover_rate, ssGA_mutation_rate, selection_type, crossover_type, 'Max-Evaluations', evaluation_number(evaluation_number_counter) );
        [ fitness_5(test_function, evaluation_number_counter, 3), time_5(test_function, evaluation_number_counter, 3), eval_5(test_function, evaluation_number_counter, 3), std_fitness_5(test_function, evaluation_number_counter, 3), std_time_5(test_function, evaluation_number_counter, 3), std_eval_5(test_function, evaluation_number_counter, 3) ] = average_Dual_Population_GA_DeleteWorst( reruns_number, test_function, default_population_size, default_chromosome_size, 000, 000, crossover_rate, dpGA_mutation_rate, selection_type, crossover_type, 'Max-Evaluations', evaluation_number(evaluation_number_counter) );
        [ fitness_5(test_function, evaluation_number_counter, 4), time_5(test_function, evaluation_number_counter, 4), eval_5(test_function, evaluation_number_counter, 4), std_fitness_5(test_function, evaluation_number_counter, 4), std_time_5(test_function, evaluation_number_counter, 4), std_eval_5(test_function, evaluation_number_counter, 4) ] = average_Compact_GA( reruns_number, test_function, default_population_size, default_chromosome_size, 'Max-Evaluations', evaluation_number(evaluation_number_counter) );
        [ fitness_5(test_function, evaluation_number_counter, 5), time_5(test_function, evaluation_number_counter, 5), eval_5(test_function, evaluation_number_counter, 5), std_fitness_5(test_function, evaluation_number_counter, 5), std_time_5(test_function, evaluation_number_counter, 5), std_eval_5(test_function, evaluation_number_counter, 5) ] = average_Hsclone_GA( reruns_number, test_function, default_population_size, default_chromosome_size, 000, crossover_type, 'Max-Evaluations', evaluation_number(evaluation_number_counter) );
        [ fitness_5(test_function, evaluation_number_counter, 6), time_5(test_function, evaluation_number_counter, 6), eval_5(test_function, evaluation_number_counter, 6), std_fitness_5(test_function, evaluation_number_counter, 6), std_time_5(test_function, evaluation_number_counter, 6), std_eval_5(test_function, evaluation_number_counter, 6) ] = average_OIMGA( reruns_number, test_function, default_population_size, default_chromosome_size, search_size, t_gens, k_gens, d_adjustor, OIMGA_mutation_rate, 'Max-Evaluations', evaluation_number(evaluation_number_counter) );
        [ fitness_5(test_function, evaluation_number_counter, 7), time_5(test_function, evaluation_number_counter, 7), eval_5(test_function, evaluation_number_counter, 7), std_fitness_5(test_function, evaluation_number_counter, 7), std_time_5(test_function, evaluation_number_counter, 7), std_eval_5(test_function, evaluation_number_counter, 7) ] = average_Random_Search( reruns_number, test_function, evaluation_number(evaluation_number_counter), default_chromosome_size  );
    end
end
fprintf('\n');
assignin('base', 'fitness_5', fitness_5);
assignin('base', 'time_5', time_5);
assignin('base', 'eval_5', eval_5);

%Test 6: testing different crossover rates (for the default (convergence termination) condition)
disp('Starting Test 6');
crossover_rate_inventory = [ 0.5, 0.6, 0.7, 0.8, 0.9 ];
time_6=zeros(19, length(crossover_rate_inventory), 7);
eval_6=zeros(19, length(crossover_rate_inventory), 7);
fitness_6=zeros(19, length(crossover_rate_inventory), 7);
std_time_6=zeros(19, length(crossover_rate_inventory), 7);
std_eval_6=zeros(19, length(crossover_rate_inventory), 7);
std_fitness_6=zeros(19, length(crossover_rate_inventory), 7);
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    fprintf('-%d ', test_function);
    for crossover_rate_counter = 1:length(crossover_rate_inventory)
        [ fitness_6(test_function, crossover_rate_counter, 1), time_6(test_function, crossover_rate_counter, 1), eval_6(test_function, crossover_rate_counter, 1), std_fitness_6(test_function, crossover_rate_counter, 1), std_time_6(test_function, crossover_rate_counter, 1), std_eval_6(test_function, crossover_rate_counter, 1) ] = average_Generational_GA( reruns_number, test_function, default_population_size, default_chromosome_size, 000, 000, crossover_rate_inventory(crossover_rate_counter), gGA_mutation_rate, selection_type, crossover_type, default_convergence_termination, 000 );
        [ fitness_6(test_function, crossover_rate_counter, 2), time_6(test_function, crossover_rate_counter, 2), eval_6(test_function, crossover_rate_counter, 2), std_fitness_6(test_function, crossover_rate_counter, 2), std_time_6(test_function, crossover_rate_counter, 2), std_eval_6(test_function, crossover_rate_counter, 2) ] = average_Steady_State_GA( reruns_number, test_function, default_population_size, default_chromosome_size, 000, 000, crossover_rate_inventory(crossover_rate_counter), ssGA_mutation_rate, selection_type, crossover_type, default_convergence_termination, 000 );
        [ fitness_6(test_function, crossover_rate_counter, 3), time_6(test_function, crossover_rate_counter, 3), eval_6(test_function, crossover_rate_counter, 3), std_fitness_6(test_function, crossover_rate_counter, 3), std_time_6(test_function, crossover_rate_counter, 3), std_eval_6(test_function, crossover_rate_counter, 3) ] = average_Dual_Population_GA_DeleteWorst( reruns_number, test_function, default_population_size, default_chromosome_size, 000, 000, crossover_rate_inventory(crossover_rate_counter), dpGA_mutation_rate, selection_type, crossover_type, default_convergence_termination, 000 );
    end
end
fprintf('\n');
assignin('base', 'fitness_6', fitness_6);
assignin('base', 'time_6', time_6);
assignin('base', 'eval_6', eval_6);

%Test 7: testing different mutation rates (for the default (convergence termination) condition)
disp('Starting Test 7');
mutation_rate_inventory = [ 0.01, 0.05, 0.1, 0.2, 0.3, 0.5 ];
time_7=zeros(19, length(mutation_rate_inventory), 7);
eval_7=zeros(19, length(mutation_rate_inventory), 7);
fitness_7=zeros(19, length(mutation_rate_inventory), 7);
std_time_7=zeros(19, length(mutation_rate_inventory), 7);
std_eval_7=zeros(19, length(mutation_rate_inventory), 7);
std_fitness_7=zeros(19, length(mutation_rate_inventory), 7);
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    fprintf('-%d ', test_function);
    for mutation_rate_counter = 1:length(mutation_rate_inventory)
        [ fitness_7(test_function, mutation_rate_counter, 1), time_7(test_function, mutation_rate_counter, 1), eval_7(test_function, mutation_rate_counter, 1), std_fitness_7(test_function, mutation_rate_counter, 1), std_time_7(test_function, mutation_rate_counter, 1), std_eval_7(test_function, mutation_rate_counter, 1) ] = average_Generational_GA( reruns_number, test_function, default_population_size, default_chromosome_size, 000, 000, crossover_rate, mutation_rate_inventory(mutation_rate_counter), selection_type, crossover_type, default_convergence_termination, 000 );
        [ fitness_7(test_function, mutation_rate_counter, 2), time_7(test_function, mutation_rate_counter, 2), eval_7(test_function, mutation_rate_counter, 2), std_fitness_7(test_function, mutation_rate_counter, 2), std_time_7(test_function, mutation_rate_counter, 2), std_eval_7(test_function, mutation_rate_counter, 2) ] = average_Steady_State_GA( reruns_number, test_function, default_population_size, default_chromosome_size, 000, 000, crossover_rate, mutation_rate_inventory(mutation_rate_counter), selection_type, crossover_type, default_convergence_termination, 000 );
        [ fitness_7(test_function, mutation_rate_counter, 3), time_7(test_function, mutation_rate_counter, 3), eval_7(test_function, mutation_rate_counter, 3), std_fitness_7(test_function, mutation_rate_counter, 3), std_time_7(test_function, mutation_rate_counter, 3), std_eval_7(test_function, mutation_rate_counter, 3) ] = average_Dual_Population_GA_DeleteWorst( reruns_number, test_function, default_population_size, default_chromosome_size, 000, 000, crossover_rate, mutation_rate_inventory(mutation_rate_counter), selection_type, crossover_type, default_convergence_termination, 000 );
        
        [ fitness_7(test_function, mutation_rate_counter, 6), time_7(test_function, mutation_rate_counter, 6), eval_7(test_function, mutation_rate_counter, 6) ] = average_OIMGA( reruns_number, test_function, default_population_size, default_chromosome_size, search_size, t_gens, k_gens, d_adjustor, mutation_rate_inventory(mutation_rate_counter), default_convergence_termination, 000 );
    end
end
fprintf('\n');
assignin('base', 'fitness_7', fitness_7);
assignin('base', 'time_7', time_7);
assignin('base', 'eval_7', eval_7);

%Test 8: testing different tournament sizes with the tournament selection (for the default (convergence termination) condition)
disp('Starting Test 8');
tournament_sizes = [ 2, 4, 8, 16 ];
time_8=zeros(19, length(tournament_sizes), 7);
eval_8=zeros(19, length(tournament_sizes), 7);
fitness_8=zeros(19, length(tournament_sizes), 7);
std_time_8=zeros(19, length(tournament_sizes), 7);
std_eval_8=zeros(19, length(tournament_sizes), 7);
std_fitness_8=zeros(19, length(tournament_sizes), 7);
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    fprintf('-%d ', test_function);
    for tournament_size_counter = 1:length(tournament_sizes)
        [ fitness_8(test_function, tournament_size_counter, 1), time_8(test_function, tournament_size_counter, 1), eval_8(test_function, tournament_size_counter, 1), std_fitness_8(test_function, tournament_size_counter, 1), std_time_8(test_function, tournament_size_counter, 1), std_eval_8(test_function, tournament_size_counter, 1) ] = average_Generational_GA( reruns_number, test_function, default_population_size, default_chromosome_size, 000, tournament_sizes(tournament_size_counter), crossover_rate, gGA_mutation_rate, 'tournament', crossover_type, default_convergence_termination, 000 );
        [ fitness_8(test_function, tournament_size_counter, 2), time_8(test_function, tournament_size_counter, 2), eval_8(test_function, tournament_size_counter, 2), std_fitness_8(test_function, tournament_size_counter, 2), std_time_8(test_function, tournament_size_counter, 2), std_eval_8(test_function, tournament_size_counter, 2) ] = average_Steady_State_GA( reruns_number, test_function, default_population_size, default_chromosome_size, 000, tournament_sizes(tournament_size_counter), crossover_rate, ssGA_mutation_rate, 'tournament', crossover_type, default_convergence_termination, 000 );
        [ fitness_8(test_function, tournament_size_counter, 3), time_8(test_function, tournament_size_counter, 3), eval_8(test_function, tournament_size_counter, 3), std_fitness_8(test_function, tournament_size_counter, 3), std_time_8(test_function, tournament_size_counter, 3), std_eval_8(test_function, tournament_size_counter, 3) ] = average_Dual_Population_GA_DeleteWorst( reruns_number, test_function, default_population_size, default_chromosome_size, 000, tournament_sizes(tournament_size_counter), crossover_rate, dpGA_mutation_rate, 'tournament', crossover_type, default_convergence_termination, 000 );
    end
end
fprintf('\n');
assignin('base', 'fitness_8', fitness_8);
assignin('base', 'time_8', time_8);
assignin('base', 'eval_8', eval_8);

%finalizing
fitness = { fitness_1, fitness_2, fitness_3, fitness_4, fitness_5, fitness_6, fitness_7, fitness_8, std_fitness_1, std_fitness_2, std_fitness_3, std_fitness_4, std_fitness_5, std_fitness_6, std_fitness_7, std_fitness_8 };
time = { time_1, time_2, time_3, time_4, time_5, time_6, time_7, time_8, std_time_1, std_time_2, std_time_3, std_time_4, std_time_5, std_time_6, std_time_7, std_time_8 };
eval = { eval_1, eval_2, eval_3, eval_4, eval_5, eval_6, eval_7, eval_8, std_eval_1, std_eval_2, std_eval_3, std_eval_4, std_eval_5, std_eval_6, std_eval_7, std_eval_8 };

disp('Finished');
disp('*********************');

end

