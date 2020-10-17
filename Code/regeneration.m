function [new_population, maxf, idx_max] = regeneration(pops_co,pops_mu,population)
data = create_data;
fitness = zeros(1,(length(pops_co)+ length(pops_mu)));
fitness_pops = zeros(1,(length(population)));

batas = length(pops_co);
%-----------------------------------------------
%Isi array pops

for i=1:length(population)
    fitness_pops= population(i).fitness;
end

%-----------------------------------------------
% Isi array fitness

for i=1:batas
    fitness(i) = calculate_fitness(pops_co(i).genes,data);
end


for i= (batas+1) : length(fitness)
    fitness(i) = calculate_fitness(pops_mu(i- batas).genes,data);
end

%--------------------------------------------------
%Tentukan populasi baru dari yang terbaik


for i=1:batas
    [~,index] = min(fitness_pops);
    if (fitness(i)> population(index).fitness) % Berarti ganti populasi terjelek dengan anaknya
        population(index)= pops_co(i);
        fitness_pops(index)= pops_co(i).fitness;
    end
end

for i=(batas+1): length(fitness)
    [~,index] = min(fitness_pops);
    if (fitness(i)> population(index).fitness) % Berarti ganti populasi terjelek dengan anaknya
        population(index)= pops_mu(i- batas);
        fitness_pops(index)= pops_mu(i- batas).fitness;
    end
end

new_population= population;
[maxf, idx_max] = max(fitness_pops);


end