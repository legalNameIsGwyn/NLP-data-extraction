import csv

input_csv_file = 'input-data/REGION.csv'  

# Define output CSV files and their corresponding columns
output_files = [
    # ('dataset/region.csv', ['Counter', 'Region ID', 'Region', 'Short Info', 'Population', 'Land Area (sq km)', 'Image']),
    ('dataset/popular_phrases.csv', ['Counter', 'Region', 'Population', 'Image'])
    # Add more output file paths and columns as needed
]

# Iterate over each output file configuration
for output_csv_file, columns in output_files:
    with open(output_csv_file, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        
        with open(input_csv_file, newline='', encoding='utf-8') as inputfile:  
            reader = csv.DictReader(inputfile)

            # Initialize counter
            counter = 0
            
            # Iterate over each row in the input CSV file
            for row in reader:
                # Extract data based on columns
                data = [counter] + [row[column] for column in columns[1:]]  
                
                # Write data to the output CSV file
                writer.writerow(data)
                
                # Increment counter for the next row
                counter += 1

    print(f"{output_csv_file}: Completed")
