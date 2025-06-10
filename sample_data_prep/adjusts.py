import random
from datetime import datetime, timedelta

NUM_PRODUCTS = 93
USER_IDS = [7, 8, 9, 10, 11]
FIELDS = ['stock_quantity', 'product_price', 'activity']

rows = []

def random_past_datetime():
    now = datetime.now()
    past = now - timedelta(days=random.randint(0, 730), seconds=random.randint(0, 86400))
    return past.strftime('%Y-%m-%d %H:%M:%S')

user_distribution = []

# Allow semi-fair user_id distribution
for _ in range(NUM_PRODUCTS * 2):
    user_distribution.append(random.choice(USER_IDS))
random.shuffle(user_distribution)

user_index = 0

for product_id in range(1, NUM_PRODUCTS + 1):
    num_adjustments = random.choice([2, 3])
    for _ in range(num_adjustments):
        field = random.choice(FIELDS)
        date_time = random_past_datetime()
        user_id = user_distribution[user_index % len(user_distribution)]
        user_index += 1

        if field == 'stock_quantity':
            old_value = random.randint(50, 200)
            new_value = old_value + random.randint(10, 100)

        elif field == 'product_price':
            old_value = round(random.uniform(50.0, 500.0), 2)
            change = random.uniform(-50.0, 100.0)
            new_value = max(0.0, round(old_value + change, 2))

        elif field == 'activity':
            if random.choice([True, False]):
                old_value, new_value = -1, 1  # activate
            else:
                old_value, new_value = 1, -1  # deactivate

        rows.append((user_id, product_id, date_time, field, old_value, new_value))

# Write to SQL file
with open("../insert_adjusts.sql", "w") as f:
    f.write("INSERT INTO adjusts (user_id, product_id, date_time, field, old_value, new_value)\nVALUES\n")
    for i, (user_id, product_id, date_time, field, old_value, new_value) in enumerate(rows):
        line = f"({user_id}, {product_id}, '{date_time}', '{field}', {old_value}, {new_value})"
        line += ",\n" if i < len(rows) - 1 else ";\n"
        f.write(line)

print(f"✔ Generated {len(rows)} adjustment logs in insert_adjusts.sql")
