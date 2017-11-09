function myNums = randNumGenPar(n)

myNums = zeros(1,n);

parfor i = 1:n
    
    myNums(i) = rand();
    
end

end