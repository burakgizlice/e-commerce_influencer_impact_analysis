import random

NUM_CAMPAIGNS = 60
PRODUCT_IDS = list(range(1, 94))        # 93 products
INFLUENCER_IDS = list(range(1, 31))     # 30 influencers
USER_IDS = [12, 13, 14, 15, 16]

rows = []

for campaign_id in range(1, NUM_CAMPAIGNS + 1):
    influencers = random.sample(INFLUENCER_IDS, random.randint(4, 6))  # 4–6 influencers per campaign
    for influencer_id in influencers:
        num_products = random.randint(3, 7)  # 3–7 products per influencer
        product_ids = random.sample(PRODUCT_IDS, num_products)
        for product_id in product_ids:
            rows.append((product_id, influencer_id, campaign_id))

# Distribute user_ids evenly across rows
user_id_pool = USER_IDS * (len(rows) // len(USER_IDS))
user_id_pool += random.choices(USER_IDS, k=(len(rows) % len(USER_IDS)))
random.shuffle(user_id_pool)

# Prepare the SQL file
with open("../insert_arranges.sql", "w") as f:
    f.write("INSERT INTO arranges (product_id, influencer_id, user_id, campaign_id)\nVALUES\n")
    for i, (product_id, influencer_id, campaign_id) in enumerate(rows):
        user_id = user_id_pool[i]
        line = f"({product_id}, {influencer_id}, {user_id}, {campaign_id})"
        line += ",\n" if i < len(rows) - 1 else ";\n"
        f.write(line)

print(f"✔ Generated {len(rows)} rows and saved to insert_arranges.sql")
