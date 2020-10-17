function[pops_mu] = mutation(pops,mutation_rate)
data = create_data;
%Tentukan banyak mutan
many_mutant= round(length(pops)*mutation_rate);
if (many_mutant==0)
    many_mutant=1;
end

mutant.genes(1:4) = 0;

counter_mutant=0;

for i=1:many_mutant
    % Pilih parent
    idx_parent= randi([1,length(pops)], 1, 'single');
    parent= pops(idx_parent);

    for j=1:4
      % Pilih r
      r= rand(1,1,'single');

      % Buat mutan
      mutant.genes(j)= parent.genes(j)+ r*200;
    end

    counter_mutant= counter_mutant+1;

    pops_mu(counter_mutant).genes= mutant.genes;
    pops_mu(counter_mutant).fitness = calculate_fitness(mutant.genes,data);
    
end

end