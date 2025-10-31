create table customer_det(
c_id int auto_increment primary key,
c_name varchar (20) not null,
gst_no int not null,
city varchar(15) not null,
last_reading int not null
);

select * from customer_det;

USE result;
SHOW TABLES;


create table invoice(
invoice_no int primary key,
Date_in date not null,
c_name_ varchar(20) not null,
rent enum('Yes', 'No') not null,
rent_amt int not null,
free_copy enum('Yes', 'No'),
rate_per_copy int not null,
last_reads int not null,
current_read int not null,
net_read int as (current_read - last_reads) stored,
payable_amt int as (net_read - if(free_copy='Yes',rate_per_copy,0)) stored,
sub_total int as ((payable_amt * rate_per_copy) + rent_amt) stored,
tax enum('igst','cgst'),
total int
);
