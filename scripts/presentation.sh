#!/bin/bash
while true; do
	clear
	echo "======================================================================================================================="
	echo " TABLE HEADs (10 rows)"
	echo "======================================================================================================================="
	echo "+--------+-----------------+------------------------------------------------------------------------------------------+"
	echo "| Number | Query Name      | Description                                                                              |"
	echo "+--------+-----------------+------------------------------------------------------------------------------------------+"
	echo "| 1      | product HEAD    | Get first 10 rows of the product table, just to see the shape of data we are storing.    |"
	echo "| 2      | customer HEAD   | Get first 10 rows of the customer table, just to see the shape of data we are storing.   |"
	echo "| 3      | influencer HEAD | Get first 10 rows of the influencer table, just to see the shape of data we are storing. |"
	echo "| 4      | user_table HEAD | Get first 10 rows of the user table, just to see the shape of data we are storing.       |"
	echo "| 5      | campaign HEAD   | Get first 10 rows of the campaign table, just to see the shape of data we are storing.   |"
	echo "| 6      | arranges HEAD   | Get first 10 rows of the arranges table, just to see the shape of data we are storing.   |"
	echo "| 7      | adjusts HEAD    | Get first 10 rows of the adjusts table, just to see the shape of data we are storing.    |"
	echo "| 8      | bought_by HEAD  | Get first 10 rows of the bought_by table, just to see the shape of data we are storing.  |"
	echo "| 9      | liked_by HEAD   | Get first 10 rows of the liked_by table, just to see the shape of data we are storing.   |"
	echo "| 10     | payment HEAD    | Get first 10 rows of the liked_by table, just to see the shape of data we are storing.   |"
	echo "+--------+-----------------+------------------------------------------------------------------------------------------+"
	echo "======================================================================================================================="
	echo " Queries Related to Products"
	echo "======================================================================================================================="
	echo "+--------+----------------------------------+----------------------------------------------------------------------------------+"
	echo "| Number | Query Name                       | Description                                                                      |"
	echo "+--------+----------------------------------+----------------------------------------------------------------------------------+"
	echo "| 11     | A Product's Sales, Likes, Rating | Gets a products total sales, likes and the average rating value for the product. |"
	echo "| 12     | Top Selling Products             | Gets product information ordered by most sold to the least popular.              |"
	echo "| 13     | Most Liked Products              | Lists all products ordered by the number of likes they received.                 |"
	echo "| 14     | Most Popular Categories          | Displays product categories ranked by total sales volume.                        |"
	echo "| 15     | Most Satisfying Products         | Lists products with an average rating above 3, sorted by satisfaction.           |"
	echo "| 16     | Lowest Rated Products            | Lists products with an average rating below 3, sorted from worst to better.      |"
	echo "+--------+----------------------------------+----------------------------------------------------------------------------------+"
	echo "======================================================================================================================="
	echo " Queries Related to Users"
	echo "======================================================================================================================="
	echo "+--------+-----------------------------+----------------------------------------------------------------+"
	echo "| Number | Query Name                  | Description                                                    |"
	echo "+--------+-----------------------------+----------------------------------------------------------------+"
	echo "| 17     | Product Manager Adjustments | Counts how many product adjustments each product manager made. |"
	echo "| 18     | Campaign Manager Creations  | Shows how many campaigns each campaign manager has created.    |"
	echo "| 19     | User Role Distribution      | Displays how many users exist in each role, ordered by count.  |"
	echo "+--------+-----------------------------+----------------------------------------------------------------+"
	echo "======================================================================================================================="
	echo " Queries Related to Payments"
	echo "======================================================================================================================="
	echo "+--------+-----------------------------------------+------------------------------------------------------------------------------------------------------+"
	echo "| Number | Query Name                              | Description                                                                                          |"
	echo "+--------+-----------------------------------------+------------------------------------------------------------------------------------------------------+"
	echo "| 20     | Influencer Returns vs Earnings          | Shows how many returns are associated with each influencer and their total payments.                 |"
	echo "| 21     | Top Seller Influencers vs Earnings      | Shows influencers ranked by total product sales along with their total payment amounts.              |"
	echo "| 22     | Influencer Reach vs Earnings            | Ranks influencers by how many customers they attracted and their total earnings.                     |"
	echo "| 23     | Influencer Payments and Campaign Budget | Shows the payments made to the selected influencer, their outstanding debt, and the campaign budget. |"
	echo "| 24     | Top 10 Largest Payments                 | Shows the top 10 largest single payments made to influencers.                                        |"
	echo "+--------+-----------------------------------------+------------------------------------------------------------------------------------------------------+"
	echo "======================================================================================================================="
	echo " Queries Related to Influencers"
	echo "======================================================================================================================="
	echo "+--------+---------------------------------------------+---------------------------------------------------------------------------------------------------------+"
	echo "| Number | Query Name                                  | Description                                                                                             |"
	echo "+--------+---------------------------------------------+---------------------------------------------------------------------------------------------------------+"
	echo "| 25     | Influencer Annual Sales Performance         | Analyzes the total annual sales for each influencer.                                                    |"
	echo "| 26     | Influencer-based User Acquisition by Year   | Shows the number of users acquired by each influencer, grouped by year.                                 |"
	echo "| 27     | Influencer with the Highest Return Rate     | Shows the return rates of influencers, ordered by the highest return rate.                              |"
	echo "| 28     | Influencer with the Lowest Average Ratings  | Shows the influencers with the lowest average ratings, ordered from lowest to highest.                  |"
	echo "| 29     | Platform Influencer with the Most Customers | Shows the influencers on each platform ranked by the total number of customers they have brought.       |"
	echo "| 30     | Most Active Influencer in Advertising       | Identifies the influencer with the most campaign and product arrangements, representing total activity. |"
	echo "+--------+---------------------------------------------+---------------------------------------------------------------------------------------------------------+"
	echo "======================================================================================================================="
	echo " Queries Related to Campaigns"
	echo "======================================================================================================================="
	echo "+--------+---------------------------------+----------------------------------------------------------------------------------+"
	echo "| Number | Query Name                      | Description                                                                      |"
	echo "+--------+---------------------------------+----------------------------------------------------------------------------------+"
	echo "| 31     | Top 10 Campaigns by Budget      | Lists the top 10 campaigns with the highest allocated budget.                    |"
	echo "| 32     | Active Campaigns                | Lists top 10 ongoing campaigns without an end date, ordered by budget.           |"
	echo "| 33     | Selected Campaign Payments      | Shows influencer payments for a specific campaign (ID = 5).                      |"
	echo "| 34     | Campaigns Fully Paid            | Lists campaigns where all influencer payments are marked as 'paid'.              |"
	echo "| 35     | Campaigns with Pending Payments | Fetches campaigns with 'to be paid' status and the total amount pending payment. |"
	echo "+--------+---------------------------------+----------------------------------------------------------------------------------+"
	echo "======================================================================================================================="
	echo " Queries Related to Customers"
	echo "======================================================================================================================="
	echo "+--------+--------------------------------------------------+------------------------------------------------------------------------------------------------------------------+"
	echo "| Number | Query Name                                       | Description                                                                                                      |"
	echo "+--------+--------------------------------------------------+------------------------------------------------------------------------------------------------------------------+"
	echo "| 36     | Customer Count by Platform and Year              | Gets the count of customers per platform per year, showing if they came via influencer or directly.              |"
	echo "| 37     | Customer Top Spenders                            | Gets the list of top customers by total spent, considering only delivered orders.                                |"
	echo "| 38     | Deleted Customer Accounts                        | Gets the list of customers whose accounts are deleted, showing their details and account creation date.          |"
	echo "| 39     | Most Deleted Customers associated to Influencers | Gets the influencer who has the most deleted customers, showing their platform and total deleted customer count. |"
	echo "| 40     | Customer Liker Who Likes But Never Buys          | Gets the customer who liked products but has never made a purchase. - FAKIR                                      |"
	echo "+--------+--------------------------------------------------+------------------------------------------------------------------------------------------------------------------+"


	echo -e "\nChoose 'q' for leaving.\n"
	read -p "Enter choice: " choice

	case $choice in
		 1) clear && psql -U postgres -d influencer_analysis -f queries/head_product.sql;;
		 2) clear && psql -U postgres -d influencer_analysis -f queries/head_customer.sql;;
		 3) clear && psql -U postgres -d influencer_analysis -f queries/head_influencer.sql;;
		 4) clear && psql -U postgres -d influencer_analysis -f queries/head_user_table.sql;;
		 5) clear && psql -U postgres -d influencer_analysis -f queries/head_campaign.sql;;
		 6) clear && psql -U postgres -d influencer_analysis -f queries/head_arranges.sql;;
		 7) clear && psql -U postgres -d influencer_analysis -f queries/head_adjusts.sql;;
		 8) clear && psql -U postgres -d influencer_analysis -f queries/head_bought_by.sql;;
		 9) clear && psql -U postgres -d influencer_analysis -f queries/head_liked_by.sql;;
		10) clear && psql -U postgres -d influencer_analysis -f queries/head_payment.sql;;
		11) clear && psql -U postgres -d influencer_analysis -f queries/product_sale_like_rating.sql;;
		12) clear && psql -U postgres -d influencer_analysis -f queries/product_most_sold.sql;;
		13) clear && psql -U postgres -d influencer_analysis -f queries/product_most_liked.sql;;
		14) clear && psql -U postgres -d influencer_analysis -f queries/product_category_most_sold.sql;;
		15) clear && psql -U postgres -d influencer_analysis -f queries/product_top_rated.sql;;
		16) clear && psql -U postgres -d influencer_analysis -f queries/product_lowest_rated.sql;;
		17) clear && psql -U postgres -d influencer_analysis -f queries/user_adjustments.sql;;
		18) clear && psql -U postgres -d influencer_analysis -f queries/user_campaign_manager_creations.sql;;
		19) clear && psql -U postgres -d influencer_analysis -f queries/user_role_distribution.sql;;
		20) clear && psql -U postgres -d influencer_analysis -f queries/payment_influencer_returns_vs_earnings.sql;;
		21) clear && psql -U postgres -d influencer_analysis -f queries/payment_influencer_sales_vs_earnings.sql;;
		22) clear && psql -U postgres -d influencer_analysis -f queries/payment_influencer_customers_vs_earnings.sql;;
		23) clear && psql -U postgres -d influencer_analysis -f queries/payment_influencer_payments_and_campaign_budget.sql;;
		24) clear && psql -U postgres -d influencer_analysis -f queries/payment_top_10_largest_payments.sql;;
		25) clear && psql -U postgres -d influencer_analysis -f queries/influencer_annual_sales_performance.sql;;
		26) clear && psql -U postgres -d influencer_analysis -f queries/influencer_user_acquisition_by_year.sql;;
		27) clear && psql -U postgres -d influencer_analysis -f queries/influencer_highest_return_rates.sql;;
		28) clear && psql -U postgres -d influencer_analysis -f queries/influencer_lowest_average_ratings.sql;;
		29) clear && psql -U postgres -d influencer_analysis -f queries/influencer_platform_most_customers.sql;;
		30) clear && psql -U postgres -d influencer_analysis -f queries/influencer_most_active_advertising.sql;;
		31) clear && psql -U postgres -d influencer_analysis -f queries/campaign_top_budget.sql;;
		32) clear && psql -U postgres -d influencer_analysis -f queries/campaign_active_campaigns.sql;;
		33) clear && psql -U postgres -d influencer_analysis -f queries/campaign_influencer_payments.sql;;
		34) clear && psql -U postgres -d influencer_analysis -f queries/campaign_all_paid.sql;;
		35) clear && psql -U postgres -d influencer_analysis -f queries/campaign_to_be_paid.sql;;
		36) clear && psql -U postgres -d influencer_analysis -f queries/customer_platform_yearly_count.sql;;
		37) clear && psql -U postgres -d influencer_analysis -f queries/customer_top_spenders.sql;;
		38) clear && psql -U postgres -d influencer_analysis -f queries/customer_deleted_accounts.sql;;
		39) clear && psql -U postgres -d influencer_analysis -f queries/customer_deleted_influencer_accounts.sql;;
		40) clear && psql -U postgres -d influencer_analysis -f queries/customer_liker_no_purchase.sql;;
		q) echo "Good bye!"; break;;
		*) echo "invalid option";;
	esac
	read -p ""
done
