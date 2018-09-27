#- Functions in Julia -#
a = [exp, abs]
a[1](3)
# 1+2 is equivalent to +(1,2)
# all arguments to functions are passing by sharing
b = [2,1,3]
sort!(b)     # push operator

# define functions
foo(var) = var+1   # generic functions, for any type
# it's easy to use julia for meta-programming
foo(var1,var2) = var1+var2+1    # add another method under foo
methods(foo)
foo.(b)     # broadcasting using dot
function foo(var1,var2::Float64,var3=1)
    output1=var1+1
    output2=var2+1
    output3=var3
    return output1,output2,output3
end

x->x^2 # anonymous function
a = x->x^2  # to give it a name

# Currying: define functions of functions

# Closure

# Map: take an object and apply function, good thing is no need to loop
# Make use of mapreduce many many times
map(floor,[1.2,3.4,5.3])
map(x->x^2,[1.2,3.4,5.3])
reduce(+,[1,2,3])
mapreduce(x->x^2,+,[1,3])   # can use this for parallel programming
foldl(-,[1,2,3]) # fold from the left or right
filter(isodd,b)

# Matlab is column major, takes less cache, loops much much faster if start with column iteration

# Comprehensions
[x+y for x in 1:3,y = 1:4]  # not really a loop

# Generators: apply function to data
sum(1/n^2 for n=1:1000)    # PSID: average, sum, filter, in structure

# Types (constructors and methods) and Named Tuples

