function myNums = randNumGen(n)

myNums = zeros(1,n);

for i = 1:n
    
    myNums(i) = rand();
    
end

end