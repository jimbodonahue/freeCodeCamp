import pandas as pd


def calculate_demographic_data(print_data=True):
    # Read data from file
    df = pd.read_csv("adult.data.csv")
    df = df.rename(columns={"native-country": "country"})

    # How many of each race are represented in this dataset? This should be a Pandas series with race names as the index labels.
    race_count = df.groupby("race")["race"].count()

    # What is the average age of men?
    mens = df.age.loc[df.sex == 'Male']
    average_age_men = mens.mean(numeric_only=True).round(1)

    # What is the percentage of people who have a Bachelor's degree?
    percentage_bachelors = df.education.loc[df.education == 'Bachelors'].count()*100/df.education.count()
    percentage_bachelors = percentage_bachelors.round(1)

    # What percentage of people with advanced education (`Bachelors`, `Masters`, or `Doctorate`) make more than 50K?
    # What percentage of people without advanced education make more than 50K?

    # with and without `Bachelors`, `Masters`, or `Doctorate`

    high_list = ['Bachelors', 'Masters', 'Doctorate']
    low_list = df['education'].unique()
    low_list = list(filter(lambda x: x not in high_list, low_list))
    df['high_salary'] = df.salary == '>50K'
    n_high_salary = df.loc[df['high_salary'] == True].high_salary.count()
    higher_education = df.loc[df.education.isin(high_list)].high_salary.sum()*100/n_high_salary
    higher_education_rich = higher_education.round(1)
    lower_education = df.loc[df.education.isin(low_list)].high_salary.sum()*100/n_high_salary
    lower_education_rich = lower_education.round(1)

    # What is the minimum number of hours a person works per week (hours-per-week feature)?
    min_work_hours = df['hours-per-week'].min()
    num_min_workers = df.loc[df['hours-per-week'] == 1, ['hours-per-week']].sum()
    # What percentage of the people who work the minimum number of hours per week have a salary of >50K?
    
    min_hours = df[df['hours-per-week'] == df['hours-per-week'].min()]
    num_min_workers = min_hours.shape[0]

    rich_percentage = min_hours[min_hours['salary'] == '>50K'].shape[0]/num_min_workers * 100

    # What country has the highest percentage of people that earn >50K?
    high_list = ['Bachelors', 'Masters', 'Doctorate']

    low_list = df['education'].unique()
    low_list = list(filter(lambda x: x not in high_list, low_list))
    df['high_salary'] = df.salary == '>50K'
    higher = df[df['education'].isin(high_list)]
    total_higher = higher.shape[0]
    higher_education_rich = round(higher[higher['salary'] == '>50K'].shape[0]/total_higher * 100, 1)
    lower = df[df['education'].isin(low_list)]
    total_lower = lower.shape[0]
    lower_education_rich = round(lower[lower['salary'] == '>50K'].shape[0]/total_lower * 100, 1)

    # Identify the most popular occupation for those who earn >50K in India.
    high_earning_country = df[df['salary'] == '>50K']
    high_list = high_earning_country.groupby('country').size()
    percents = high_list / df.groupby('country').size() * 100
    highest_earning_country = percents.idxmax()
    highest_earning_country_percentage = round(percents.max(), 1)

    # Identify the most popular occupation for those who earn >50K in India.
    india_rich = high_earning_country[high_earning_country['country'] == 'India']
    india_occupation = india_rich.groupby('occupation').size()
    india_list = india_occupation.nlargest(1)
    top_IN_occupation = india_list.idxmax()
    print(top_IN_occupation)

    # DO NOT MODIFY BELOW THIS LINE

    if print_data:
        print("Number of each race:\n", race_count) 
        print("Average age of men:", average_age_men)
        print(f"Percentage with Bachelors degrees: {percentage_bachelors}%")
        print(f"Percentage with higher education that earn >50K: {higher_education_rich}%")
        print(f"Percentage without higher education that earn >50K: {lower_education_rich}%")
        print(f"Min work time: {min_work_hours} hours/week")
        print(f"Percentage of rich among those who work fewest hours: {rich_percentage}%")
        print("Country with highest percentage of rich:", highest_earning_country)
        print(f"Highest percentage of rich people in country: {highest_earning_country_percentage}%")
        print("Top occupations in India:", top_IN_occupation)

    return {
        'race_count': race_count,
        'average_age_men': average_age_men,
        'percentage_bachelors': percentage_bachelors,
        'higher_education_rich': higher_education_rich,
        'lower_education_rich': lower_education_rich,
        'min_work_hours': min_work_hours,
        'rich_percentage': rich_percentage,
        'highest_earning_country': highest_earning_country,
        'highest_earning_country_percentage':
        highest_earning_country_percentage,
        'top_IN_occupation': top_IN_occupation
    }
