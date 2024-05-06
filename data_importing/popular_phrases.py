import csv

output_csv_file = 'dataset/popular_phrases.csv'
input_csv_file = 'input-data/REGION.csv'
language_file = 'input-data/LANGUAGE.csv'

with open(output_csv_file, 'w', newline='', encoding='utf-8') as csvfile:
    writer = csv.writer(csvfile)
    
    with open(input_csv_file, newline='', encoding='utf-8') as inputfile, \
            open(language_file, newline='', encoding='utf-8') as languages:
        
        input_reader = csv.DictReader(inputfile)
        language_reader = csv.DictReader(languages)

        id = 0
        for input_row, language_row in zip(input_reader, language_reader):
            region_name = input_row['Region']
            phrases = input_row['Popular phrases'].split(',')

            # for phrase in phrases:
            #     phrase = phrase.replace("\"", "").strip()
            #     if ':' in phrase:
            #         phrase = phrase.split(':')
            #         writer.writerow([id, phrase[0], region_name, phrase[1]])
            #         id+=1
            #     elif phrase:
            #         writer.writerow([id, region_name, phrase, None])
            #         id+=1
    print("Popular Phrases: Complete")