-- Users
insert into users values (1, 'blk 123', 'bob', false);
insert into users values (2, 'blk 456', 'peter', true);
/*
 id | address | name  | account_closed 
----+---------+-------+----------------
  1 | blk 123 | bob   | f
  2 | blk 456 | peter | t
*/

-- Employee
insert into employee values (1, 'alex', 2000);
insert into employee values (2, 'tim', 2200);
/*
 id | name  | salary
----+-------+--------
  1 | bob   |  	2000
  2 | peter | 	2200
*/

-- Shop
insert into shop values (1,'shop1');
insert into shop values (2, 'shop2');
/*
 id | name
----+-------
  1 | shop1
  2 | shop2
*/

-- Category
insert into category values (1, 'electronics', NULL);
insert into category values (2, 'laptops', 1);
/*
 id |    name     | parent 
----+-------------+--------
  1 | electronics |  NULL     
  2 | laptops     |   1
*/

-- Manufacturer
insert into manufacturer values (1,'Electronics Maker Pte Ltd', 'China');
/*
 id |           name            | country 
----+---------------------------+---------
  1 | Electronics Maker Pte Ltd | China
*/

-- Product
insert into product values
(1, 'Macbook', 'Its an apple computer', 2, 1);

insert into product values
(2, 'Lenovo Yoga', 'Its a windows computer', 2, 1);
/*
 id |  name       |     description   	   | category | manufacturer 
----+-------------+------------------------+----------+--------------
  1 | Macbook     | Its an apple computer  |        2 |            1
  2 | Lenovo Yoga | Its a windows computer |        2 |			   1	
*/

-- Sells
insert into sells values (1, 1, '2022-03-23 10:10:10', 3000, 100);
insert into sells values (2, 2, '2022-03-23 10:10:10', 2000, 200);
/*
 shop_id | product_id |   sell_timestamp    | price | quantity 
---------+------------+---------------------+-------+----------
       1 |          1 | 2022-03-23 10:10:10 |  3000 |       100
	   2 |          2 | 2022-03-23 10:10:10 |  2000 |       200
*/

-- coupon_batch
insert into coupon_batch(id) values(1);
insert into coupon_batch(id) values(2);

/*
 	id   
----------
    1 
	2 
*/

-- issued_coupon
insert into issued_coupon values (1,1);
insert into issued_coupon values (2,2);
/*
 user_id | coupon_id 
---------+-----------
       1 |          1
	   2 |          2
*/

-- orders
insert into orders values (1, 1, 1, 'blk 123', 2000);
insert into orders values (2, 2, 2, 'blk 456', 2000);
/*
 id | user_id | coupon_id | shipping_address | payment_amount 
----+---------+-----------+------------------+----------------
  1 |       1 |         1 | blk 123          |           2000
  2 |       2 |         2 | blk 456          |           2000
*/

-- orderline
insert into orderline values (1, 1, 1, '2022-03-23 10:10:10', 1, 0, 'delivered', '2022-03-24');
insert into orderline values (2, 1, 1, '2022-03-23 10:10:10', 1, 0, 'shipped', '2022-04-01');
/*
 order_id | shop_id | product_id |   sell_timestamp    | quantity | shipping_cost |  status   | delivery_date 
----------+---------+------------+---------------------+----------+---------------+-----------+---------------
        1 |       1 |          1 | 2022-03-23 10:10:10 |        1 |             0 | delivered | 2022-03-24
        2 |       1 |          1 | 2022-03-23 10:10:10 |        1 |             0 | shipped   | 2022-04-01
*/

-- complaint
insert into complaint
values (1, 'COMPLAIN buaysong', 'pending', 1, NULL);

insert into complaint
values (2, 'testing multiple complaints', 'addressed', 1, 1);
/*
 id |           content           | status   | user_id | handled_by 
----+-----------------------------+----------+---------+------------
  1 | COMPLAIN buaysong           | pending  |       1 |        NULL
  2 | testing multiple complaints | addressed|       1 |       	1
*/

-- comment
insert into comment values (1,1);
insert into comment values (2,2);
insert into comment values (3,2);
insert into comment values (4,1);
/*
 id | user_id 
----+---------
  1 |       1
  2 |       2
  3 |       2 (reply)
  4 |       1 (reply)
*/

-- review
insert into review values (1, 1, 1, 1, '2022-03-23 10:10:10');
insert into review values (2, 2, 1, 1, '2022-03-23 10:10:10');
/*
 id | order_id | shop_id | product_id |   sell_timestamp    
----+----------+---------+------------+---------------------
  1 |        1 |       1 |          1 | 2022-03-23 10:10:10
  2 |        2 |       1 |          1 | 2022-03-23 10:10:10
*/

-- review_version
insert into review_version values (1, '2022-03-25 12:12:12', 'this is a review.', 3);
insert into review_version values (2, '2022-04-04 12:12:12', 'BEST PRODUCT EVERRR.', 5);
/*
 review_id |  review_timestamp   |       content        | rating 
-----------+---------------------+----------------------+--------
         1 | 2022-03-25 12:12:12 | this is a review.    |      3
         2 | 2022-04-04 12:12:12 | BEST PRODUCT EVERRR. |      5
*/

-- reply
insert into reply values (3, 1);
insert into reply values (4, 3);
/*
 id | other_comment_id 
----+------------------
  3 |                1
  4 |                3
*/

-- reply_version
insert into reply_version values (3, '2022-03-25 18:18:18', 'useless review!');
insert into reply_version values (4, '2022-03-25 20:01:05', 'blablabla');
/*
 reply_id |   reply_timestamp   |     content     
----------+---------------------+-----------------
        3 | 2022-03-25 18:18:18 | useless review!
        4 | 2022-03-25 20:01:05 | blablabla
*/

-- delivery_complaint
insert into delivery_complaint
values (1, 1, 1, 1, '2022-03-23 10:10:10');
/*
 id | order_id | shop_id | product_id |   sell_timestamp    
----+----------+---------+------------+---------------------
  1 |        1 |       1 |          1 | 2022-03-23 10:10:10
*/

-- shop_complaint
insert into shop_complaint
values (2, 1);
/*
 id | shop_id 
----+---------
  2 |       1
*/


-- /*setup*/
-- BEGIN TRANSACTION;
-- insert into shop (id, name)
-- values (20, 'shop2');
-- insert into sells(shop_id, product_id, sell_timestamp, price, quantity)
-- values (20, 1, '2022-03-24 14:29:17', 5, 10);
-- COMMIT;

-- /*Trigger1 test */
-- BEGIN TRANSACTION;
-- insert into shop (id, name)
-- values (30, 'shop3');
-- insert into sells (shop_id, product_id, sell_timestamp, price, quantity)
-- values (1, 1, '2022-03-24 14:29:17', 10000, 10);
-- COMMIT;

-- /*Trigger2 test*/
-- BEGIN TRANSACTION;
-- insert into orders (id, user_id, shipping_address, payment_amount)
-- values (1002, 1, 'blk 123', 30000);
-- insert into orderline (order_id, shop_id, product_id, sell_timestamp, quantity, shipping_cost,
-- 					  status)
-- values (1, 20, 1, '2022-03-24 14:29:17', 1, 1, 'being_processed');
-- COMMIT;

-- /*Trigger3 test*/
-- BEGIN TRANSACTION;
-- insert into orders (id, user_id, coupon_id, shipping_address, payment_amount)
-- values (1002, 1, 1, 'blk 123', 30000);
-- insert into orderline (order_id, shop_id, product_id, sell_timestamp, quantity, shipping_cost,
-- 					  status)
-- values (1002, 20, 1, '2022-03-24 14:29:17', 1, 1, 'being_processed');
-- COMMIT;

-- /*Trigger12 test*/
-- BEGIN TRANSACTION;
-- insert into complaint (id, content, status, user_id) values (3, 'test', 'pending', 1);
-- insert into comment_complaint values (3, 1);
-- COMMIT;

-- BEGIN TRANSACTION;
-- insert into complaint (id, content, status, user_id) values (4, 'test', 'pending', 1);
-- COMMIT;

-- /*Function1 test*/
-- SELECT view_comments(1, 1, '2022-03-23 10:10:10');
