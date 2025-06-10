import random
import numpy as np
from datetime import datetime, timedelta

NUM_ORDERS = 18000
NUM_PRODUCTS = 93
NUM_CUSTOMERS = 900
STATUS_CHOICES = ['delivered', 'returned', 'shipped']

# --- Generate skewed channel distribution (influencers + web) ---
influencer_ids = list(range(1, 31))

# 25% web orders
web_orders = int(NUM_ORDERS * 0.25)
# 75% influencer orders
influencer_orders = NUM_ORDERS - web_orders

# Influencer performance categories
top = [random.randint(400, 650) for _ in range(3)]
mid = [random.randint(300, 450) for _ in range(20)]
low = [random.randint(100, 250) for _ in range(7)]
distribution = top + mid + low
random.shuffle(influencer_ids)

# Map influencers to order counts
channel_mapping = []
for influencer_id, count in zip(influencer_ids, distribution):
    channel_mapping.extend([influencer_id] * count)

# Pad or trim to match influencer_orders count
if len(channel_mapping) < influencer_orders:
    remaining = influencer_orders - len(channel_mapping)
    channel_mapping.extend(random.choices(influencer_ids, k=remaining))
elif len(channel_mapping) > influencer_orders:
    channel_mapping = channel_mapping[:influencer_orders]

# Final channel list
channel_values = [-1] * web_orders + channel_mapping
random.shuffle(channel_values)

# --- Generate skewed product popularity ---
product_popularity = np.random.zipf(a=1.5, size=NUM_ORDERS)
product_popularity = [p for p in product_popularity if p <= NUM_PRODUCTS]

while len(product_popularity) < NUM_ORDERS:
    product_popularity.append(random.randint(1, NUM_PRODUCTS))
product_popularity = product_popularity[:NUM_ORDERS]

def random_past_date():
    days_ago = random.randint(0, 730)
    return (datetime.now() - timedelta(days=days_ago)).strftime('%Y-%m-%d')

# --- Write SQL ---
with open("../insert_bought_by.sql", "w") as f:
    f.write("INSERT INTO bought_by (product_id, customer_id, status, channel, rating, quantity, bought_date)\nVALUES\n")

    for i in range(NUM_ORDERS):
        product_id = product_popularity[i]
        customer_id = random.randint(1, NUM_CUSTOMERS)
        status = random.choice(STATUS_CHOICES)
        rating = random.randint(1, 5)
        quantity = random.randint(1, 5)
        bought_date = random_past_date()
        channel = channel_values[i]

        line = f"({product_id}, {customer_id}, '{status}', {channel}, {rating}, {quantity}, '{bought_date}')"
        line += ",\n" if i < NUM_ORDERS - 1 else ";\n"
        f.write(line)

print(f"✔ Generated {NUM_ORDERS} rows in insert_bought_by.sql with influencer-weighted channel distribution.")
