from faker import Faker
import random
from datetime import datetime
import os

fake = Faker('tr_TR')
Faker.seed(0)

NUM_CUSTOMERS = 900
unique_emails = set()
unique_phones = set()

def generate_unique_email(name):
    base = name.lower().replace(" ", ".")
    domain = "mail.com"
    counter = 1
    email = f"{base}@{domain}"
    while email in unique_emails:
        counter += 1
        email = f"{base}{counter}@{domain}"
    unique_emails.add(email)
    return email

def generate_unique_phone():
    while True:
        phone = f"+905{random.randint(100000000, 999999999)}"
        if phone not in unique_phones:
            unique_phones.add(phone)
            return phone

# --- Channel assignment setup ---
influencer_ids = list(range(1, 31))
channel_pool = []

# Strong influencers (3 influencers)
strong = [random.randint(45, 70) for _ in range(3)]
# Medium influencers (20 influencers)
medium = [random.randint(15, 25) for _ in range(20)]
# Weak influencers (7 influencers)
weak = [random.randint(3, 10) for _ in range(7)]

distribution = strong + medium + weak
random.shuffle(influencer_ids)

# Map influencer_ids to customer counts
channel_mapping = []
for influencer_id, count in zip(influencer_ids, distribution):
    channel_mapping.extend([influencer_id] * count)

# Adjust to exactly 630 influencer channels
if len(channel_mapping) < 630:
    remaining = 630 - len(channel_mapping)
    channel_mapping.extend(random.choices(influencer_ids, k=remaining))
elif len(channel_mapping) > 630:
    channel_mapping = channel_mapping[:630]

# Combine with -1 web channels and shuffle
channel_values = [-1] * 270 + channel_mapping
random.shuffle(channel_values)

# --- File writing ---
with open("../insert_customers.sql", "w", encoding="utf-8") as f:
    f.write("INSERT INTO customers (customer_name, customer_mail, customer_phone, customer_address, channel, since, is_account_deleted) VALUES\n")
    for i in range(NUM_CUSTOMERS):
        name = fake.name()
        email = generate_unique_email(name)
        phone = generate_unique_phone()
        address = fake.address().replace("\n", ", ")
        since = fake.date_between(start_date='-5y', end_date='today')
        channel = channel_values[i]
        is_deleted = False

        # Escape single quotes in address and name
        name = name.replace("'", "''")
        address = address.replace("'", "''")

        line = f"('{name}', '{email}', '{phone}', '{address}', {channel}, '{since}', {str(is_deleted).lower()})"
        line += ",\n" if i < NUM_CUSTOMERS - 1 else ";\n"
        f.write(line)

print("✔ insert_customers.sql has been generated with skewed influencer channel distribution.")
