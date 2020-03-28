function [ ] = Plot( fitness, time, eval )
%The function to plot the results of the tests

%preparing the environment
set(0,'defaultaxeslinewidth',2);
set(0,'defaultpatchlinewidth',2);
set(0,'defaultlinelinewidth',4);

%extracting the inputs
fitness_1 = fitness{1};
fitness_2 = fitness{2};
fitness_3 = fitness{3};
fitness_4 = fitness{4};
fitness_5 = fitness{5};
fitness_6 = fitness{6};
fitness_7 = fitness{7};
fitness_8 = fitness{8};
time_1 = time{1};
time_2 = time{2};
time_3 = time{3};
time_4 = time{4};
time_5 = time{5};
time_6 = time{6};
time_7 = time{7};
time_8 = time{8};
eval_1 = eval{1};
eval_2 = eval{2};
eval_3 = eval{3};
eval_4 = eval{4};
eval_5 = eval{5};
eval_6 = eval{6};
eval_7 = eval{7};
eval_8 = eval{8};

STD_fitness_1 = fitness{9};
STD_time_1 = time{9};
STD_eval_1 = eval{9};
STD_fitness_2 = fitness{10};
STD_time_2 = time{10};
STD_eval_2 = eval{10};
STD_fitness_3 = fitness{11};
STD_time_3 = time{11};
STD_eval_3 = eval{11};
STD_fitness_4 = fitness{12};
STD_time_4 = time{12};
STD_eval_4 = eval{12};
STD_fitness_5 = fitness{13};
STD_time_5 = time{13};
STD_eval_5 = eval{13};
STD_fitness_6 = fitness{14};
STD_time_6 = time{14};
STD_eval_6 = eval{14};
STD_fitness_7 = fitness{15};
STD_time_7 = time{15};
STD_eval_7 = eval{15};
STD_fitness_8 = fitness{16};
STD_time_8 = time{16};
STD_eval_8 = eval{16};

%set default variables
number_of_test_functions = 13;   %% number_of_test_functions = 19;
starting_test_function = 7;   %% starting_test_function = 1;
test_function_names = { 'Rastrigin function, with n=2 and A=10', 'Ackley''s function', 'Sphere function, with n=2 and -2000 <= xi <= 2000', 'Rosenbrock function, with n=2 and -2000 <= xi <= 2000', 'Beale''s function', 'Goldstein-Price function', 'Booth''s function', 'Bukin function N.6', 'Matyas function', 'Levi function N.13', 'Three-hump camel function', 'Easom function', 'Cross-in-tray function', 'Eggholder function', 'Holder table function', 'McCormick function', 'Schaffer function N. 2', 'Schaffer function N. 4', 'Styblinski-Tang function, with n = 2' };

%Plotting results of Test 1
population_size = [ 50, 100, 200, 500 ];
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    %Fitness plot
    figure;
    plot(population_size, fitness_1(test_function, 1:length(population_size), 1), 'g--s', population_size, fitness_1(test_function, 1:length(population_size), 2), 'b-.o', population_size, fitness_1(test_function, 1:length(population_size), 3), 'k-*', population_size, fitness_1(test_function, 1:length(population_size), 4), 'r:d', population_size, fitness_1(test_function, 1:length(population_size), 5), 'm--.', population_size, fitness_1(test_function, 1:length(population_size), 6), 'c-.*' );
    title({'Fitness over different population sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Population size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Fitness', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'southeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test1_Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Time plot
    figure;
    plot(population_size, time_1(test_function, 1:length(population_size), 1), 'g--s', population_size, time_1(test_function, 1:length(population_size), 2), 'b-.o', population_size, time_1(test_function, 1:length(population_size), 3), 'k-*', population_size, time_1(test_function, 1:length(population_size), 4), 'r:d', population_size, time_1(test_function, 1:length(population_size), 5), 'm--.', population_size, time_1(test_function, 1:length(population_size), 6), 'c-.*' );
    title({'Computation time on software over different population sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Population size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Computation time on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test1_Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Evaluation number plot
    figure;
    plot(population_size, eval_1(test_function, 1:length(population_size), 1), 'g--s', population_size, eval_1(test_function, 1:length(population_size), 2), 'b-.o', population_size, eval_1(test_function, 1:length(population_size), 3), 'k-*', population_size, eval_1(test_function, 1:length(population_size), 4), 'r:d', population_size, eval_1(test_function, 1:length(population_size), 5), 'm--.', population_size, eval_1(test_function, 1:length(population_size), 6), 'c-.*' );
    title({'Number of evaluations over different population sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Population size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Total number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test1_Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
    
    %STD Fitness plot
    figure;
    plot(population_size, STD_fitness_1(test_function, 1:length(population_size), 1), 'g--s', population_size, STD_fitness_1(test_function, 1:length(population_size), 2), 'b-.o', population_size, STD_fitness_1(test_function, 1:length(population_size), 3), 'k-*', population_size, STD_fitness_1(test_function, 1:length(population_size), 4), 'r:d', population_size, STD_fitness_1(test_function, 1:length(population_size), 5), 'm--.', population_size, STD_fitness_1(test_function, 1:length(population_size), 6), 'c-.*' );
    title({'Standard deviation of fitness values over different population sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Population size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of fitness values', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test1_STD-Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Time plot
    figure;
    plot(population_size, STD_time_1(test_function, 1:length(population_size), 1), 'g--s', population_size, STD_time_1(test_function, 1:length(population_size), 2), 'b-.o', population_size, STD_time_1(test_function, 1:length(population_size), 3), 'k-*', population_size, STD_time_1(test_function, 1:length(population_size), 4), 'r:d', population_size, STD_time_1(test_function, 1:length(population_size), 5), 'm--.', population_size, STD_time_1(test_function, 1:length(population_size), 6), 'c-.*' );
    title({'Standard deviation of computation times on software over different population sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Population size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of computation times on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test1_STD-Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Evaluation number plot
    figure;
    plot(population_size, STD_eval_1(test_function, 1:length(population_size), 1), 'g--s', population_size, STD_eval_1(test_function, 1:length(population_size), 2), 'b-.o', population_size, STD_eval_1(test_function, 1:length(population_size), 3), 'k-*', population_size, STD_eval_1(test_function, 1:length(population_size), 4), 'r:d', population_size, STD_eval_1(test_function, 1:length(population_size), 5), 'm--.', population_size, STD_eval_1(test_function, 1:length(population_size), 6), 'c-.*' );
    title({'Standard deviation of number of evaluations over different population sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Population size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test1_STD-Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
end

%Plotting results of Test 2
population_size = [ 50, 100, 200, 500 ];
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    %Fitness plot
    figure;
    plot(population_size, fitness_2(test_function, 1:length(population_size), 1), 'g--s', population_size, fitness_2(test_function, 1:length(population_size), 2), 'b-.o', population_size, fitness_2(test_function, 1:length(population_size), 3), 'k-*', population_size, fitness_2(test_function, 1:length(population_size), 4), 'r:d', population_size, fitness_2(test_function, 1:length(population_size), 5), 'm--.', population_size, fitness_2(test_function, 1:length(population_size), 6), 'c-.*' );
    title({'Fitness over different population sizes'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Population size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Fitness', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'southeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test2_Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Time plot
    figure;
    plot(population_size, time_2(test_function, 1:length(population_size), 1), 'g--s', population_size, time_2(test_function, 1:length(population_size), 2), 'b-.o', population_size, time_2(test_function, 1:length(population_size), 3), 'k-*', population_size, time_2(test_function, 1:length(population_size), 4), 'r:d', population_size, time_2(test_function, 1:length(population_size), 5), 'm--.', population_size, time_2(test_function, 1:length(population_size), 6), 'c-.*' );
    title({'Computation time on software over different population sizes'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Population size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Computation time on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test2_Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Evaluation number plot
    figure;
    plot(population_size, eval_2(test_function, 1:length(population_size), 1), 'g--s', population_size, eval_2(test_function, 1:length(population_size), 2), 'b-.o', population_size, eval_2(test_function, 1:length(population_size), 3), 'k-*', population_size, eval_2(test_function, 1:length(population_size), 4), 'r:d', population_size, eval_2(test_function, 1:length(population_size), 5), 'm--.', population_size, eval_2(test_function, 1:length(population_size), 6), 'c-.*' );
    title({'Number of evaluations over different population sizes'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Population size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Total number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test2_Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
    
    %STD Fitness plot
    figure;
    plot(population_size, STD_fitness_2(test_function, 1:length(population_size), 1), 'g--s', population_size, STD_fitness_2(test_function, 1:length(population_size), 2), 'b-.o', population_size, STD_fitness_2(test_function, 1:length(population_size), 3), 'k-*', population_size, STD_fitness_2(test_function, 1:length(population_size), 4), 'r:d', population_size, STD_fitness_2(test_function, 1:length(population_size), 5), 'm--.', population_size, STD_fitness_2(test_function, 1:length(population_size), 6), 'c-.*' );
    title({'Standard deviation of fitness values over different population sizes'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Population size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of fitness values', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test2_STD-Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Time plot
    figure;
    plot(population_size, STD_time_2(test_function, 1:length(population_size), 1), 'g--s', population_size, STD_time_2(test_function, 1:length(population_size), 2), 'b-.o', population_size, STD_time_2(test_function, 1:length(population_size), 3), 'k-*', population_size, STD_time_2(test_function, 1:length(population_size), 4), 'r:d', population_size, STD_time_2(test_function, 1:length(population_size), 5), 'm--.', population_size, STD_time_2(test_function, 1:length(population_size), 6), 'c-.*' );
    title({'Standard deviation of computation times on software over different population sizes'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Population size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of computation times on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test2_STD-Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Evaluation number plot
    figure;
    plot(population_size, STD_eval_2(test_function, 1:length(population_size), 1), 'g--s', population_size, STD_eval_2(test_function, 1:length(population_size), 2), 'b-.o', population_size, STD_eval_2(test_function, 1:length(population_size), 3), 'k-*', population_size, STD_eval_2(test_function, 1:length(population_size), 4), 'r:d', population_size, STD_eval_2(test_function, 1:length(population_size), 5), 'm--.', population_size, STD_eval_2(test_function, 1:length(population_size), 6), 'c-.*' );
    title({'Standard deviation of number of evaluations over different population sizes'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Population size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test2_STD-Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
end

%Plotting results of Test 3
chromosome_size = [ 10, 30, 50, 100];
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    %Fitness plot
    figure;
    plot(chromosome_size, fitness_3(test_function, 1:length(chromosome_size), 1), 'g--s', chromosome_size, fitness_3(test_function, 1:length(chromosome_size), 2), 'b-.o', chromosome_size, fitness_3(test_function, 1:length(chromosome_size), 3), 'k-*', chromosome_size, fitness_3(test_function, 1:length(chromosome_size), 4), 'r:d', chromosome_size, fitness_3(test_function, 1:length(chromosome_size), 5), 'm--.', chromosome_size, fitness_3(test_function, 1:length(chromosome_size), 6), 'c-.*' );
    title({'Fitness over different chromosome sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Chromosome size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Fitness', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'southeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test3_Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Time plot
    figure;
    plot(chromosome_size, time_3(test_function, 1:length(chromosome_size), 1), 'g--s', chromosome_size, time_3(test_function, 1:length(chromosome_size), 2), 'b-.o', chromosome_size, time_3(test_function, 1:length(chromosome_size), 3), 'k-*', chromosome_size, time_3(test_function, 1:length(chromosome_size), 4), 'r:d', chromosome_size, time_3(test_function, 1:length(chromosome_size), 5), 'm--.', chromosome_size, time_3(test_function, 1:length(chromosome_size), 6), 'c-.*' );
    title({'Computation time on software over different chromosome sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Chromosome size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Computation time on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test3_Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Evaluation number plot
    figure;
    plot(chromosome_size, eval_3(test_function, 1:length(chromosome_size), 1), 'g--s', chromosome_size, eval_3(test_function, 1:length(chromosome_size), 2), 'b-.o', chromosome_size, eval_3(test_function, 1:length(chromosome_size), 3), 'k-*', chromosome_size, eval_3(test_function, 1:length(chromosome_size), 4), 'r:d', chromosome_size, eval_3(test_function, 1:length(chromosome_size), 5), 'm--.', chromosome_size, eval_3(test_function, 1:length(chromosome_size), 6), 'c-.*' );
    title({'Number of evaluations over different chromosome sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Chromosome size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Total number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test3_Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
    
    %STD Fitness plot
    figure;
    plot(chromosome_size, STD_fitness_3(test_function, 1:length(chromosome_size), 1), 'g--s', chromosome_size, STD_fitness_3(test_function, 1:length(chromosome_size), 2), 'b-.o', chromosome_size, STD_fitness_3(test_function, 1:length(chromosome_size), 3), 'k-*', chromosome_size, STD_fitness_3(test_function, 1:length(chromosome_size), 4), 'r:d', chromosome_size, STD_fitness_3(test_function, 1:length(chromosome_size), 5), 'm--.', chromosome_size, STD_fitness_3(test_function, 1:length(chromosome_size), 6), 'c-.*' );
    title({'Standard deviation of fitness values over different chromosome sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Chromosome size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of fitness values', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test3_STD-Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Time plot
    figure;
    plot(chromosome_size, STD_time_3(test_function, 1:length(chromosome_size), 1), 'g--s', chromosome_size, STD_time_3(test_function, 1:length(chromosome_size), 2), 'b-.o', chromosome_size, STD_time_3(test_function, 1:length(chromosome_size), 3), 'k-*', chromosome_size, STD_time_3(test_function, 1:length(chromosome_size), 4), 'r:d', chromosome_size, STD_time_3(test_function, 1:length(chromosome_size), 5), 'm--.', chromosome_size, STD_time_3(test_function, 1:length(chromosome_size), 6), 'c-.*' );
    title({'Standard deviation of computation times on software over different chromosome sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Chromosome size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of computation times on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test3_STD-Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Evaluation number plot
    figure;
    plot(chromosome_size, STD_eval_3(test_function, 1:length(chromosome_size), 1), 'g--s', chromosome_size, STD_eval_3(test_function, 1:length(chromosome_size), 2), 'b-.o', chromosome_size, STD_eval_3(test_function, 1:length(chromosome_size), 3), 'k-*', chromosome_size, STD_eval_3(test_function, 1:length(chromosome_size), 4), 'r:d', chromosome_size, STD_eval_3(test_function, 1:length(chromosome_size), 5), 'm--.', chromosome_size, STD_eval_3(test_function, 1:length(chromosome_size), 6), 'c-.*' );
    title({'Standard deviation of number of evaluations over different chromosome sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Chromosome size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test3_STD-Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
end

%Plotting results of Test 4
chromosome_size = [ 10, 30, 50, 100];
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    %Fitness plot
    figure;
    plot(chromosome_size, fitness_4(test_function, 1:length(chromosome_size), 1), 'g--s', chromosome_size, fitness_4(test_function, 1:length(chromosome_size), 2), 'b-.o', chromosome_size, fitness_4(test_function, 1:length(chromosome_size), 3), 'k-*', chromosome_size, fitness_4(test_function, 1:length(chromosome_size), 4), 'r:d', chromosome_size, fitness_4(test_function, 1:length(chromosome_size), 5), 'm--.', chromosome_size, fitness_4(test_function, 1:length(chromosome_size), 6), 'c-.*', chromosome_size, fitness_4(test_function, 1:length(chromosome_size), 7), 'y:x' );
    title({'Fitness over different chromosome sizes'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Chromosome size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Fitness', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Random Search', 'Location', 'southeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test4_Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Time plot
    figure;
    plot(chromosome_size, time_4(test_function, 1:length(chromosome_size), 1), 'g--s', chromosome_size, time_4(test_function, 1:length(chromosome_size), 2), 'b-.o', chromosome_size, time_4(test_function, 1:length(chromosome_size), 3), 'k-*', chromosome_size, time_4(test_function, 1:length(chromosome_size), 4), 'r:d', chromosome_size, time_4(test_function, 1:length(chromosome_size), 5), 'm--.', chromosome_size, time_4(test_function, 1:length(chromosome_size), 6), 'c-.*', chromosome_size, time_4(test_function, 1:length(chromosome_size), 7), 'y:x' );
    title({'Computation time on software over different chromosome sizes'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Chromosome size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Computation time on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Random Search', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test4_Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Evaluation number plot
    figure;
    plot(chromosome_size, eval_4(test_function, 1:length(chromosome_size), 1), 'g--s', chromosome_size, eval_4(test_function, 1:length(chromosome_size), 2), 'b-.o', chromosome_size, eval_4(test_function, 1:length(chromosome_size), 3), 'k-*', chromosome_size, eval_4(test_function, 1:length(chromosome_size), 4), 'r:d', chromosome_size, eval_4(test_function, 1:length(chromosome_size), 5), 'm--.', chromosome_size, eval_4(test_function, 1:length(chromosome_size), 6), 'c-.*', chromosome_size, eval_4(test_function, 1:length(chromosome_size), 7), 'y:x' );
    title({'Number of evaluations over different chromosome sizes'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Chromosome size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Total number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Random Search', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test4_Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
    
    %STD Fitness plot
    figure;
    plot(chromosome_size, STD_fitness_4(test_function, 1:length(chromosome_size), 1), 'g--s', chromosome_size, STD_fitness_4(test_function, 1:length(chromosome_size), 2), 'b-.o', chromosome_size, STD_fitness_4(test_function, 1:length(chromosome_size), 3), 'k-*', chromosome_size, STD_fitness_4(test_function, 1:length(chromosome_size), 4), 'r:d', chromosome_size, STD_fitness_4(test_function, 1:length(chromosome_size), 5), 'm--.', chromosome_size, STD_fitness_4(test_function, 1:length(chromosome_size), 6), 'c-.*', chromosome_size, STD_fitness_4(test_function, 1:length(chromosome_size), 7), 'y:x' );
    title({'Standard deviation of fitness values over different chromosome sizes'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Chromosome size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of fitness values', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Random Search', 'Location', 'northeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test4_STD-Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Time plot
    figure;
    plot(chromosome_size, STD_time_4(test_function, 1:length(chromosome_size), 1), 'g--s', chromosome_size, STD_time_4(test_function, 1:length(chromosome_size), 2), 'b-.o', chromosome_size, STD_time_4(test_function, 1:length(chromosome_size), 3), 'k-*', chromosome_size, STD_time_4(test_function, 1:length(chromosome_size), 4), 'r:d', chromosome_size, STD_time_4(test_function, 1:length(chromosome_size), 5), 'm--.', chromosome_size, STD_time_4(test_function, 1:length(chromosome_size), 6), 'c-.*', chromosome_size, STD_time_4(test_function, 1:length(chromosome_size), 7), 'y:x' );
    title({'Standard deviation of computation times on software over different chromosome sizes'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Chromosome size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of computation times on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Random Search', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test4_STD-Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Evaluation number plot
    figure;
    plot(chromosome_size, STD_eval_4(test_function, 1:length(chromosome_size), 1), 'g--s', chromosome_size, STD_eval_4(test_function, 1:length(chromosome_size), 2), 'b-.o', chromosome_size, STD_eval_4(test_function, 1:length(chromosome_size), 3), 'k-*', chromosome_size, STD_eval_4(test_function, 1:length(chromosome_size), 4), 'r:d', chromosome_size, STD_eval_4(test_function, 1:length(chromosome_size), 5), 'm--.', chromosome_size, STD_eval_4(test_function, 1:length(chromosome_size), 6), 'c-.*', chromosome_size, STD_eval_4(test_function, 1:length(chromosome_size), 7), 'y:x' );
    title({'Standard deviation of number of evaluations over different chromosome sizes'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Chromosome size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Random Search', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test4_STD-Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
end

%Plotting results of Test 5
evaluation_number = [ 1000, 3000, 6000, 10000 ];
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    %Fitness plot
    figure;
    plot(evaluation_number, fitness_5(test_function, 1:length(evaluation_number), 1), 'g--s', evaluation_number, fitness_5(test_function, 1:length(evaluation_number), 2), 'b-.o', evaluation_number, fitness_5(test_function, 1:length(evaluation_number), 3), 'k-*', evaluation_number, fitness_5(test_function, 1:length(evaluation_number), 4), 'r:d', evaluation_number, fitness_5(test_function, 1:length(evaluation_number), 5), 'm--.', evaluation_number, fitness_5(test_function, 1:length(evaluation_number), 6), 'c-.*', evaluation_number, fitness_5(test_function, 1:length(evaluation_number), 7), 'y:x' );
    title({'Fitness over different evaluation numbers'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Evaluation number', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Fitness', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Random Search', 'Location', 'southeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test5_Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Time plot
    figure;
    plot(evaluation_number, time_5(test_function, 1:length(evaluation_number), 1), 'g--s', evaluation_number, time_5(test_function, 1:length(evaluation_number), 2), 'b-.o', evaluation_number, time_5(test_function, 1:length(evaluation_number), 3), 'k-*', evaluation_number, time_5(test_function, 1:length(evaluation_number), 4), 'r:d', evaluation_number, time_5(test_function, 1:length(evaluation_number), 5), 'm--.', evaluation_number, time_5(test_function, 1:length(evaluation_number), 6), 'c-.*', evaluation_number, time_5(test_function, 1:length(evaluation_number), 7), 'y:x' );
    title({'Computation time on software over different evaluation numbers'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Evaluation number', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Computation time on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Random Search', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test5_Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Evaluation number plot
    figure;
    plot(evaluation_number, eval_5(test_function, 1:length(evaluation_number), 1), 'g--s', evaluation_number, eval_5(test_function, 1:length(evaluation_number), 2), 'b-.o', evaluation_number, eval_5(test_function, 1:length(evaluation_number), 3), 'k-*', evaluation_number, eval_5(test_function, 1:length(evaluation_number), 4), 'r:d', evaluation_number, eval_5(test_function, 1:length(evaluation_number), 5), 'm--.', evaluation_number, eval_5(test_function, 1:length(evaluation_number), 6), 'c-.*', evaluation_number, eval_5(test_function, 1:length(evaluation_number), 7), 'y:x' );
    title({'Number of evaluations over different evaluation numbers'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Evaluation number', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Total number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Random Search', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test5_Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
    
    %STD Fitness plot
    figure;
    plot(evaluation_number, STD_fitness_5(test_function, 1:length(evaluation_number), 1), 'g--s', evaluation_number, STD_fitness_5(test_function, 1:length(evaluation_number), 2), 'b-.o', evaluation_number, STD_fitness_5(test_function, 1:length(evaluation_number), 3), 'k-*', evaluation_number, STD_fitness_5(test_function, 1:length(evaluation_number), 4), 'r:d', evaluation_number, STD_fitness_5(test_function, 1:length(evaluation_number), 5), 'm--.', evaluation_number, STD_fitness_5(test_function, 1:length(evaluation_number), 6), 'c-.*', evaluation_number, STD_fitness_5(test_function, 1:length(evaluation_number), 7), 'y:x' );
    title({'Standard deviation of fitness values over different evaluation numbers'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Evaluation number', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of fitness values', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Random Search', 'Location', 'northeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test5_STD-Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Time plot
    figure;
    plot(evaluation_number, STD_time_5(test_function, 1:length(evaluation_number), 1), 'g--s', evaluation_number, STD_time_5(test_function, 1:length(evaluation_number), 2), 'b-.o', evaluation_number, STD_time_5(test_function, 1:length(evaluation_number), 3), 'k-*', evaluation_number, STD_time_5(test_function, 1:length(evaluation_number), 4), 'r:d', evaluation_number, STD_time_5(test_function, 1:length(evaluation_number), 5), 'm--.', evaluation_number, STD_time_5(test_function, 1:length(evaluation_number), 6), 'c-.*', evaluation_number, STD_time_5(test_function, 1:length(evaluation_number), 7), 'y:x' );
    title({'Standard deviation of computation times on software over different evaluation numbers'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Evaluation number', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of computation times on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Random Search', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test5_STD-Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Evaluation number plot
    figure;
    plot(evaluation_number, STD_eval_5(test_function, 1:length(evaluation_number), 1), 'g--s', evaluation_number, STD_eval_5(test_function, 1:length(evaluation_number), 2), 'b-.o', evaluation_number, STD_eval_5(test_function, 1:length(evaluation_number), 3), 'k-*', evaluation_number, STD_eval_5(test_function, 1:length(evaluation_number), 4), 'r:d', evaluation_number, STD_eval_5(test_function, 1:length(evaluation_number), 5), 'm--.', evaluation_number, STD_eval_5(test_function, 1:length(evaluation_number), 6), 'c-.*', evaluation_number, STD_eval_5(test_function, 1:length(evaluation_number), 7), 'y:x' );
    title({'Standard deviation of number of evaluations over different evaluation numbers'; 'Termination condition: Fixed number of evaluations'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Evaluation number', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Compact GA', 'HSClone GA', 'OIMGA', 'Random Search', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test5_STD-Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
end

%Plotting results of Test 6
crossover_rate_inventory = [ 0.5, 0.6, 0.7, 0.8, 0.9 ];
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    %Fitness plot
    figure;
    plot(crossover_rate_inventory, fitness_6(test_function, 1:length(crossover_rate_inventory), 1), 'g--s', crossover_rate_inventory, fitness_6(test_function, 1:length(crossover_rate_inventory), 2), 'b-.o', crossover_rate_inventory, fitness_6(test_function, 1:length(crossover_rate_inventory), 3), 'k-*' );
    title({'Fitness over different crossover rates'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Crossover rate', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Fitness', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Location', 'southeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test6_Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Time plot
    figure;
    plot(crossover_rate_inventory, time_6(test_function, 1:length(crossover_rate_inventory), 1), 'g--s', crossover_rate_inventory, time_6(test_function, 1:length(crossover_rate_inventory), 2), 'b-.o', crossover_rate_inventory, time_6(test_function, 1:length(crossover_rate_inventory), 3), 'k-*' );
    title({'Computation time on software over different crossover rates'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Crossover rate', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Computation time on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test6_Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Evaluation number plot
    figure;
    plot(crossover_rate_inventory, eval_6(test_function, 1:length(crossover_rate_inventory), 1), 'g--s', crossover_rate_inventory, eval_6(test_function, 1:length(crossover_rate_inventory), 2), 'b-.o', crossover_rate_inventory, eval_6(test_function, 1:length(crossover_rate_inventory), 3), 'k-*' );
    title({'Number of evaluations over different crossover rates'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Crossover rate', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Total number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test6_Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
    
    %STD Fitness plot
    figure;
    plot(crossover_rate_inventory, STD_fitness_6(test_function, 1:length(crossover_rate_inventory), 1), 'g--s', crossover_rate_inventory, STD_fitness_6(test_function, 1:length(crossover_rate_inventory), 2), 'b-.o', crossover_rate_inventory, STD_fitness_6(test_function, 1:length(crossover_rate_inventory), 3), 'k-*' );
    title({'Standard deviation of fitness values over different crossover rates'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Crossover rate', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of fitness values', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Location', 'northeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test6_STD-Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Time plot
    figure;
    plot(crossover_rate_inventory, STD_time_6(test_function, 1:length(crossover_rate_inventory), 1), 'g--s', crossover_rate_inventory, STD_time_6(test_function, 1:length(crossover_rate_inventory), 2), 'b-.o', crossover_rate_inventory, STD_time_6(test_function, 1:length(crossover_rate_inventory), 3), 'k-*' );
    title({'Standard deviation of computation times on software over different crossover rates'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Crossover rate', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of computation times on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test6_STD-Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Evaluation number plot
    figure;
    plot(crossover_rate_inventory, STD_eval_6(test_function, 1:length(crossover_rate_inventory), 1), 'g--s', crossover_rate_inventory, STD_eval_6(test_function, 1:length(crossover_rate_inventory), 2), 'b-.o', crossover_rate_inventory, STD_eval_6(test_function, 1:length(crossover_rate_inventory), 3), 'k-*' );
    title({'Standard deviation of number of evaluations over different crossover rates'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Crossover rate', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test6_STD-Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
end

%Plotting results of Test 7
mutation_rate_inventory = [ 0.01, 0.05, 0.1, 0.2, 0.3, 0.5 ];
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    %Fitness plot
    figure;
    plot(mutation_rate_inventory, fitness_7(test_function, 1:length(mutation_rate_inventory), 1), 'g--s', mutation_rate_inventory, fitness_7(test_function, 1:length(mutation_rate_inventory), 2), 'b-.o', mutation_rate_inventory, fitness_7(test_function, 1:length(mutation_rate_inventory), 3), 'k-*', mutation_rate_inventory, fitness_7(test_function, 1:length(mutation_rate_inventory), 6), 'c-.*' );
    title({'Fitness over different mutation rates'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Mutation rate', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Fitness', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'OIMGA', 'Location', 'southeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test7_Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Time plot
    figure;
    plot(mutation_rate_inventory, time_7(test_function, 1:length(mutation_rate_inventory), 1), 'g--s', mutation_rate_inventory, time_7(test_function, 1:length(mutation_rate_inventory), 2), 'b-.o', mutation_rate_inventory, time_7(test_function, 1:length(mutation_rate_inventory), 3), 'k-*', mutation_rate_inventory, time_7(test_function, 1:length(mutation_rate_inventory), 6), 'c-.*' );
    title({'Computation time on software over different mutation rates'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Mutation rate', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Computation time on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test7_Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Evaluation number plot
    figure;
    plot(mutation_rate_inventory, eval_7(test_function, 1:length(mutation_rate_inventory), 1), 'g--s', mutation_rate_inventory, eval_7(test_function, 1:length(mutation_rate_inventory), 2), 'b-.o', mutation_rate_inventory, eval_7(test_function, 1:length(mutation_rate_inventory), 3), 'k-*', mutation_rate_inventory, eval_7(test_function, 1:length(mutation_rate_inventory), 6), 'c-.*' );
    title({'Number of evaluations over different mutation rates'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Mutation rate', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Total number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test7_Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
    
    %STD Fitness plot
    figure;
    plot(mutation_rate_inventory, STD_fitness_7(test_function, 1:length(mutation_rate_inventory), 1), 'g--s', mutation_rate_inventory, STD_fitness_7(test_function, 1:length(mutation_rate_inventory), 2), 'b-.o', mutation_rate_inventory, STD_fitness_7(test_function, 1:length(mutation_rate_inventory), 3), 'k-*', mutation_rate_inventory, STD_fitness_7(test_function, 1:length(mutation_rate_inventory), 6), 'c-.*' );
    title({'Standard deviation of fitness values over different mutation rates'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Mutation rate', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of fitness values', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'OIMGA', 'Location', 'northeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test7_STD-Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Time plot
    figure;
    plot(mutation_rate_inventory, STD_time_7(test_function, 1:length(mutation_rate_inventory), 1), 'g--s', mutation_rate_inventory, STD_time_7(test_function, 1:length(mutation_rate_inventory), 2), 'b-.o', mutation_rate_inventory, STD_time_7(test_function, 1:length(mutation_rate_inventory), 3), 'k-*', mutation_rate_inventory, STD_time_7(test_function, 1:length(mutation_rate_inventory), 6), 'c-.*' );
    title({'Standard deviation of computation times on software over different mutation rates'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Mutation rate', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of computation times on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test7_STD-Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Evaluation number plot
    figure;
    plot(mutation_rate_inventory, STD_eval_7(test_function, 1:length(mutation_rate_inventory), 1), 'g--s', mutation_rate_inventory, STD_eval_7(test_function, 1:length(mutation_rate_inventory), 2), 'b-.o', mutation_rate_inventory, STD_eval_7(test_function, 1:length(mutation_rate_inventory), 3), 'k-*', mutation_rate_inventory, STD_eval_7(test_function, 1:length(mutation_rate_inventory), 6), 'c-.*' );
    title({'Standard deviation of number of evaluations over different mutation rates'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Mutation rate', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'OIMGA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test7_STD-Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
end

%Plotting results of Test 8
tournament_sizes = [ 2, 4, 8, 16 ];
for test_function=starting_test_function:(number_of_test_functions+starting_test_function-1)
    %Fitness plot
    figure;
    plot(tournament_sizes, fitness_8(test_function, 1:length(tournament_sizes), 1), 'g--s', tournament_sizes, fitness_8(test_function, 1:length(tournament_sizes), 2), 'b-.o', tournament_sizes, fitness_8(test_function, 1:length(tournament_sizes), 3), 'k-*' );
    title({'Fitness over different tournament sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Tournament size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Fitness', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Location', 'southeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test8_Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Time plot
    figure;
    plot(tournament_sizes, time_8(test_function, 1:length(tournament_sizes), 1), 'g--s', tournament_sizes, time_8(test_function, 1:length(tournament_sizes), 2), 'b-.o', tournament_sizes, time_8(test_function, 1:length(tournament_sizes), 3), 'k-*' );
    title({'Computation time on software over different tournament sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Tournament size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Computation time on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test8_Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %Evaluation number plot
    figure;
    plot(tournament_sizes, eval_8(test_function, 1:length(tournament_sizes), 1), 'g--s', tournament_sizes, eval_8(test_function, 1:length(tournament_sizes), 2), 'b-.o', tournament_sizes, eval_8(test_function, 1:length(tournament_sizes), 3), 'k-*' );
    title({'Number of evaluations over different tournament sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Tournament size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Total number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test8_Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
    
    %STD Fitness plot
    figure;
    plot(tournament_sizes, STD_fitness_8(test_function, 1:length(tournament_sizes), 1), 'g--s', tournament_sizes, STD_fitness_8(test_function, 1:length(tournament_sizes), 2), 'b-.o', tournament_sizes, STD_fitness_8(test_function, 1:length(tournament_sizes), 3), 'k-*' );
    title({'Standard deviation of fitness values over different tournament sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Tournament size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of fitness values', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Location', 'northeast'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test8_STD-Fitness_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Time plot
    figure;
    plot(tournament_sizes, STD_time_8(test_function, 1:length(tournament_sizes), 1), 'g--s', tournament_sizes, STD_time_8(test_function, 1:length(tournament_sizes), 2), 'b-.o', tournament_sizes, STD_time_8(test_function, 1:length(tournament_sizes), 3), 'k-*' );
    title({'Standard deviation of computation times on software over different tournament sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Tournament size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of computation times on software', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test8_STD-Time_TestFunction', num2str(test_function), '.tiff']);
    close;
    %STD Evaluation number plot
    figure;
    plot(tournament_sizes, STD_eval_8(test_function, 1:length(tournament_sizes), 1), 'g--s', tournament_sizes, STD_eval_8(test_function, 1:length(tournament_sizes), 2), 'b-.o', tournament_sizes, STD_eval_8(test_function, 1:length(tournament_sizes), 3), 'k-*' );
    title({'Standard deviation of number of evaluations over different tournament sizes'; 'Termination condition: Convergence'; test_function_names{test_function}}, 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Tournament size', 'FontWeight', 'bold', 'FontSize', 14);
    ylabel('Standard deviation of number of evaluations', 'FontWeight', 'bold', 'FontSize', 14);
    lgnd = legend('Generational GA', 'Steady State GA', 'Dual-Population GA', 'Location', 'northwest'); set(lgnd, 'FontSize', 11, 'FontWeight', 'bold');
    saveas(gcf, ['Test8_STD-Eval_TestFunction', num2str(test_function), '.tiff']);
    close;
end

end

