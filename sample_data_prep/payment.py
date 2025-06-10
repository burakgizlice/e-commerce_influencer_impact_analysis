import csv
import random
from datetime import datetime, timedelta
from collections import defaultdict

INPUT_BUDGET_CSV = "budget.csv"
INPUT_PAIRS_CSV = "distinct_pairs.csv"
OUTPUT_SQL_FILE = "../insert_payment.sql"

STATUS_CHOICES = ['paid', 'to be paid']


def random_past_date():
    days_ago = random.randint(0, 365 * 2)  # within past 2 years
    return (datetime.now() - timedelta(days=days_ago)).strftime('%Y-%m-%d')


# Step 1: Load campaign budgets
campaign_budgets = {}
with open(INPUT_BUDGET_CSV, newline='') as f:
    reader = csv.reader(f, delimiter=',')
    next(reader)  # Skip header
    for row in reader:
        campaign_id = int(row[0].strip())
        budget = float(row[1].strip())
        campaign_budgets[campaign_id] = budget

# Step 2: Load influencer-campaign pairs
campaign_influencers = defaultdict(list)
with open(INPUT_PAIRS_CSV, newline='') as f:
    reader = csv.reader(f, delimiter=',')
    next(reader)  # Skip header
    for row in reader:
        influencer_id = int(row[0].strip())
        campaign_id = int(row[1].strip())
        campaign_influencers[campaign_id].append(influencer_id)

# Step 3: Generate payments
payment_rows = []

for campaign_id, influencers in campaign_influencers.items():
    if campaign_id not in campaign_budgets or not influencers:
        continue

    budget = campaign_budgets[campaign_id]
    weights = [random.random() for _ in influencers]
    total_weight = sum(weights)
    normalized_weights = [w / total_weight for w in weights]

    for influencer_id, weight in zip(influencers, normalized_weights):
        amount = round(budget * weight, 2)
        status = random.choice(STATUS_CHOICES)
        date = random_past_date()

        payment_rows.append((campaign_id, influencer_id, amount, status, date))

# Step 4: Write SQL file
with open(OUTPUT_SQL_FILE, "w") as f:
    f.write(
        "INSERT INTO payment (campaign_id, influencer_id, amount, status, date)\nVALUES\n")

    for i, row in enumerate(payment_rows):
        campaign_id, influencer_id, amount, status, date = row
        line = f"({campaign_id}, {influencer_id}, {amount:.2f}, '{status}', '{date}')"
        line += ",\n" if i < len(payment_rows) - 1 else ";\n"
        f.write(line)

print(f"✔ Generated {len(payment_rows)} payment rows in {OUTPUT_SQL_FILE}")
