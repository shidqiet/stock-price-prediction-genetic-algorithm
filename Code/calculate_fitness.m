function fitness = calculate_fitness(genes,data)
e = 0;
for i = 1:10
y = genes(1)+(1+genes(2))*data.Yt_1(i)-genes(3)*data.Yt_2(i)+data.Et(i)-genes(4)*data.Et_1(i);
yi = data.Yt(i);
e = e + immse(y,yi);
end
error = sqrt(e/10);
fitness = 1/error;
end

