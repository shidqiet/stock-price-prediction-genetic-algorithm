clc
clear

p = input('jumlah populasi (integer) : ');
mr = input('CrossOver Rate (0-1) : ');
cr = input('mutation rate (0-1) : ');

maxc = -1000;
population = create_population(p);
for i = 1:10
    [best1, best2] = selection(population);
    pops_co = crossover(best1,best2,cr,p);
    pops_mu = mutation(population,mr);
    [population, max, idx_max] = regeneration(pops_co,pops_mu,population);
    if(max>maxc)
        maxc=max;
    end
    disp(maxc);
    save(i)=max;
    savemax(i)=maxc;
end

disp(population(idx_max));

subplot(1,2,1);
plot(save), xlabel('Jumlah Loop'),ylabel('Fitness tiap loop');
subplot(1,2,2);
plot(savemax), xlabel('Jumlah Loop'),ylabel('Fitness maksimum');