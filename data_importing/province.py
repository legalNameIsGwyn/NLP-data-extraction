import csv

output_csv_file = 'dataset/province-data.csv'  
input_csv_file = 'dataset/PROVINCE.csv'

with open(output_csv_file, 'w', newline='', encoding='utf-8') as csvfile:
    writer = csv.writer(csvfile)
    
    with open(input_csv_file, newline='', encoding='utf-8') as inputfile:  
        reader = csv.DictReader(inputfile)
        
        for row in reader:
            region_name = row['Region']
            province = row['Province']
            capital = row['Capital']
            short_info = row['Short Info']
            population = row['Population']
            area = row['Land Area (sq km)']

            writer.writerow([region_name, province, capital, short_info, population, area])

    print("Province: Completed")