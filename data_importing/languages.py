import csv

def get_unique_languages(text):
    # Split the text by commas and remove any leading/trailing whitespace
    languages_list = [lang.strip() for lang in text.split(',')]

    # Create a set to store unique languages
    unique_languages = set()
    
    # Add each language to the set
    for lang in languages_list:
        # Skip empty strings
        if lang:
            unique_languages.add(lang)
    
    return unique_languages

def get_pop_languages(text):
    lang_perc = text.split('%')

    if lang_perc[0] == '':
        return None
    
    for item in lang_perc:
        parts = item.split(':')
        language = parts[0].strip()
        percentage = parts[1].strip()

        return [language, percentage]

# Read data from CSV file
input_csv_file = 'input-data/REGION.csv'  
output_csv_file = 'dataset/languages.csv' 
unique_languages = set()

with open(input_csv_file, newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)

    for row in reader:
        languages_spoken = row['Languages Spoken']
        pop_lang = get_pop_languages(row['Formatted Population Distribution by Language'])

        if pop_lang and pop_lang[0] is not None:
            unique_languages.update([pop_lang[0]])  
            
        unique_languages.update(get_unique_languages(languages_spoken))



print(unique_languages)

# with headers
with open('input-data/LANGUAGE.csv', 'w', newline='', encoding='utf-8') as csvfile:
    writer = csv.writer(csvfile)
    counter = 0
    writer.writerow(['ID', 'Language'])
    for lang in sorted(unique_languages):
        writer.writerow([counter, lang])
        counter+=1

# without headers
with open(output_csv_file, 'w', newline='', encoding='utf-8') as csvfile:
    writer = csv.writer(csvfile)
    counter = 0

    for lang in sorted(unique_languages):
        writer.writerow([counter, lang])
        counter+=1

print(f"Unique languages have been written to '{output_csv_file}'.")
