import csv

output_csv_file = 'dataset/major_dialect.csv'  
input_csv_file = 'input-data/REGION.csv'

with open(output_csv_file, 'w', newline='', encoding='utf-8') as csvfile:
    writer = csv.writer(csvfile)
    
    with open(input_csv_file, newline='', encoding='utf-8') as inputfile:  
        reader = csv.DictReader(inputfile)
        id = 0
        for row in reader:
            region_id = row['Region ID']
            dialects = row['Major Dialects'].replace(" ", "").split(',')
            
            for dialect in dialects:
                if dialect:
                    writer.writerow([id, dialect, region_id])
                    id+=1

        id = 0 # Reset 

    print('Major Dialect: Complete')