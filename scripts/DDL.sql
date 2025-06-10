/*
===============================================================================
DDL Script: Create Project Tables and Schema Objects
===============================================================================
Script Purpose:
    This script defines the full schema for the DBMS course project.
    It includes creation of ENUM types, all necessary tables, constraints,
    and a trigger to maintain product stock and sales upon purchase.
    
    The script is safe to re-run as it first drops existing objects (if any),
    ensuring a clean slate for schema setup.

    Run this script to (re)initialize the database structure for the project.
===============================================================================
*/

-- ===== Cleanup Section =====
DROP TRIGGER IF EXISTS trg_update_product_after_order ON bought_by;
DROP FUNCTION IF EXISTS update_product_on_order();

DROP TABLE IF EXISTS payment CASCADE;
DROP TABLE IF EXISTS liked_by CASCADE;
DROP TABLE IF EXISTS bought_by CASCADE;
DROP TABLE IF EXISTS adjusts CASCADE;
DROP TABLE IF EXISTS arranges CASCADE;
DROP TABLE IF EXISTS campaign CASCADE;
DROP TABLE IF EXISTS user_table CASCADE;
DROP TABLE IF EXISTS influencer CASCADE;
DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS product CASCADE;

DROP TYPE IF EXISTS payment_status_enum;
DROP TYPE IF EXISTS bought_status_enum;
DROP TYPE IF EXISTS adjust_field_enum;
DROP TYPE IF EXISTS user_role_enum;

-- ===== Schema Creation Begins =====
BEGIN;

-- ENUM TYPES
CREATE TYPE user_role_enum AS ENUM (
    'Analyst', 
    'Product Manager', 
    'Campaign Manager', 
    'Influencer Manager', 
    'Finance Manager', 
    'Admin'
);

CREATE TYPE adjust_field_enum AS ENUM (
    'stock_quantity', 
    'product_price',
    'activity'
);

CREATE TYPE bought_status_enum AS ENUM (
    'delivered', 
    'returned',
    'shipped'
);

CREATE TYPE payment_status_enum AS ENUM (
    'paid',
    'to be paid'
);

-- PRODUCTS
CREATE TABLE product(
    product_id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(100) NOT NULL,
    stock_quantity INTEGER NOT NULL CHECK (stock_quantity >= 0),
    category VARCHAR(100) NOT NULL,
    sale_quantity INTEGER NOT NULL CHECK (sale_quantity >= 0),
    description TEXT,
    product_price DOUBLE PRECISION NOT NULL CHECK (product_price >= 0),
    on_sale BOOLEAN NOT NULL
);
COMMENT ON TABLE product IS 'Stores product listings';
COMMENT ON COLUMN product.product_price IS 'Price in double precision';
COMMENT ON COLUMN product.on_sale IS 'Indicates whether the product is currently on sale';

-- CUSTOMERS
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY NOT NULL,
    customer_name VARCHAR(50) NOT NULL,
    customer_mail VARCHAR(255) NOT NULL UNIQUE,
    customer_phone VARCHAR(15) NOT NULL UNIQUE,
    customer_address TEXT NOT NULL,
    channel INTEGER DEFAULT -1,
    since DATE NOT NULL CHECK (since <= CURRENT_DATE),
    is_account_deleted BOOLEAN NOT NULL
);
COMMENT ON TABLE customer IS 'Represents platform customers';

-- INFLUENCERS
CREATE TABLE influencer(
    influencer_id SERIAL PRIMARY KEY NOT NULL,
    influencer_name VARCHAR(50) NOT NULL,
    platform VARCHAR(50) NOT NULL,
    follower_count INTEGER NOT NULL CHECK (follower_count >= 0),
    clicked_number INTEGER NOT NULL CHECK (clicked_number >= 0),
    category VARCHAR(100) NOT NULL,
    influencer_mail VARCHAR(255) NOT NULL UNIQUE,
    still_partner BOOLEAN NOT NULL,
    member_since DATE NOT NULL CHECK (member_since <= CURRENT_DATE)
);
COMMENT ON TABLE influencer IS 'Stores influencer info and performance metrics';

-- USERS
CREATE TABLE user_table(
    user_id SERIAL PRIMARY KEY NOT NULL,
    user_role user_role_enum NOT NULL,
    user_mail VARCHAR(255) NOT NULL UNIQUE,
    user_name VARCHAR(50) NOT NULL,
    user_password VARCHAR(100) NOT NULL,
    is_active BOOLEAN NOT NULL,
    member_since DATE NOT NULL CHECK (member_since <= CURRENT_DATE)
);
COMMENT ON TABLE user_table IS 'Represents platform users with assigned roles';

-- CAMPAIGNS
CREATE TABLE campaign(
    campaign_id SERIAL PRIMARY KEY NOT NULL,
    campaign_name VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL CHECK (start_date <= end_date),
    end_date DATE,
    budget NUMERIC(10,2) NOT NULL CHECK (budget >= 0)
);
COMMENT ON TABLE campaign IS 'Stores marketing campaign metadata';

-- ARRANGES
CREATE TABLE arranges(
    product_id INTEGER NOT NULL,
    influencer_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    campaign_id INTEGER NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE,
    FOREIGN KEY (influencer_id) REFERENCES influencer(influencer_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user_table(user_id) ON DELETE CASCADE,
    FOREIGN KEY (campaign_id) REFERENCES campaign(campaign_id) ON DELETE CASCADE
);
COMMENT ON TABLE arranges IS 'Junction table for assigning products to influencers via campaigns';

-- ADJUSTS
CREATE TABLE adjusts(
    user_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    date_time TIMESTAMP NOT NULL CHECK (date_time <= CURRENT_TIMESTAMP),
    field adjust_field_enum NOT NULL,	
    old_value DOUBLE PRECISION NOT NULL CHECK (old_value >= -1),
    new_value DOUBLE PRECISION NOT NULL CHECK (new_value >= -1),
    FOREIGN KEY (user_id) REFERENCES user_table(user_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
);
COMMENT ON TABLE adjusts IS 'Tracks manual field adjustments on product records';

-- BOUGHT BY
CREATE TABLE bought_by(
    product_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    status bought_status_enum NOT NULL,
    channel INTEGER DEFAULT -1,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    quantity INTEGER CHECK (quantity > 0),
    bought_date DATE CHECK (bought_date <= CURRENT_DATE),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
);
COMMENT ON TABLE bought_by IS 'Records purchases between customers and products';

-- LIKED BY
CREATE TABLE liked_by(
    customer_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    channel INTEGER DEFAULT -1,
    liked_date DATE CHECK (liked_date <= CURRENT_DATE),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
);
COMMENT ON TABLE liked_by IS 'Records product likes by customers';

-- PAYMENT
CREATE TABLE payment(
    campaign_id INTEGER NOT NULL,
    influencer_id INTEGER NOT NULL,
    amount NUMERIC(10,2) NOT NULL CHECK (amount >= 0),
    status payment_status_enum NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (influencer_id) REFERENCES influencer(influencer_id) ON DELETE CASCADE,
    FOREIGN KEY (campaign_id) REFERENCES campaign(campaign_id) ON DELETE CASCADE
);
COMMENT ON TABLE payment IS 'Tracks payments made to influencers for campaigns';

-- TRIGGER FUNCTION
CREATE OR REPLACE FUNCTION update_product_on_order()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE product
    SET
        stock_quantity = stock_quantity - NEW.quantity,
        sale_quantity = sale_quantity + NEW.quantity
    WHERE product_id = NEW.product_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
COMMENT ON FUNCTION update_product_on_order IS 'Updates product stock and sales when an order is placed';

-- TRIGGER
CREATE TRIGGER trg_update_product_after_order
AFTER INSERT ON bought_by
FOR EACH ROW
WHEN (NEW.quantity IS NOT NULL AND NEW.product_id IS NOT NULL)
EXECUTE FUNCTION update_product_on_order();

COMMIT;