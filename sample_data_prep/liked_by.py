import random
import numpy as np
from datetime import datetime, timedelta

NUM_LIKES = 54000
NUM_PRODUCTS = 93
NUM_CUSTOMERS = 900

# --- Channel distribution: 60% web, 40% influencers ---
web_likes = int(NUM_LIKES * 0.60)
influencer_likes = NUM_LIKES - web_likes
influencer_ids = list(range(1, 31))

# Influencer performance skew: 3 top, 20 mid, 7 low
top = [random.randint(800, 1200) for _ in range(3)]
mid = [random.randint(600, 900) for _ in range(20)]
low = [random.randint(300, 600) for _ in range(7)]
distribution = top + mid + low
random.shuffle(influencer_ids)

# Build influencer part of channel list
channel_mapping = []
for influencer_id, count in zip(influencer_ids, distribution):
    channel_mapping.extend([influencer_id] * count)

# Pad or trim influencer list to match required count
if len(channel_mapping) < influencer_likes:
    remaining = influencer_likes - len(channel_mapping)
    channel_mapping.extend(random.choices(influencer_ids, k=remaining))
elif len(channel_mapping) > influencer_likes:
    channel_mapping = channel_mapping[:influencer_likes]

# Combine with web (-1) values and shuffle
channel_values = [-1] * web_likes + channel_mapping
random.shuffle(channel_values)

# --- Product popularity: Zipf distribution ---
product_popularity = np.random.zipf(a=1.5, size=NUM_LIKES)
product_popularity = [p for p in product_popularity if p <= NUM_PRODUCTS]

while len(product_popularity) < NUM_LIKES:
    product_popularity.append(random.randint(1, NUM_PRODUCTS))
product_popularity = product_popularity[:NUM_LIKES]

def random_past_date():
    days_ago = random.randint(0, 730)
    return (datetime.now() - timedelta(days=days_ago)).strftime('%Y-%m-%d')

# --- Write SQL ---
with open("../insert_liked_by1.sql", "w") as f:
    f.write("INSERT INTO liked_by (customer_id, product_id, channel, liked_date)\nVALUES\n")

    for i in range(NUM_LIKES):
        product_id = product_popularity[i]
        customer_id = random.randint(1, NUM_CUSTOMERS)
        liked_date = random_past_date()
        channel = channel_values[i]

        line = f"({customer_id}, {product_id}, {channel}, '{liked_date}')"
        line += ",\n" if i < NUM_LIKES - 1 else ";\n"
        f.write(line)

print(f"✔ Generated {NUM_LIKES} rows in insert_liked_by.sql with influencer-weighted channel distribution.")
