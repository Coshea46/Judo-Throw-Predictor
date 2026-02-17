import os
import csv

csv_path = './intervals_of_throws.csv'

with open(csv_path, newline='',encoding='utf-8',mode='a') as f:
    writer = csv.writer(f)

    writer.writerow(['attempt_id','frame_with_throw'])

    for i in range(1,1000):
        writer.writerow([i,''])


