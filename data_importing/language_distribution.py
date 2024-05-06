import csv

output_csv_file = 'dataset/region_languages.csv'  
input_csv_file = 'dataset/REGION.csv'

with open(output_csv_file, 'w', newline='', encoding='utf-8') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['Region', 'Language', 'Percentage'])  # Write header row
    
    with open('dataset/REGION.csv', newline='', encoding='utf-8') as inputfile:  
        reader = csv.DictReader(inputfile)
        for row in reader:
            region_name = row['Region']
            languages_and_percentages = row['Formatted Population Distribution by Language'].split('%')

            for item in languages_and_percentages:
                parts = item.split(':')
                if len(parts) > 1:
                    language = parts[0].strip()
                    percentage = parts[1].strip()
                    print(region_name, language, percentage)
                    writer.writerow([region_name, language, percentage])

print("Output saved to:", input_csv_file)

# Print formatted data
for line in formatted_data:
    print(line)
