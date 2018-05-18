'''
Created on Oct 13, 2016

@author: aliu
'''

import numpy as np
import pandas as pd

''' ARRAY '''
print (np.__version__)
#print (pd.__version__)

countries = np.array(['Afghanistan', 'Albania', 'Algeria', 'Angola', 'Argentina',
                      'Armenia', 'Australia', 'Austria', 'Azerbaijan', 'Bahamas',
                      'Bahrain', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium',
                      'Belize', 'Benin', 'Bhutan', 'Bolivia','Bosnia and Herzegovina'])

print (countries)
print (countries[1])

# Female school completion rate in 2007 for those 20 countries
female_completion = np.array([ 97.35583, 104.62379, 103.02998,  95.14321, 103.69019,  
                               98.49185, 100.88828,  95.43974,  92.11484,  91.54804,
                               95.98029,  98.22902,  96.12179, 119.28105,  97.84627,
                               29.07386,  38.41644,  90.70509,  51.7478 ,  95.45072])

# Male school completion rate in 2007 for those 20 countries
male_completion = np.array([ 95.47622,  100.66476,   99.7926 ,   91.48936,  103.22096,
                             97.80458,  103.81398,   88.11736,   93.55611,   87.76347,
                            102.45714,   98.73953,   92.22388,  115.3892 ,   98.70502,
                             37.00692,   45.39401,   91.22084,   62.42028,   90.66958])

for i in range(len(countries)):
    country = countries[i]
    country_completion = female_completion[i] + male_completion[i]
    #print ('Country', country, ' has completion rate ', country_completion)
    print ("Country {} has completion rate {}".format(country,country_completion))
    
print ('The mean female completion rate {}'.format(female_completion.mean()))
print (' or find the mean this way {}'.format(np.mean(female_completion)))
print ('The max female completion rate {}'.format(female_completion.max()))
#? female_completion is a np.array object
#? mean() is a method available to the np.array object




