function population = create_population(population_size)
data = create_data;
population = struct.empty(population_size,0);
for i=1:population_size
    genes = create_genes;
    fitness = calculate_fitness(genes,data);
    population(i).genes = genes;
    population(i).fitness = fitness;
end
end