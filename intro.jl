# Arrays, Vectors, Matrices
x = Array{Float64,2}(undef,2,3)
size(x)
x1 = copy(x)
x2 = deepcopy(x)                    # change references to other objects within the array
v1 = [1,2,3]                        # this is a vector
m1 = [1 2 3]                        # this is a matrix
v2 = collect(1.0:0.5:4.0)           # vector creation
m2 = collect(range(0;stop=1,step=0.2))  # convert list to vector
b = [2,1,3]
sort(b,by=abs)                      # sort b does not change it
sort!(b)                            # sort b and change it
sortperm(b)                         # indices of sort of b
push!(b,4)                          # add an element at the end and changes it
m2 = [1 2;3 4]                      # create matrix
m3 = fill(2,3,4)                    # fill a 3*4 matrix with 2's
m4 = rand(2,2)                      # uniform distribution
m5 = randn(2,2)                     # Gaussian
c = repeat(m2,outer=[2,3])          # same as repmat (deprecated)
vec(c)                              # vectorize
using LinearAlgebra
eigvals(m2)
eigvecs(m2)                         # columns
a = reshape(1:10,5,2)
a = reshape(a,5,2,1,1)
a = dropdims(a;dims=4)              # drop the unwanted dimension
using SparseArrays
s1 = spzeros(100,100)
s2 = sparse(s1)

# Functions - first class citizens
# Julia use methods with multiple dispatch: each function can be associated with different methods.
f = [exp, abs]
f[1](3)
# 1+2 is equivalent to +(1,2)
# all arguments to functions are passing by sharing
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
function myfunction5(var1)      # higher-order function
    function myfunction6(var2)
        answer = var1+var2
        return answer
    end
    return myfunction5
end
a1 = myfunction5(1) # creates a function a1 that produces 1+var2
a2 = myfunction5(2) # creates a function a2 that produces 2+var2
x->x^2 # anonymous function
a = x->x^2  # to give it a name

# Recursion
# memory intensive and Julia does not implement tail call
function outer(a)
    b = a+2
    function inner(b)
        b = a+3
    end
    inner(b)
end

# Closure: a record storing a function
# allow for handling functions while keeping states hidden, known as continuation-passing style
function counter()
    n = 0
    () -> n += 1
end
addOne = counter()  # name it
addOne()
addOne()

# Currying: transform the evaluation of a function with multiple arguments into the evaluation of a sequence of functions, each with a single argument
# allows for easier reuse of abstract functions
function mult(a)
    return function f(b)
        return a*b
    end
end

# Map: take an object and apply function, good thing is no need to loop
# Make use of mapreduce many many times
map(floor,[1.2,3.4,5.3])
map(x->x^2,[1.2,3.4,5.3])
map((x,y)->x+2*y,[1,2],[3,4])
reduce(+,[1,2,3])
mapreduce(x->x^2,+,[1,3])   # can use this for parallel programming
foldl(-,[1,2,3]) # fold from the left or right
filter(isodd,b)
# Matlab is column major, takes less cache, loops much much faster if start with column iteration

# Comprehensions
[x+y for x in 1:3,y = 1:4]  # not really a loop, rule-defined array
# Generators: apply function to data
sum(1/n^2 for n=1:1000)    # PSID: average, sum, filter, in structure

# Types (constructors and methods) and Named Tuples
# Tuples are ordered, elements cannot be changed
a = ("This is a tuple",2018)
zip(v1,m1)  # create tuples using zip
# Dictionaries are collections with keys are values of elements, used for texts
a = Dict("University of Pennsylvania" => "Philadelphia", "Boston College" =>"Boston")
a["University of Pennsylvania"]  # access one key
a["Harvard"] = "Cambridge"       # adds an additional key
delete!(a,"Harvard")             # deletes a key
keys(a)
values(a)
haskey(a,"University of Pennsylvania") # returns true
haskey(a,"MIT") # returns false

# Composite types - struct

# Metaprogramming: write code that can modify itself
# refer to document

# Multiple files
include("intro.jl")
# Timing
tic()
toc()
@time main()        # measure time of function main()
