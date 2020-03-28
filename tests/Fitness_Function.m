function [ fitness, max_fitness ] = Fitness_Function( chromosome, chromosome_size, test_function )
%Fitness Function
%There are some benchmark fitness functions in this function. They can be
%accessed by feeding the proper function number in the input
%('test_function')

if test_function == 1
    %Test function 1 (Rastrigin function, with n=2 and A=10) [max = 0]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x1 = bin2dec( strx1 );
    x1 = x1 / bin2dec( str1s );
    x2 = bin2dec( strx2 );
    x2 = x2 / bin2dec( str1s );
    x1=x1*10.24 - 5.12;
    x2=x2*10.24 - 5.12;
    fitness = -( 10 * 2 + ( x1^2 - 10*cos(2*pi*x1) ) + ( x2^2 - 10*cos(2*pi*x2) ) );
    max_fitness = 0;
elseif test_function == 2
    %Test function 2 (Ackley's function) [max = 0]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*10 - 5;
    y=y*10 - 5;
    fitness = -( - 20 * exp( -0.2*sqrt(0.5*(x^2+y^2)) ) - exp( 0.5*(cos(2*pi*x)+cos(2*pi*y)) ) + exp(1) + 20 );
    max_fitness = 0;
elseif test_function == 3
    %Test function 3 (Sphere function, with n=2 and -2000 <= xi <= 2000) [max = 0]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x1 = bin2dec( strx1 );
    x1 = x1 / bin2dec( str1s );
    x2 = bin2dec( strx2 );
    x2 = x2 / bin2dec( str1s );
    x1=x1*4000 - 2000; 
    x2=x2*4000 - 2000; %disp(x1); disp(x2);
    fitness = -(x1^2 + x2^2);
    max_fitness = 0;
elseif test_function == 4
    %test_function 4 (Rosenbrock function, with n=2 and -2000 <= xi <= 2000) [max = 0]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x1 = bin2dec( strx1 );
    x1 = x1 / bin2dec( str1s );
    x2 = bin2dec( strx2 );
    x2 = x2 / bin2dec( str1s );
    x1=x1*4000 - 2000;
    x2=x2*4000 - 2000;
    fitness = -( 100*(( x2 - x1^2 )^2) + ( x1 - 1 )^2 );
    max_fitness = 0;
elseif test_function == 5
    %Test function 5 (Beale's function) [max = 0]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*9 - 4.5;
    y=y*9 - 4.5;
    fitness = -( ( 1.5 - x - x*y)^2 + ( 2.25 - x + x*(y^2) )^2 + ( 2.625 - x + x*(y^3) )^2 );
    max_fitness = 0;
elseif test_function == 6
    %Test function 6 (Goldstein�Price function) [max = -3]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*4 - 2;
    y=y*4 - 2;
    fitness = -( ( 1 + (( x + y + 1 )^2) * ( 19 - 14*x + 3*(x^2) - 14*y + 6*x*y + 3*(y^2) ) ) * ( 30 + (( 2*x - 3*y )^2) * ( 18 - 32*x + 12*(x^2) + 48*y -36*x*y + 27*(y^2) ) ) );
    max_fitness = -3;
elseif test_function == 7
    %Test function 7 (Booth's function) [max = 0]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*20 - 10;
    y=y*20 - 10;
    fitness = -( ( x + 2*y -7 )^2 + ( 2*x + y - 5 )^2 );
    max_fitness = 0;
elseif test_function == 8
    %Test function 8 (Bukin function N.6) [max = 0]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*10 - 15;
    y=y*6 - 3;
    fitness = -( 100 * sqrt(abs( y - 0.01*(x^2) )) + 0.01 * abs(x+10) );
    max_fitness = 0;
elseif test_function == 9
    %Test function 9 (Matyas function) [max = 0]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*20 - 10;
    y=y*20 - 10;
    fitness = -( 0.26 * (x^2 + y^2) - 0.48 * x * y );
    max_fitness = 0;
elseif test_function == 10
    %Test function 10 (L�vi function N.13) [max = 0]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*20 - 10;
    y=y*20 - 10;
    fitness = -( sin( 3*pi*x )^2 + (( x-1 )^2) * ( 1 + sin(3*pi*y)^2 ) + (( y-1 )^2) * ( 1 + sin(2*pi*y)^2 ) );
    max_fitness = 0;
elseif test_function == 11
    %Test function 11 (Three-hump camel function) [max = 0]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*10 - 5;
    y=y*10 - 5;
    fitness = -( 2*(x^2) - 1.05*(x^4) + (x^6)/6 + x*y + y^2 );
    max_fitness = 0;
elseif test_function == 12
    %Test function 12 (Easom function) [max = 1]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*200 - 100;
    y=y*200 - 100;
    fitness = cos(x) * cos(y) * exp( -( (x-pi)^2 + (y-pi)^2 ) );
    max_fitness = 1;
elseif test_function == 13
    %Test function 13 (cross-in-tray function) [max = 2.06261]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*20 - 10;
    y=y*20 - 10;
    fitness = 0.0001 * ( abs( sin(x) * sin(y) * exp( abs( 100 - ( sqrt(x^2 + y^2) / pi ) ) ) ) + 1 )^0.1;
    max_fitness = 2.06261;
elseif test_function == 14 
    %Test function 14 (eggholder function) [max = 959.6407]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*1024 - 512;
    y=y*1024 - 512;
    fitness = (y + 47) * sin(sqrt(abs( x/2 + y + 47 ))) + x * sin(sqrt(abs( x - y + 47 )));
    max_fitness = 959.6407;
elseif test_function == 15
    %Test function 15 (holder table function) [max = 19.2085]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*20 - 10;
    y=y*20 - 10;
    fitness = abs( sin(x) * cos(y) * exp(abs( 1 - ( sqrt(x^2 + y^2)/pi ) )) );
    max_fitness = 19.2085;
elseif test_function == 16
    %Test function 16 (McCormick function) [max = 1.9133]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*5.5 - 1.5;
    y=y*7 - 3;
    fitness = -( sin(x+y) + (x-y)^2 - 1.5*x + 2.5*y + 1 );
    max_fitness = 1.9133;
elseif test_function == 17
    %Test function 17 (Schaffer function N. 2) [max = 0]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*200 - 100;
    y=y*200 - 100;
    fitness = -( 0.5 + ( sin(x^2 - y^2)^2 - 0.5 ) / (( 1 + 0.001*(x^2 + y^2) )^2) );
    max_fitness = 0;
elseif test_function == 18
    %Test function 18 (Schaffer function N. 4) [max = -0.292579]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x = bin2dec( strx1 );
    x = x / bin2dec( str1s );
    y = bin2dec( strx2 );
    y = y / bin2dec( str1s );
    x=x*200 - 100;
    y=y*200 - 100;
    fitness = -( 0.5 + ( cos( sin(abs( x^2 - y^2 )) )^2 - 0.5 ) / (( 1 + 0.001 * (x^2 + y^2) )^2) );
    max_fitness = -0.292579;
elseif test_function == 19
    %Test function 19 (Styblinski�Tang function, with n = 2) [ 39.16616n < max < 39.16617n ]
    strx1 = int2str(chromosome(1:fix(chromosome_size/2)));
    strx2 = int2str(chromosome(fix(chromosome_size/2)+1:chromosome_size));
    str1s = int2str(ones(1, fix(chromosome_size/2)));
    strx1(isspace(strx1)) = '';
    strx2(isspace(strx2)) = '';
    str1s(isspace(str1s)) = '';
    x1 = bin2dec( strx1 );
    x1 = x1 / bin2dec( str1s );
    x2 = bin2dec( strx2 );
    x2 = x2 / bin2dec( str1s );
    x1=x1*10 - 5;
    x2=x2*10 - 5;
    fitness = -( (( x1^4 - 16 * (x1^2) + 5 * x1 ) + ( x2^4 - 16 * (x2^2) + 5 * x2 )) / 2 );
    max_fitness = 2 * 39.16617;
end

end

