import csv
import os

# turn throw attempts into objects
csv_directory_address = '/mnt/c/Users/oshea/Judo-coach-bot-raw-videos-(data)/full-videos'

csvs_as_objects = sorted(os.scandir(csv_directory_address))

print(csvs_as_objects)


