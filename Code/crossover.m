function pops_co= crossover(parent1,parent2,cr,banyak_pops)
data = create_data;
child1 = parent1;
child2 = parent2;


%tentukan banyak anak
many_anak= 2*(round(cr*banyak_pops)/2);
counter_anak= 0;


%buat anak
if (many_anak==0)
    alpha= rand(1,1);
    for j=1:4
      child1.genes(j)= child1.genes(j) + alpha*(child2.genes(j)- child1.genes(j));
    end 
    pops_co.genes= child1.genes;
    pops_co.fitness = calculate_fitness(pops_co.genes,data);
else
  for i=1:(many_anak/2)
      alpha= rand(1,1);
      for j=1:4
        child1.genes(j)= child1.genes(j) + alpha*(child2.genes(j)- child1.genes(j));
      end

  counter_anak= counter_anak+1;
  pops_co(counter_anak).genes= child1.genes;
  pops_co(counter_anak).fitness = calculate_fitness(pops_co(counter_anak).genes,data);


  alpha= rand(1,1);
  for j=1:4
    child2.genes(j)= child2.genes(j) + alpha*(child1.genes(j)- child2.genes(j));
  end

  counter_anak= counter_anak+1;
  pops_co(counter_anak).genes= child2.genes;
  pops_co(counter_anak).fitness = calculate_fitness(pops_co(counter_anak).genes,data);

end

end