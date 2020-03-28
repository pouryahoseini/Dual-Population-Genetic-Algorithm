%This script examines the genetic algorithms in different test parameters

reruns_number=30;

%Setting different values for parameters to be tested
selection_type = [{'tournament'}];  % , {'roulette'}];
mutation_rate = [0.001, 0.01, 0.05];
crossover_rate = [0.6, 0.8, 0.95];
tournament_size = [2, 6, 16];
iteration_number = [25, 75, 150];
chromosome_size = [10, 30, 50];
population_size = [25, 75, 150];

%Trying all test functions
clc;
count_runs_all=0;
rank_fitness_all=zeros(1,5);
rank_time_all=zeros(1,5);

for test_function=1:19

    count_runs=0;
    rank_fitness=zeros(1,5);
    rank_time=zeros(1,5);

    fprintf('\n\n********\nTest function: %d\n\n', test_function);
    %Sweep test
    for g=1:length(selection_type)
        fprintf('/');
        for a=1:length(population_size)
            fprintf('+');
            for b=1:length(chromosome_size)
                fprintf('-');
                for c=1:length(iteration_number)
                    for f=1:length(mutation_rate)
                        for e=1:length(crossover_rate)
                            
                            tournament_length = length(tournament_size);
                            if ~strcmp(selection_type(g), 'tournament')
                                tournament_length = 1;
                            end
                            
                            for d=1:tournament_length
                                
                                [ cGA_average_fitness, ssGA_average_fitness, dpGAdw_average_fitness, dpGAdo_average_fitness, rs_average_fitness, cGA_average_time, ssGA_average_time, dpGAdw_average_time, dpGAdo_average_time, rs_average_time ] = Compare_Averages( test_function, reruns_number, population_size(a), chromosome_size(b), iteration_number(c), tournament_size(d), crossover_rate(e), mutation_rate(f), selection_type(g) );
                                
                                [~,sort_index]=sort([cGA_average_fitness ssGA_average_fitness dpGAdw_average_fitness dpGAdo_average_fitness rs_average_fitness], 'descend');
                                for jj=1:5
                                    rank_fitness(jj)=rank_fitness(jj)+find(sort_index==jj);
                                end
                                    
                                [~,sort_index]=sort([cGA_average_time ssGA_average_time dpGAdw_average_time dpGAdo_average_time rs_average_time], 'ascend');
                                for jj=1:5
                                    rank_time(jj)=rank_time(jj)+find(sort_index==jj);
                                end
                                    
                                count_runs=count_runs+1;
        
                            end
                            
                        end
                    end
                end
            end
        end
    end
    fprintf('\n\n');

    rank_fitness_temp=rank_fitness/count_runs;
    rank_time_temp=rank_time/count_runs;

    disp('Fitness ranking for the current test function [cGA ssGA dpGAdw dpGado rs]');
    disp(rank_fitness_temp);
    disp('Computational time ranking for the current test function [cGA ssGA dpGAdw dpGAdo rs]');
    disp(rank_time_temp);

    count_runs_all = count_runs_all + count_runs;
    rank_fitness_all = rank_fitness_all + rank_fitness;
    rank_time_all = rank_time_all + rank_time;

    rank_fitness_temp=rank_fitness_all/count_runs_all;
    rank_time_temp=rank_time_all/count_runs_all;

    disp('Fitness ranking so far [cGA ssGA dpGAdw dpGAdo rs]');
    disp(rank_fitness_temp);
    disp('Computational time ranking so far [cGA ssGA dpGAdw dpGAdo rs]');
    disp(rank_time_temp);

end

rank_fitness_all=rank_fitness_all/count_runs_all;
rank_time_all=rank_time_all/count_runs_all;

fprintf('\n\n********************\n********************\n\n');
disp('Final fitness ranking [cGA ssGA dpGAdw dpGAdo rs]');
disp(rank_fitness_all);
disp('Final computational time ranking [cGA ssGA dpGAdw dpGAdo rs]');
disp(rank_time_all);
