/*creating database tiide*/
CREATE DATABASE  tiide;

/*selecting tiide database*/
USE tiide;

/*create users table if not exists*/
CREATE TABLE IF NOT EXISTS users (
    id INT auto_increment PRIMARY KEY,
    first_name VARCHAR(32),
    last_name VARCHAR(32)
);

/*batching inseting into users table*/
insert into users(first_name,last_name) values 
("sola","pale"),
("bola","bale"),
("kola","sale"),
("dola","kale"),
("cola","rale");


/*create accounts table if not exists*/
create table accounts(
	id int auto_increment primary key,
	account_number varchar(12),
	balance decimal(18,2),
	user_id int,
	foreign key(user_id) references users(id)	
);

/* batch inserting values into accounts table*/
insert into accounts(user_id,account_number,balance) values
(1,"234455",5000000.22),
(5,"354532",5000000.22),
(3,"100234436",8900000.99);

/*create transactionType table if not exists*/
create table IF NOT EXISTS transactionTypes (
    id int AUTO_INCREMENT PRIMARY key,
    type varchar(32)
);

/*batching inseting into transaction table*/
insert into transactionTypes(type) VALUES("debit") ,("credit");

/*create transaction table if not exists*/
create table IF NOT EXISTS transactions (
    id int AUTO_INCREMENT PRIMARY key,
    transaction_type int,
    amount decimal(18,2),
    user_id int,   
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN key (transaction_type) REFERENCES transactionTypes(id)
);

/*batching inseting into transaction table*/
insert into transactions(transaction_type,amount,user_id) VALUES 
(1,50000,4),
(2,4556667,5),
(2,3455555,3),
(1,2334556,3),
(1,3345555.44,1),
(2,40000000,2),
(1,545000,1),
(2,344555.23,2),
(2,273884.34,4),
(1,55344.34,5);

/*querying the database for the name of the user account_number and transaction done*/
SELECT first_name,last_name,account_number,amount,transactionTypes.type from users
JOIN accounts ON users.id=accounts.user_id
JOIN transactions ON users.id = transactions.user_id
JOIN transactionTypes ON transactionTypes.id=transactions.transaction_type;
