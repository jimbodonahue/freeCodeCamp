import numpy as np
# import pandas as pd
test = [0,1,2,3,4,5,6,7,8]
# print(len(test))
def calculate(x):
    ## check for errors before getting into the nitty gritty
    check = len(x)
    if check != 9:
        raise ValueError("List must contain nine numbers.")
    check = type(x)
    if check is not list: 
        raise ValueError("List must contain nine numbers.")
    ## reshape data
    data = np.array(x).reshape(3,3).astype(float)
    ## calculate means
    mean0 = list(np.mean(data, axis=0).flatten())
    mean1 = list(np.mean(data, axis=1).flatten())
    mean2 = list(np.mean(data).flatten())
    ## calc variance
    var0 = list(np.var(data, axis=0).flatten())
    var1 = list(np.var(data, axis=1).flatten())
    var2 = list(np.var(data).flatten())
    ## standard deviation
    sd0 = list(np.std(data, axis=0).flatten())
    sd1 = list(np.std(data, axis=1).flatten())
    sd2 = list(np.std(data).flatten())
    ## max
    max0 = list(np.max(data, axis=0).flatten())
    max1 = list(np.max(data, axis=1).flatten())
    max2 = list(np.max(data).flatten())
    ## min
    min0 = list(np.min(data, axis=0).flatten())
    min1 = list(np.min(data, axis=1).flatten())
    min2 = list(np.min(data).flatten())
    ## sum
    sum0 = list(np.sum(data, axis=0).flatten())
    sum1 = list(np.sum(data, axis=1).flatten())
    sum2 = list(np.sum(data).flatten())
    ## Put it in a dictionary
    mymean = [mean0, mean1, mean2]
    myvar = [var0, var1, var2]
    mystd = [sd0, sd1, sd2]
    mymax = [max0, max1, max2]
    mymin = [min0, min1, min2]
    mysum = [sum0, sum1, sum2]
    dicc = {'mean': mymean,
            'variance': myvar,
            'standard deviation': mystd,
            'max': mymax,
            'min': mymin,
            'sum': mysum}
    return dicc

calculate(test)

