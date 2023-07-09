drop table Driver;
drop table Customer;
drop table Admin;
drop table bookings;
drop table Data;
drop table Login;


create table Admin(
	CustomerInfo int,
    DriverInfo int,
	admin_id int not null unique auto_increment,
    Admin_Name char(50) not null,
    Address char(100),
    Phone_Number varchar(100) not null unique,
    EmailID varchar(500) not null unique,
    primary key(admin_id)
);
alter table Admin auto_increment = 1001;


create table Driver(
	CurrentState BOOLEAN NOT NULL,
	driver_id int not null unique auto_increment,
    Driver_Name varchar(20) not null,
    Phone_Number varchar(15) unique,
    Car_Model varchar(100) not null,
    Car_number char(50) not null,
    licence_number VARCHAR(20) not null,
    EmailID varchar(100) not null unique,
    Password varchar(100) not null,
    primary key (driver_id)
);
alter table Driver auto_increment = 8001;

create table Customer(
	PickupID int,
	customer_id int not null unique auto_increment,
    Customer_Name varchar (50) not null,
    Phone_Number varchar (15) not null unique,
    Past_Trips varchar(1000),
    EmailID varchar(50) not null,
    Pending_charges varchar(100),
    Password varchar(100) not null,
    primary key(customer_id)
);
alter table Customer auto_increment = 3001;


create table Login(
    Password varchar(100) not null unique,
    UniqueID int not null unique,
    ValID int
);

create table location_data(
  location_id INT AUTO_INCREMENT PRIMARY KEY,
  location_name VARCHAR(50) NOT NULL,
  added_by_admin_id INT NOT NULL,
  FOREIGN KEY (added_by_admin_id) REFERENCES admin(admin_id)
);

create table bookings(
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  driver_id INT NOT NULL,
  pickup_location_id INT NOT NULL,
  dropoff_location_id INT NOT NULL,
  pickup_time DATETIME NOT NULL,
  fare INT NOT NULL,
  payment_method VARCHAR(20) NOT NULL,
  status ENUM('Active', 'Completed', 'Cancelled') NOT NULL DEFAULT 'Active',
  cancel_time DATETIME NULL,
  rating INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (driver_id) REFERENCES driver(driver_id),
  FOREIGN KEY (pickup_location_id) REFERENCES location_data(location_id),
  FOREIGN KEY (dropoff_location_id) REFERENCES location_data(location_id)
);



alter table Data add foreign key(SerialNO) references Admin(admin_id);
alter table Data add foreign key(SerialNO) references Customer(customer_id);
alter table Data add foreign key(SerialNO) references Driver(driver_id);
alter table bookings add foreign key (CustomerID_Trips) references Customer(customer_id);
alter table Driver add foreign key (PassengerID) references Customer(customer_id);
alter table Admin add foreign key(CustomerInfo) references Customer(customer_id);
alter table Admin add foreign key(DriverInfo) references Driver(driver_id);
alter table Login add foreign key(ValID) references Driver(driver_id);
alter table Login add foreign key(ValID) references Customer(customer_id);
alter table Login add foreign key(ValID) references Admin(admin_id);

insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (1, 1, 1, 1, 1, '2022-09-20', 247, 'online', 'Completed', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (2, 2, 2, 2, 2, '2022-12-24', 177, 'cash', 'Active', null, 0);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (3, 3, 3, 3, 3, '2022-12-26', 214, 'cash', 'Completed', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (4, 4, 4, 4, 4, '2022-10-30', 287, 'online', 'Completed', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (5, 5, 5, 5, 5, '2022-04-23', 149, 'online', 'Active', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (6, 6, 6, 6, 6, '2022-11-08', 10, 'online', 'Completed', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (7, 7, 7, 7, 7, '2022-12-01', 284, 'online', 'Active', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (8, 8, 8, 8, 8, '2022-12-12', 64, 'online', 'Cancelled', null, 2);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (9, 9, 9, 9, 9, '2022-02-17', 275, 'cash', 'Completed', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (10, 10, 10, 10, 10, '2023-02-14', 244, 'cash', 'Completed', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (11, 11, 11, 11, 11, '2022-11-08', 32, 'online', 'Cancelled', null, 0);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (12, 12, 12, 12, 12, '2022-11-23', 284, 'online', 'Active', null, 0);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (13, 13, 13, 13, 13, '2022-06-27', 188, 'online', 'Completed', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (14, 14, 14, 14, 14, '2022-06-27', 10, 'online', 'Completed', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (15, 15, 15, 15, 15, '2022-07-18', 250, 'online', 'Active', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (16, 16, 16, 16, 16, '2022-09-03', 142, 'cash', 'Completed', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (17, 17, 17, 17, 17, '2022-11-01', 94, 'cash', 'Completed', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (18, 18, 18, 18, 18, '2022-09-03', 71, 'online', 'Completed', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (19, 19, 19, 19, 19, '2022-12-05', 78, 'cash', 'Active', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (20, 20, 20, 20, 20, '2022-05-13', 191, 'cash', 'Completed', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (21, 21, 21, 21, 21, '2022-05-13', 202, 'cash', 'Completed', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (22, 22, 22, 22, 22, '2022-06-23', 152, 'online', 'Cancelled', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (23, 23, 23, 23, 23, '2023-02-02', 206, 'online', 'Active', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (24, 24, 24, 24, 24, '2022-07-28', 195, 'online', 'Active', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (25, 25, 25, 25, 25, '2022-06-19', 264, 'cash', 'Active', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (26, 26, 26, 26, 26, '2022-11-16', 38, 'cash', 'Cancelled', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (27, 27, 27, 27, 27, '2022-08-07', 231, 'cash', 'Completed', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (28, 28, 28, 28, 28, '2022-06-16', 80, 'cash', 'Completed', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (29, 29, 29, 29, 29, '2022-05-03', 172, 'cash', 'Cancelled', null, 2);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (30, 30, 30, 30, 30, '2022-10-10', 10, 'online', 'Completed', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (31, 31, 31, 31, 31, '2023-02-16', 103, 'cash', 'Completed', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (32, 32, 32, 32, 32, '2022-04-21', 168, 'online', 'Active', null, 2);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (33, 33, 33, 33, 33, '2022-06-20', 85, 'online', 'Active', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (34, 34, 34, 34, 34, '2022-02-21', 194, 'cash', 'Active', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (35, 35, 35, 35, 35, '2022-12-31', 295, 'cash', 'Cancelled', null, 2);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (36, 36, 36, 36, 36, '2023-01-05', 284, 'cash', 'Active', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (37, 37, 37, 37, 37, '2022-08-20', 141, 'online', 'Completed', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (38, 38, 38, 38, 38, '2022-03-04', 101, 'cash', 'Completed', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (39, 39, 39, 39, 39, '2022-07-13', 107, 'online', 'Cancelled', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (40, 40, 40, 40, 40, '2022-06-27', 74, 'online', 'Active', null, 0);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (41, 41, 41, 41, 41, '2022-10-14', 139, 'online', 'Completed', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (42, 42, 42, 42, 42, '2022-12-20', 133, 'cash', 'Active', null, 0);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (43, 43, 43, 43, 43, '2023-02-14', 283, 'cash', 'Active', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (44, 44, 44, 44, 44, '2022-12-07', 62, 'cash', 'Completed', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (45, 45, 45, 45, 45, '2022-04-28', 53, 'online', 'Active', null, 0);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (46, 46, 46, 46, 46, '2022-12-14', 33, 'cash', 'Completed', null, 2);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (47, 47, 47, 47, 47, '2023-01-22', 59, 'cash', 'Cancelled', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (48, 48, 48, 48, 48, '2023-02-08', 296, 'cash', 'Completed', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (49, 49, 49, 49, 49, '2023-01-31', 288, 'cash', 'Cancelled', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (50, 50, 50, 50, 50, '2023-01-25', 176, 'cash', 'Cancelled', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (51, 51, 51, 51, 51, '2022-03-15', 19, 'online', 'Completed', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (52, 52, 52, 52, 52, '2022-12-13', 292, 'online', 'Completed', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (53, 53, 53, 53, 53, '2022-10-07', 236, 'online', 'Active', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (54, 54, 54, 54, 54, '2022-09-27', 224, 'cash', 'Cancelled', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (55, 55, 55, 55, 55, '2022-10-13', 254, 'cash', 'Active', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (56, 56, 56, 56, 56, '2022-02-15', 259, 'cash', 'Active', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (57, 57, 57, 57, 57, '2022-08-12', 30, 'cash', 'Active', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (58, 58, 58, 58, 58, '2022-12-11', 134, 'online', 'Active', null, 2);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (59, 59, 59, 59, 59, '2022-10-27', 238, 'cash', 'Completed', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (60, 60, 60, 60, 60, '2022-05-10', 199, 'cash', 'Completed', null, 2);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (61, 61, 61, 61, 61, '2022-03-20', 176, 'online', 'Completed', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (62, 62, 62, 62, 62, '2023-02-03', 38, 'online', 'Cancelled', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (63, 63, 63, 63, 63, '2022-11-08', 277, 'online', 'Cancelled', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (64, 64, 64, 64, 64, '2022-12-17', 253, 'online', 'Active', null, 0);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (65, 65, 65, 65, 65, '2022-07-15', 185, 'cash', 'Active', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (66, 66, 66, 66, 66, '2022-08-19', 268, 'online', 'Completed', null, 2);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (67, 67, 67, 67, 67, '2023-01-17', 228, 'online', 'Cancelled', null, 2);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (68, 68, 68, 68, 68, '2023-02-09', 275, 'online', 'Active', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (69, 69, 69, 69, 69, '2022-08-19', 39, 'cash', 'Cancelled', null, 2);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (70, 70, 70, 70, 70, '2022-12-07', 198, 'online', 'Cancelled', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (71, 71, 71, 71, 71, '2022-08-11', 11, 'cash', 'Completed', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (72, 72, 72, 72, 72, '2022-11-18', 220, 'online', 'Cancelled', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (73, 73, 73, 73, 73, '2022-10-06', 151, 'online', 'Cancelled', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (74, 74, 74, 74, 74, '2022-09-24', 297, 'cash', 'Cancelled', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (75, 75, 75, 75, 75, '2022-02-21', 94, 'cash', 'Completed', null, 2);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (76, 76, 76, 76, 76, '2022-10-16', 163, 'cash', 'Active', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (77, 77, 77, 77, 77, '2022-11-09', 117, 'online', 'Active', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (78, 78, 78, 78, 78, '2022-02-22', 96, 'online', 'Cancelled', null, 2);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (79, 79, 79, 79, 79, '2022-02-28', 274, 'online', 'Active', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (80, 80, 80, 80, 80, '2022-11-06', 134, 'online', 'Active', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (81, 81, 81, 81, 81, '2022-11-27', 13, 'cash', 'Cancelled', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (82, 82, 82, 82, 82, '2022-11-30', 113, 'online', 'Completed', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (83, 83, 83, 83, 83, '2022-11-02', 12, 'online', 'Cancelled', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (84, 84, 84, 84, 84, '2022-03-07', 49, 'online', 'Completed', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (85, 85, 85, 85, 85, '2022-09-04', 17, 'cash', 'Completed', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (86, 86, 86, 86, 86, '2022-04-30', 171, 'cash', 'Completed', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (87, 87, 87, 87, 87, '2023-02-06', 96, 'cash', 'Cancelled', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (88, 88, 88, 88, 88, '2022-03-30', 201, 'cash', 'Completed', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (89, 89, 89, 89, 89, '2022-06-30', 10, 'online', 'Completed', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (90, 90, 90, 90, 90, '2022-04-27', 136, 'cash', 'Cancelled', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (91, 91, 91, 91, 91, '2022-12-20', 119, 'cash', 'Completed', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (92, 92, 92, 92, 92, '2022-09-12', 25, 'online', 'Completed', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (93, 93, 93, 93, 93, '2022-12-31', 109, 'cash', 'Cancelled', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (94, 94, 94, 94, 94, '2022-06-14', 174, 'cash', 'Active', null, 4);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (95, 95, 95, 95, 95, '2022-03-07', 125, 'cash', 'Cancelled', null, 3);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (96, 96, 96, 96, 96, '2022-12-02', 219, 'cash', 'Cancelled', null, 2);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (97, 97, 97, 97, 97, '2022-03-21', 215, 'online', 'Cancelled', null, 5);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (98, 98, 98, 98, 98, '2022-04-10', 188, 'cash', 'Completed', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (99, 99, 99, 99, 99, '2022-05-16', 297, 'cash', 'Active', null, 1);
insert into bookings (booking_id, customer_id, driver_id, pickup_location_id, dropoff_location_id, pickup_time, fare, payment_method, status, cancel_time, rating) values (100, 100, 100, 100, 100, '2023-01-14', 268, 'cash', 'Cancelled', null, 4);



insert into Admin(Admin_Name , Address , Phone_Number , EmailID) values
("Admin1" , "New Delhi" , 1122334455 , "Admin1@gmail.com"),
("Admin2" , "London" , 1112223334 , "Admin2@gmail.com"),
("Admin3" , "New York" , 1111222233, "Admin3@gmail.com"),
("Admin4" , "Auckland" , 1111122222 , "Admin4@gmail.com"),
("Rooney Brock","Ap #867-7118 Sem St.","087-301-8484","augue.ut@hotmail.com"),
("Madeson Kerr","132-3643 Nulla Av.","089-751-7236","et@aol.ca"),
("Erasmus Ortega","Ap #592-424 Eros. St.","016-215-4481","eu.odio.phasellus@aol.ca"),
("Melyssa Buckley","9754 Praesent Rd.","046-030-4161","elementum.dui@aol.ca"),
("Wesley Salas","Ap #617-510 Amet, St.","063-201-8849","imperdiet.dictum.magna@outlook.org"),
("Hector Mueller","476-5020 Nisi Rd.","037-735-6572","nullam@protonmail.net"),
("Chase Warner","Ap #606-2998 Non St.","066-255-2747","aliquam.adipiscing.lobortis@icloud.com"),
("Sonia Stokes","Ap #187-7792 Lacus. Avenue","063-981-5936","primis.in@icloud.com"),
("Moses Warren","Ap #798-3456 Quam Rd.","043-038-2282","dui.cras@outlook.org"),
("Teagan Harrison","701-582 Ipsum St.","017-186-4177","sed@aol.ca"),
("Maya Gill","7440 Risus. Street","057-515-5309","est.nunc.laoreet@icloud.ca"),
("Giselle Fletcher","P.O. Box 353, 5540 Et Street","085-541-5156","in.faucibus@aol.couk"),
("Violet Mueller","706-7426 At St.","090-413-1430","iaculis.aliquet@aol.ca"),
("Carol Buchanan","634-1366 Nibh. Ave","041-052-6255","mauris@aol.edu"),
("Michelle Short","Ap #919-6316 Sit Road","070-532-3849","pellentesque.a@hotmail.edu"),
("Davis Suarez","3751 A, Ave","050-074-2665","urna.et@google.edu"),
("Justine O'connor","5515 Vitae, Avenue","064-686-8524","magnis.dis.parturient@yahoo.edu"),
("Isaac Morgan","Ap #331-3470 Semper Av.","070-740-5277","sagittis.duis.gravida@google.ca"),
("Cassady Mays","Ap #431-5306 Ipsum. Rd.","094-428-8512","egestas.ligula.nullam@outlook.couk"),
("Rudyard Goff","1242 Faucibus. Av.","085-017-8802","volutpat.ornare@icloud.couk"),
("Orlando Owen","387-7524 Id, St.","003-881-0294","integer@hotmail.ca"),
("Nathan Wright","Ap #548-9224 Senectus Ave","012-955-7547","lorem@hotmail.org"),
("Rashad Mooney","593-7446 Sit Avenue","063-599-5326","diam.proin@aol.couk"),
("Preston Morrison","Ap #393-2592 Ultrices, Av.","006-868-2273","ornare.facilisis@yahoo.couk"),
("Kirby Mendez","8168 Est Av.","072-077-5728","quisque@yahoo.com"),
("Mohammad Mejia","Ap #528-5883 Euismod Rd.","062-245-6731","a@icloud.couk"),
("Halee Weber","632-3829 Nec Rd.","006-471-6568","ut.pellentesque.eget@outlook.com"),
("Noelani Fox","638-4156 Et Road","050-186-5613","egestas.blandit@yahoo.org"),
("Leila O'brien","857-993 Odio, Rd.","038-736-6004","neque.morbi.quis@aol.org"),
("Zenaida Woods","P.O. Box 299, 6196 Lorem. Ave","050-857-4507","nec.enim.nunc@google.net"),
("Yvonne Maxwell","P.O. Box 668, 8705 Sed Avenue","086-896-3496","parturient@protonmail.net"),
("Jade Herrera","P.O. Box 185, 7755 Bibendum Av.","037-867-2852","nibh.donec@outlook.net"),
("Nash Williamson","114-8317 Suspendisse Av.","018-968-1504","dis.parturient.montes@hotmail.net"),
("Chancellor Webster","473-3784 Pede. Street","059-872-3872","porttitor.tellus@outlook.org"),
("Calista Bass","Ap #434-8043 Enim, Road","048-283-2119","ipsum@icloud.ca"),
("Fiona Henry","863-1491 Enim. Av.","062-228-2350","nec@aol.org"),
("Genevieve Marshall","894-2592 Sit Ave","083-953-6821","dapibus.ligula@outlook.edu"),
("Dacey Wyatt","701-9838 Mauris Street","026-376-0488","sit.amet.diam@protonmail.edu"),
("Hanae Edwards","P.O. Box 898, 5389 Sollicitudin Rd.","016-442-1663","risus.at.fringilla@outlook.org"),
("Dexter Sparks","237-9329 Sem Street","072-768-0564","mauris.id@protonmail.org"),
("Chava Ewing","939-6604 Nec Ave","053-553-7658","phasellus.in@icloud.edu"),
("Jordan Irwin","9483 Donec Road","028-250-0124","ultrices.posuere@google.com"),
("Kylynn Hooper","240-4324 Nec, Avenue","077-414-1531","nulla.tincidunt@google.com"),
("Amy Glenn","P.O. Box 991, 1830 Vivamus Street","043-828-5265","vitae@icloud.com"),
("Simone Cummings","Ap #608-4892 Mus. Road","047-131-7365","curae.donec.tincidunt@yahoo.edu"),
("Caldwell Vang","Ap #277-466 Ultrices St.","042-013-5671","magna.ut.tincidunt@hotmail.net"),
("Joan Sanders","Ap #340-1569 Elit Av.","084-561-4924","enim.diam@outlook.ca"),
("Kermit Austin","312-597 Nibh St.","043-400-3741","metus.sit.amet@google.org"),
("Nolan Burris","627-4672 Consectetuer Rd.","066-474-5740","nunc.in.at@outlook.ca"),
("Moses Armstrong","701-6601 Vestibulum Rd.","066-660-5138","fusce.dolor@google.net"),
("Alice Gillespie","P.O. Box 466, 3637 Aliquam Avenue","078-875-4114","volutpat.ornare.facilisis@google.org"),
("Yolanda Ferrell","9041 Quis St.","071-832-3944","at@aol.ca"),
("Leslie Kennedy","P.O. Box 461, 6413 Ultrices, Rd.","023-385-0961","aliquet.sem@yahoo.couk"),
("Ross Short","525-1196 Fusce Ave","055-944-8378","auctor.non@protonmail.couk"),
("Rebekah Cox","8413 Lectus. Avenue","007-756-7187","id.libero@google.couk"),
("Lee Mcclure","210 Congue Road","038-044-0362","tellus.aenean.egestas@aol.ca"),
("Odette Yates","P.O. Box 351, 2505 Dictum. St.","023-352-1485","est@hotmail.couk"),
("Adrian Stephens","Ap #408-9307 Nulla. Ave","059-201-6462","molestie.orci@google.edu"),
("Alexa Pate","P.O. Box 840, 2121 Fringilla, Av.","036-864-5216","nisl.maecenas.malesuada@icloud.edu"),
("Sara Gilliam","Ap #157-5640 Rhoncus. Avenue","028-352-1707","interdum@google.edu"),
("Nathan Sanders","P.O. Box 405, 7692 Eget Avenue","054-778-3893","aliquam.eros.turpis@aol.org"),
("Xanthus Walsh","8966 Aliquam Rd.","039-782-8295","sapien.nunc@aol.ca"),
("Jamal Herrera","377-7425 Suspendisse Avenue","032-540-6314","lorem@hotmail.edu"),
("Grady Noel","P.O. Box 866, 6386 Lacus. Ave","044-185-7065","vivamus.molestie@aol.net"),
("Ora Harrington","198-1047 Suspendisse Street","055-672-8687","semper.rutrum@yahoo.edu"),
("Xena Stephens","9456 At Street","091-415-2448","purus.accumsan.interdum@google.com"),
("Herrod Turner","Ap #477-7303 Lorem, St.","019-784-2638","cras.lorem@hotmail.couk"),
("Caesar Oneil","172 Amet Rd.","058-034-6841","lectus.nullam@google.org"),
("Todd Adkins","4536 Odio Road","078-883-1163","iaculis.nec@google.net"),
("Kirk Marshall","P.O. Box 972, 876 Tellus Street","086-262-5174","sociosqu.ad.litora@protonmail.couk"),
("Quentin Mitchell","942-5422 Libero Ave","089-364-0673","ipsum.primis@hotmail.ca"),
("Tanner Morgan","7148 Fermentum Road","069-585-4444","suspendisse@outlook.edu"),
("Laith Diaz","P.O. Box 590, 4039 Lobortis Av.","098-577-7237","vitae.dolor@hotmail.net"),
("Mercedes Whitfield","P.O. Box 963, 5124 Id Av.","027-658-8651","proin.non.massa@icloud.net"),
("Ryder Long","P.O. Box 288, 8437 Sem Rd.","024-357-2853","eleifend@google.org"),
("Xanthus Perkins","Ap #320-4441 Sapien. Av.","013-221-1743","rutrum.magna@google.net"),
("Myles Maxwell","Ap #576-6660 Lacus. Rd.","057-647-7142","tempor@protonmail.ca"),
("Priscilla Townsend","P.O. Box 799, 1889 Vitae Street","037-571-1224","sed@hotmail.com"),
("Tatiana Rosales","P.O. Box 875, 2742 Ac, Ave","027-223-5838","fusce.aliquam@icloud.edu"),
("Merrill Estes","Ap #149-1769 Dui. Avenue","052-588-5394","sagittis.duis@outlook.edu"),
("Carter Glenn","7388 Curabitur Rd.","076-422-1814","ullamcorper.viverra@aol.org"),
("Iola Richard","614-537 Nisi. Ave","037-912-2384","eu.metus@outlook.com"),
("Idola Gilmore","266-4405 Velit. Rd.","027-727-7806","commodo@outlook.edu"),
("Cherokee Delaney","Ap #290-5900 Arcu Av.","024-263-8535","at.augue@aol.org"),
("Rashad Arnold","364-8999 A Rd.","044-174-5848","ornare.lectus@protonmail.com"),
("Orli Bullock","P.O. Box 678, 3225 Ullamcorper. Av.","072-850-2313","dignissim.lacus@aol.org"),
("Breanna Barnes","889-8602 Lacus, Street","054-512-2977","ut@protonmail.org"),
("Aurora Mccullough","282-9488 Non Ave","053-196-5133","lectus.cum@hotmail.com"),
("Jillian O'brien","P.O. Box 475, 8640 Vitae St.","064-740-2572","dui.suspendisse@icloud.com"),
("Talon Slater","P.O. Box 769, 3232 Id Ave","037-766-3578","enim.sed.nulla@protonmail.org"),
("Clare Cox","Ap #696-9046 Quis Rd.","032-633-1487","lorem.ipsum.dolor@outlook.com"),
("Zena Bridges","Ap #601-1041 Nulla Street","007-229-4279","fames.ac@google.ca"),
("Cynthia Jennings","Ap #471-606 Libero. Street","059-471-7448","eu@yahoo.org"),
("Lamar Bass","449-4808 Molestie Road","011-502-9436","mi.pede@hotmail.net"),
("Aspen Day","Ap #630-816 Eget, Rd.","056-850-8122","vitae.aliquam.eros@icloud.couk"),
("Beck Gibbs","Ap #370-9035 Nibh. Rd.","038-284-8328","aliquam@hotmail.couk"),
("Meredith Kidd","121-9859 Dapibus Rd.","037-184-3575","semper@yahoo.net"),
("Katelyn Pacheco","921-649 Aliquam Road","058-855-5430","sit.amet@icloud.ca"),
("Flynn Patton","930-601 Et Avenue","030-563-6824","auctor.odio@aol.org"),
("Charles Le","P.O. Box 735, 7482 Tortor Road","033-975-7503","nunc.lectus@protonmail.net"),
("Ivor Solis","255-6413 Dictum. Road","021-852-4148","mattis.cras@outlook.org"),
("Clio Long","Ap #695-7438 Velit Street","085-117-2634","nullam.enim@yahoo.com"),
("Quentin Gilbert","P.O. Box 949, 9581 Venenatis Rd.","083-480-6654","aliquet.molestie@icloud.org"),
("Myles Cortez","310-4145 In Av.","027-622-6816","viverra.maecenas@hotmail.org"),
("Macon Mccray","102-7184 Blandit Av.","082-594-1362","sodales.at.velit@hotmail.com"),
("Iona Henson","587-8862 Consequat St.","086-534-3785","aliquam@icloud.ca"),
("Nigel Mullins","Ap #116-4683 Egestas Av.","038-482-1326","nunc.interdum@google.net"),
("Moana Garner","Ap #799-5235 Adipiscing, Road","011-041-1754","amet@google.net"),
("Nerea Myers","P.O. Box 962, 1220 Et Street","068-471-4060","luctus.sit.amet@hotmail.net"),
("Flavia Fields","Ap #867-1272 Lectus Road","010-429-3278","ad.litora@google.couk"),
("Blaze Swanson","Ap #713-7489 Pellentesque Avenue","083-531-7620","donec@outlook.ca"),
("Doris Dillard","791-281 In, Road","046-917-6542","dolor.elit@protonmail.net"),
("Chanda Lowery","958-2402 Elit, Road","073-712-1369","egestas.rhoncus.proin@outlook.edu"),
("Lucius Kirk","Ap #195-7725 Per Rd.","097-748-6856","malesuada.fames@protonmail.org"),
("Genevieve Monroe","P.O. Box 185, 8397 Aliquet Rd.","072-130-2436","orci.consectetuer@icloud.org"),
("Kylan Shelton","397-6483 Lectus Rd.","038-710-5400","vitae.orci.phasellus@protonmail.net"),
("Brianna Christian","Ap #939-1503 Nulla St.","072-041-1245","libero.lacus.varius@icloud.net"),
("Yolanda Cunningham","Ap #233-8504 Eleifend. Av.","041-648-4487","parturient@icloud.com"),
("Stacy Stevens","518-768 Aenean Av.","061-891-2817","aliquet.vel@google.edu"),
("Amos Bernard","190-2205 Maecenas Av.","062-522-5917","et@protonmail.net"),
("Tucker Lloyd","Ap #388-623 Nulla Street","092-279-2673","cursus.diam@google.net"),
("Idona Maxwell","3126 Gravida Rd.","083-371-2723","vitae.aliquet@google.edu"),
("Quon Hurley","Ap #897-1328 Proin Ave","067-384-7298","sociis.natoque@icloud.net"),
("Zelenia Pruitt","P.O. Box 603, 2459 Nonummy Road","011-656-7371","tempor.bibendum.donec@yahoo.org"),
("Ali Gentry","P.O. Box 579, 3446 Ut Ave","071-040-4163","phasellus.dapibus@hotmail.edu"),
("Abbot Alexander","4198 Luctus St.","035-620-7783","aliquam.iaculis@google.net"),
("Hammett Cochran","958-7081 Auctor Ave","027-574-1331","semper.nam@aol.couk"),
("Austin Wynn","482-5399 Purus St.","036-753-1213","sit.amet.nulla@google.couk"),
("Kermit Solomon","725-2635 Lectus Rd.","036-753-7302","non.sapien@yahoo.edu"),
("Solomon Davidson","766-4822 Rutrum, Rd.","011-325-7480","feugiat.tellus@google.net"),
("Rajah Aguilar","Ap #666-5091 Massa Street","017-658-7374","mattis.ornare.lectus@aol.org"),
("Kai Riggs","P.O. Box 167, 3714 Tincidunt Street","084-770-7511","vestibulum.nec@outlook.couk"),
("Reed Wilkerson","Ap #359-6380 Aenean Rd.","036-787-2438","integer.vulputate@yahoo.ca"),
("Dalton Maxwell","691-2351 Mus. Street","095-764-2121","donec.consectetuer@yahoo.net"),
("Colton Skinner","P.O. Box 537, 596 Ultrices, Ave","090-368-2648","in@hotmail.org"),
("Lance Dickson","1268 Malesuada St.","073-565-7406","vestibulum.accumsan@google.couk"),
("Tatiana Workman","937-3426 Ipsum Avenue","067-824-6351","porttitor.interdum@aol.couk"),
("Eve Dotson","767-3925 Quis Rd.","055-081-9051","nunc.mauris@outlook.net"),
("Ariel Jordan","Ap #607-2868 Sit Rd.","039-419-3814","donec.tincidunt@icloud.com"),
("Merrill Foster","215-2327 Feugiat. Av.","010-592-1103","neque.in@hotmail.couk"),
("Dorothy Peterson","887-7994 Adipiscing Av.","081-400-8571","lobortis@protonmail.net"),
("Tyler Gibson","P.O. Box 154, 4710 Amet, Rd.","063-300-5885","convallis.ante@google.edu"),
("Alika Melendez","183-3229 Duis Av.","052-177-4274","enim@google.couk"),
("Aphrodite Mayer","P.O. Box 869, 9010 Dictum. Rd.","082-583-6445","nec.ligula@google.ca"),
("Rogan Mathis","Ap #553-8387 Sociis Street","033-737-8166","dis@protonmail.com"),
("Martha Curry","825-9178 A, Av.","084-211-4469","et@protonmail.ca"),
("Isabella Leblanc","425-6427 Risus. Av.","095-534-4157","luctus.sit.amet@yahoo.ca"),
("Arden Hayden","3565 Amet, Rd.","032-041-2286","nulla.facilisi@google.net"),
("Robert Raymond","230-7306 Felis. St.","096-339-5062","lacinia.at@aol.net"),
("Charissa Dominguez","Ap #820-753 Augue Street","086-447-6831","lacinia.vitae@icloud.couk");




insert into Data(Available_Locations) values
("Mumbai"),
("Delhi"),
("Delta"),
("Bangalore"),
("Hyderabad"),
("Ahmedabad"),
("Chennai"),
("Kolkata"),
("Surat"),
("Pune"),
("Jaipur"),
("Lucknow"),
("Kanpur"),
("Nagpur"),
("Indore"),
("Thane"),
("Bhopal"),
("Visakhapatnam"),
("Pimpri & Chinchwad"),
("Patna"),
("Vadodara"),
("Ghaziabad"),
("Ludhiana"),
("Agra"),
("Kerala"),
("Nashik"),
("Faridabad"),
("Meerut"),
("Rajkot"),
("Kalyan & Dombivali"),
("Vasai Virar"),
("Varanasi"),
("Srinagar"),
("Aurangabad"),
("Dhanbad"),
("Amritsar"),
("Navi Mumbai"),
("Allahabad"),
("Ranchi"),
("Haora"),
("Coimbatore"),
("Jabalpur"),
("Lakshadweep"),
("Gwalior"),
("Vijayawada"),
("Jodhpur"),
("Madurai"),
("Raipur"),
("Kota"),
("Guwahati"),
("Chandigarh"),
("Solapur"),
("Hubli and Dharwad"),
("Bareilly"),
("Moradabad"),
("Gurgaon"),
("Aligarh"),
("Jalandhar"),
("Tiruchirappalli"),
("Haryana"),
("Mizoram"),
("Bhubaneswar"),
("Salem"),
("Mira and Bhayander"),
("Thiruvananthapuram"),
("Bhiwandi"),
("Saharanpur"),
("Guntur"),
("Bikaner"),
("Amravati"),
("Noida"),
("Jamshedpur"),
("Warangal"),
("Cuttack"),
("Firozabad"),
("Kochi"),
("Dehradun"),
("West Bengal"),
("Bhavnagar"),
("Durgapur"),
("Asansol"),
("Nanded Waghala"),
("Kolapur"),
("Ajmer"),
("Gulbarga"),
("Jamnagar"),
("Ujjain"),
("Loni"),
("Siliguri"),
("Jhansi"),
("Ulhasnagar"),
("Nellore"),
("Jammu"),
("Belgaum"),
("Mangalore"),
("Ambattur"),
("Tirunelveli"),
("Malegoan"),
("Gaya"),
("Udaipur");


insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 1, 'Sinclare', '202-224-4346', 'QX', '2C3CCAGG1DH577123', '3549639283241609', 'soganian0@networkadvertising.org', 'iNaHxhoR');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 2, 'Junette', '785-948-8787', '6000', '3D7TT2HT9BG471647', '6384383449792962', 'jsimonnin1@about.com', 'P88ZSJr');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 3, 'Sandor', '178-369-0715', 'Th!nk', '3C4PDDEG7CT040888', '4844472398331739', 'spoulden2@cnbc.com', '0TGwwPsa');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 4, 'Gerianna', '300-226-6415', 'Laser', 'WBS3U9C52FP990896', '6761482692733198271', 'growbottam3@businesswire.com', '01B5C0cRK');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 5, 'Jim', '705-707-2347', 'Discovery', 'WAU2GAFC3FN481916', '5100149614254475', 'jdadson4@mashable.com', 'gv91Wx');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 6, 'Brandon', '720-506-9529', 'Passport', 'WBABN33463J035521', '3532432331917134', 'bpatters5@patch.com', 'lUWU20L6');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 7, 'Jammie', '931-520-7446', 'Wrangler', '3N1AB6AP6BL671310', '3552588632839072', 'jtoffts6@umich.edu', '4UoqUGjDl');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 8, 'Vince', '660-761-2063', 'Avanti', '19VDE3F34DE383761', '3531698310712594', 'vregus7@flickr.com', 'BLWHpDioD');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 9, 'Anet', '470-605-2977', 'Land Cruiser', '1G6DC8EY8B0108412', '3569088004762847', 'alegan8@mapquest.com', 'SljOMc0h');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 10, 'Erinn', '938-463-7305', 'Sable', 'WBAUN7C56DV471594', '5602252775400471447', 'ezielinski9@bizjournals.com', 'ghkRfGzpm');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 11, 'Binny', '205-681-8565', 'S10', 'WBAET37453N560446', '6304075638652471', 'bjoslyna@skyrock.com', 'mlhrLvMFDy');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 12, 'Raymond', '684-189-4339', 'Versa', 'WBAVB77598N807509', '4041599868825', 'rtrickerb@webnode.com', 'hTpJs8vWqyqs');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 13, 'Cully', '713-136-7874', '1500', '5J8TB1H52CA832999', '341808233737737', 'cdevlinc@amazonaws.com', 'faiHlSNCxR');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 14, 'Ive', '475-191-9116', 'Quest', 'KNDPB3A21B7378476', '3559929933929928', 'idevericksd@newsvine.com', 'ZaG47zV8NV');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 15, 'Marwin', '356-757-0263', 'M5', 'WAU3FAFR6DA310447', '6372177509952928', 'mpeekevoute@multiply.com', 'QaYZlYd');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 16, 'Ros', '170-792-3944', 'Bonneville', 'WBSPM9C53BE923568', '3529391941643560', 'rbravingtonf@cocolog-nifty.com', '0EhxTaLq');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 17, 'Antonella', '838-299-3349', 'Rio', '3N1AB7AP9FY296480', '3563469641136072', 'adarkottg@tinypic.com', '65U783yc');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 18, 'Deirdre', '821-713-4511', 'Econoline E250', '1FTWF3D59AE819459', '5602214015718164', 'dhagleyh@ning.com', 'goroG85ek');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 19, 'Genevieve', '187-105-1907', 'DTS', '3GYFNDEY1BS517816', '3579008118285517', 'gcoglei@tamu.edu', 'Ktie5l8F');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 20, 'Roxanne', '957-710-6953', 'Escape', '5N1AN0NW6EN905285', '3589974245027395', 'rfranzonelloj@opensource.org', 'TQKQjl');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 21, 'Lorine', '505-990-6150', 'CLK-Class', 'WAUCFAFHXEN964840', '5415797556116654', 'labreheartk@wiley.com', 'M9KQ5KCqFN');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 22, 'Frances', '566-942-6052', 'H2', '2C3CCARG0EH844766', '3569276766821758', 'foxxl@soup.io', 'BOieobL');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 23, 'Rriocard', '739-186-8054', 'Passat', '1G6YV34A355215572', '502059224887588094', 'rcamblem@cafepress.com', 'n4oMzPG235');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 24, 'Enrico', '989-141-6043', 'Corvette', '1G6KF579X4U546976', '201768480615987', 'eparsonsonn@nbcnews.com', '8pVdg3');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 25, 'Loralee', '303-354-5142', 'Crossfire', '2FMGK5B80EB914806', '3567823051260465', 'lraceo@edublogs.org', 'AEIT3sX2');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 26, 'Patrizius', '250-786-8385', 'B-Series Plus', 'WBA3B1C56DF591407', '5100174591794178', 'pgrushinp@pinterest.com', 'k3zs8j');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 27, 'Arvy', '431-958-9132', 'Aspen', 'SCBDC47L98C493450', '6762612711043858', 'amillicanq@home.pl', 'GvWzTwgHa');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 28, 'Haskel', '344-403-7787', 'Firefly', 'WAUFMAFC4EN231805', '6386773357357485', 'hbrandor@people.com.cn', '5tIF32HDo');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 29, 'Gustavus', '634-775-7258', 'Forte', 'KMHDB8AE4AU989723', '3572540810573573', 'gkliements@arstechnica.com', 'hiuzEzMq');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 30, 'Julie', '245-170-7429', 'Tempo', '1FTSF3B55AE681582', '3574435395558461', 'jfolliottt@dagondesign.com', 'Ask8JHcg1Tbg');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 31, 'Bo', '668-849-6261', 'Traverse', '1G4HJ5EM7BU764279', '3529093665812658', 'btissimanu@shutterfly.com', 'MuuWDEfh8v3m');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 32, 'Elene', '174-584-5813', 'XJ Series', '1G4GB5GRXFF082413', '3577886999717241', 'etresisev@addthis.com', 'ycVp5zGpLv');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 33, 'Wylie', '698-890-9691', 'Sequoia', 'WBA3F9C58FK156739', '348977317711497', 'wtomaszynskiw@bbb.org', 'mrOIsB');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 34, 'Jenifer', '242-696-7243', 'Mazda5', '5J8TB4H31DL371526', '6759681472322780', 'jbranstonx@cafepress.com', 'CbDwLHzbW2l');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 35, 'Garik', '120-399-7331', 'F350', 'WAUEFAFL1AN667754', '4917864238808250', 'grisbridgey@google.cn', 'Kafi9ysI');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 36, 'Addy', '422-816-6834', 'V90', 'JTJBC1BAXE2479077', '3584248775674297', 'acarhartz@springer.com', 'DdclBCwb1kBx');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 37, 'Marita', '584-469-4310', 'Fiero', 'WA1CV74L37D833123', '676383540700160442', 'mmcbeath10@google.ca', 'sCpq0GGM');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 38, 'Shanda', '445-862-1928', 'A8', '5N1AR1NBXCC199745', '5602229283620082', 'sseedull11@exblog.jp', 'z4DTEGvY');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 39, 'Eryn', '749-966-3551', 'Beretta', '2HKRM3H32DH325043', '3566118648421899', 'ebachura12@pcworld.com', 'qZwgrR');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 40, 'Marley', '891-854-4508', 'Century', '5GAKVCKD5DJ489024', '36161778729085', 'mpurbrick13@xinhuanet.com', 'z0hqkA54r');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 41, 'Fergus', '886-885-0706', 'Classic', 'WA1KK78R59A838105', '201832654182727', 'fdalyiel14@mozilla.org', 'IIADbKd7T2Yy');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 42, 'Alva', '100-996-5079', 'S6', '1YVHZ8BH9C5374442', '4844426022749997', 'aaubery15@umich.edu', 'jI6aJlu');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 43, 'Thatch', '806-562-9738', 'RAV4', 'WBAEW53454P695263', '3563024445744975', 'tcastaignet16@angelfire.com', 'aIXyaoAyM');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 44, 'Joanna', '922-452-1019', 'M6', '1GYFK36269R467179', '6333874977590705', 'jondracek17@bbb.org', 'VZ5Mi3');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 45, 'Fidelia', '568-324-8703', '1500', 'JTHBE1KS0B0396947', '5610201859226941', 'foffner18@weebly.com', 'JCW1XO2');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 46, 'Karly', '324-415-9341', 'E150', '5NPEB4AC6EH003463', '3582716535508684', 'kbittleson19@hp.com', '2H6LZYRzF4n');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 47, 'Jody', '558-831-8580', 'Avalanche 2500', 'SAJWA1EK7EM217487', '3563897305780738', 'jstiffell1a@microsoft.com', 'xr9ncps6SW');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 48, 'Eloise', '262-525-3867', 'MX-5', 'WBA3C1C56DF242647', '4936437165814653', 'emcbeath1b@oakley.com', 'kBHYbBS');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 49, 'Friedrich', '540-715-0289', 'Courier', 'WAUCFAFH5BN187687', '5602253173793155', 'fwadeling1c@examiner.com', 'fMhqNkp');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 50, 'Amye', '994-799-3414', 'Firebird', '1GKKRNED7FJ918049', '30275477075719', 'aglendinning1d@msn.com', 'LrcJ0VeJIe4');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 51, 'Sullivan', '647-230-2580', '370Z', '3N1AB6AP6CL912834', '060492841962261547', 'scrickett1e@pagesperso-orange.fr', 'OsKrdLvB32N');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 52, 'Bernardo', '635-485-9827', 'Fillmore', '19UUB2F79FA682523', '4405287723804650', 'bsmidmore1f@xrea.com', 'WtT2Nx');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 53, 'Malissa', '615-151-4400', 'H2', 'WA1VKBFP8AA488975', '5251009297351260', 'mfigin1g@answers.com', 'PMz9DsttunhI');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 54, 'Sigrid', '606-708-4876', 'Savana', '1N6AA0CA6DN478788', '4844719378939257', 'sgrigore1h@posterous.com', 'iWjkQYgY9y');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 55, 'Dayna', '933-836-9584', 'Land Cruiser', '19UYA42472A673275', '3538685042202815', 'dmcardle1i@reddit.com', 'XSEvXV');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 56, 'Far', '125-614-9101', 'Thunderbird', '3D73M3HL0BG993862', '5010127240072460', 'fmathewson1j@cbsnews.com', '5fwgljCRv');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 57, 'Adah', '506-204-7871', 'Jetta', '5GAKVAED3CJ221619', '201712928705737', 'anosworthy1k@deliciousdays.com', 'p6HLX5g');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 58, 'Johnna', '882-883-9319', 'Starion', 'SCBZB25E11C516095', '3536287947792032', 'jbirwhistle1l@ftc.gov', 'ayMsx3s70');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 59, 'Cammy', '282-592-9939', 'Ram 3500', '1FTSF3B5XAE444747', '3575667967607016', 'ctatlock1m@1und1.de', 'T9iilBzmcCd');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 60, 'Stephine', '256-564-0883', 'XG350', 'WAUVT68E53A217801', '3577204366763485', 'sfeechan1n@cbsnews.com', 'fi4D11');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 61, 'Nobie', '256-647-1941', 'Equus', 'WAUDF48H98K277048', '3541291007874758', 'nseath1o@ibm.com', 'hf4sIPsLZi61');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 62, 'Loleta', '530-598-1437', 'Town Car', '1FMEU7FEXAU781280', '201959816366508', 'lallibone1p@cnn.com', 'bHC0Fv6m8j3');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 63, 'Westbrook', '456-867-7117', 'Express', 'WAUSFAFL4BA786460', '3566652693430017', 'wearsman1q@apple.com', 'EzR49sV');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 64, 'Currie', '923-815-8837', 'Crown Victoria', 'WAUGL68E25A850557', '5602222819771867', 'cklampk1r@behance.net', 'beXLrf');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 65, 'Rik', '203-848-8729', '6000', 'JN1CV6AP2DM355542', '372301606141465', 'rbecken1s@howstuffworks.com', '37g99V1');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 66, 'Ashby', '919-426-7497', 'C70', '1C3BC5ED8AN130822', '3564958075250473', 'anilles1t@usatoday.com', 'PADHvgBgH9xT');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 67, 'Darell', '386-516-5870', 'Magnum', 'WBASN4C50BC816746', '675919997106671395', 'dhaslehurst1u@earthlink.net', 'BQFxToTUJLp8');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 68, 'Barrie', '645-928-4713', 'MR2', 'WAUJGAFC6DN852964', '5119666545328697', 'bolsen1v@washingtonpost.com', 'EsCssa');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 69, 'Dugald', '971-230-5503', 'S70', 'JTHCL5EF4F5291675', '3553907995401420', 'ddevitt1w@cyberchimps.com', 'wFcstnJ');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 70, 'Shayla', '748-935-5433', 'Scoupe', '1N4AA5AP8DC916641', '3558911035587193', 'sfedoronko1x@indiegogo.com', 'tPhGTfE');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 71, 'Tabatha', '153-475-6175', 'Grand Caravan', 'WAUVFAFH3BN936897', '3573640901326961', 'tivermee1y@tinyurl.com', 'cpBIN4PXTge');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 72, 'Mariel', '350-745-0542', 'CL', 'WA1WKBFP3AA112379', '3554500082593800', 'mbatty1z@yolasite.com', 'PhCHQH');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 73, 'Mela', '768-465-6841', 'Sidekick', 'WBA3A5C50DJ756892', '6762175098618528', 'mmcallaster20@google.ru', 'L6eoRbLcs6');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 74, 'Ruthy', '321-727-0292', 'Expedition EL', '19UUA66267A581018', '3529096136452558', 'rwemyss21@stumbleupon.com', 'QNZu6rp1nl7');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 75, 'Nicky', '180-893-6952', 'XG350', '1FTEW1C83AF371404', '3557785327894819', 'nstump22@oakley.com', '56WnYm1oMR8');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 76, 'Teddi', '523-692-6714', 'Contour', 'WAU4FBFL7BA385497', '3528329846110203', 'tgillyatt23@wunderground.com', '9OSPmk64GE2');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 77, 'Marta', '631-143-6299', 'Golf', '4T1BF1FK0DU101863', '4917847554955631', 'mmcpeice24@un.org', 'EdYJf7Pq');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 78, 'Nelly', '245-957-5494', 'Grand Cherokee', 'WAUJF78K29N263153', '3534278703949157', 'nlister25@google.ru', '2Nfr4gHCMLM');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 79, 'Barnebas', '790-818-6998', 'RAV4', '3D73Y4CL6AG918745', '3539892186499335', 'blardeur26@samsung.com', 'fdhdMHI');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 80, 'Jules', '302-955-1724', '626', 'JA4AD3A33FZ951665', '3571018121765577', 'jdaniaud27@vimeo.com', 'Xyaq2YZdmwEt');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 81, 'Megen', '286-581-8341', '612 Scaglietti', '1HGCR2E35FA329279', '633352966473560542', 'mmerck28@skyrock.com', '3FA72wEE');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 82, 'Angelia', '858-445-5754', 'Cayman', 'WBAPM77579N786101', '5602227918981239047', 'aeccleshare29@constantcontact.com', 'Aemq8P');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 83, 'Hoyt', '701-248-5695', 'Accord Crosstour', '5N1AA0NC6CN257669', '50385023714227628', 'hsamarth2a@globo.com', 'w8C4b7');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 84, 'Karissa', '463-606-6848', 'Passat', 'WBA1K5C54FV047351', '564182172321760433', 'kbehan2b@blog.com', 'UNpCA6Lr1JXj');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 85, 'Arnaldo', '438-319-6358', 'Jetta', 'WBA5B1C58FD038054', '5108754558687390', 'aundrill2c@domainmarket.com', 'x5rqUXjtrdFc');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 86, 'Ryley', '696-108-5436', 'Trooper', '1C4RJEAG9FC524770', '63048036709657940', 'revesque2d@123-reg.co.uk', '1Hx9VP');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 87, 'Shannen', '695-553-6951', 'Sentra', '1G6KD57Y35U926823', '30420535213049', 'sslot2e@upenn.edu', '8fUTCsnWa');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 88, 'Roby', '213-695-6419', 'Tahoe', 'JN1AZ4EH4FM510033', '3583796764898930', 'rstonehewer2f@woothemes.com', 't8LMwDJsANHD');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 89, 'Cornelle', '669-897-6627', 'Taurus', '1G4PS5SK0C4209977', '3576914092948454', 'cbuckeridge2g@uiuc.edu', '6Uq8Uroy62');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 90, 'Kerr', '132-242-6335', 'Charger', 'WP0AB2A84CU614514', '3574899633594341', 'ksamsworth2h@smh.com.au', 'Wrj3age');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 91, 'Wayland', '138-434-6938', 'Camaro', 'WAURV78TX8A959344', '4913904606200245', 'wspeak2i@surveymonkey.com', 'sUAPft7ZzG');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 92, 'Etheline', '520-241-0738', 'Golf', '2G61T5S32F9152265', '4041371318155', 'egoard2j@photobucket.com', 'MeRRb8INHEpX');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 93, 'Ward', '593-630-5426', 'Cavalier', 'WBAVB73598F568723', '3535325688219996', 'wcornewall2k@china.com.cn', '88A4uRQe73');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 94, 'Fredericka', '648-345-8176', 'A5', 'WDDGF4HBXDR019379', '5048371722128012', 'fswansborough2l@wired.com', 'hCS4LtAv');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 95, 'Rona', '394-777-3032', '80', '1C6RD7FP3CS807220', '560225138792240897', 'rdinnies2m@imageshack.us', 'Buc0KyKVj8u');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 96, 'Nathanial', '646-568-2603', 'XJ Series', 'WAUFFBFL2BN246377', '201786531990894', 'nbutteris2n@mozilla.org', 'sJcXaxrZdo');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 97, 'Jazmin', '638-770-3271', 'Escort ZX2', 'WVWAN7AN9EE393144', '201972759589291', 'jpeet2o@newsvine.com', 'a8dfc2eYnd');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 98, 'Renault', '500-714-7596', 'Esperante', '1G6DA8EY8B0648199', '5007668844814992', 'rlaweles2p@reddit.com', '3UJXRa');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (false, 99, 'Marney', '197-786-5338', 'Q', 'JH4CU25639C309692', '6333019235317034', 'mmccosker2q@geocities.jp', 'mpysUjUVxRxE');
insert into Driver (CurrentState, driver_id, Driver_Name, Phone_Number, Car_Model, Car_number, licence_number, EmailID, Password) values (true, 100, 'Faber', '123-106-2384', 'M3', '1GYS4DEF4DR910361', '201572789129785', 'fbuddell2r@digg.com', 'kNkvMThOuOP');

insert into Customer(Customer_Name , Phone_Number , Past_Trips , EmailID , Pending_Charges , Password) values
("Cus1" , 1234512345 , "null" , "Cus1@gmail.com" ,  0 ,  "Cus1_2345"),
("Cus2" , 2345623456, "Gaya , Chandigarh , Ghaziabad" , "Cus2@gmail.com" ,  50 ,  "Cus2_2345"),
("Cus3" , 3456734567 , "Mumbai, Pune" , "Cus3@gmail.com" ,  79 ,  "Cus3_2345"),
("Cus4" , 4567845678 , "Chennai, Tiruvandram" , "Cus4@gmail.com" ,  250 ,  "Cus4_2345"),
("Mollie Hammond","(621) 778-8144","Bicol Region","sed.eu.eros@outlook.org",161,"XBG16LFM1XN"),
("Theodore Blake","1-324-636-7776","Jönköpings län","consectetuer.rhoncus@google.couk",150,"JOF24AQH8RT"),
("Yoshio Fox","(815) 536-3147","Illes Balears","sed.neque@aol.net",185,"HWV50VKW4QX"),
("Aretha Mcpherson","1-866-962-1017","Balıkesir","ac.facilisis@google.couk",255,"XVB72TBX5YV"),
("Zahir Long","(478) 573-2069","Lạng Sơn","imperdiet.ullamcorper@hotmail.net",10,"FUI91WOE8PX"),
("Acton Whitaker","1-198-891-6640","null","rutrum.eu.ultrices@outlook.com",294,"KIX58EFM2ZL"),
("Nyssa Lambert","(516) 957-2620","Pernambuco","ultricies.ligula.nullam@icloud.ca",140,"JPA76VSA2NY"),
("Anthony Rollins","(237) 263-8681","łódzkie","vel.turpis@outlook.ca",210,"CSN26ESH8CJ"),
("Lael Velazquez","1-781-470-6069","Munster","facilisis@aol.com",154,"ENI41FVM6VP"),
("Winifred Ford","(323) 474-9261","Västra Götalands län","vitae.aliquet@aol.org",74,"GQN96ZUL9RK"),
("Kevyn Hooper","1-728-443-6256","Zamboanga Peninsula","sodales.mauris@google.ca",154,"NEQ37ALD8HR"),
("Chaney Valenzuela","(216) 125-5824","Midi-Pyrénées","aliquet.molestie.tellus@yahoo.net",90,"OBQ67YTQ9UU"),
("Myles Hodge","1-871-538-5222","null","sapien.imperdiet.ornare@google.edu",261,"BXH23KWW7TZ"),
("Reese Shepherd","(448) 568-4473","Chihuahua","ac.urna@icloud.ca",177,"QOE72YJA9YF"),
("Kasimir Cain","1-737-293-1560","Cajamarca","sed.dictum@outlook.edu",158,"EBE89LQW9DL"),
("Daryl Preston","1-764-272-8385","Navarra","auctor.odio.a@icloud.net",292,"NPR01MLQ7UB"),
("Riley Rowe","(746) 575-5228","Gujarat","commodo.ipsum@icloud.com",88,"RYH66OTX1MI"),
("Burton Wheeler","1-372-222-8551","null","dictum.phasellus@protonmail.edu",229,"QEN89XDK3FY"),
("Tanner Galloway","1-884-651-7164","Xīnán","amet.lorem@outlook.org",87,"YWM71OPI7JL"),
("Giselle Daniels","(828) 355-4418","East Region","id@protonmail.edu",178,"PMY10HSL4ST"),
("Tucker Buckley","(653) 602-4875","Henegouwen","egestas.aliquam.fringilla@aol.net",255,"VZW93OME3FE"),
("Chloe Ramirez","1-402-359-2481","Poltava oblast","porttitor.tellus.non@icloud.net",172,"UTK51ADI3AY"),
("Lane Duffy","(296) 244-3784","Tula Oblast","dis.parturient@google.com",128,"YYI32ZRV6HU"),
("Ruth Vinson","1-624-676-8018","Connacht","tortor@yahoo.edu",123,"YFH39JJP1RM"),
("Anthony Brennan","(381) 262-4612","New South Wales","odio.a@aol.ca",270,"NMF13EWB6GB"),
("Cruz Ratliff","1-436-578-8352","Querétaro","amet.consectetuer@hotmail.ca",231,"ARO49SBZ2NZ"),
("Luke Everett","(625) 353-4737","Tamil Nadu","faucibus@hotmail.org",46,"ARF38ZHB5YL"),
("Channing Glover","(583) 569-9174","null","luctus.et.ultrices@google.com",146,"IUE27MWG6QI"),
("Quintessa Parsons","(442) 375-7176","Maryland","id.mollis@hotmail.ca",192,"HVP96ZFH9PR"),
("Gannon Morrison","(235) 453-9533","Đà Nẵng","est.vitae.sodales@icloud.org",102,"ENQ08QBU8QI"),
("Lee Cole","(474) 529-8299","Lower Austria","adipiscing.enim.mi@protonmail.ca",23,"QQI23BNW7CC"),
("Carson Britt","(925) 471-4381","Rivne oblast","euismod.mauris.eu@aol.ca",122,"LEK17VNK5YA"),
("Rahim Shaw","(860) 652-8438","İzmir","integer.aliquam@hotmail.edu",193,"XCS21KJB8BG"),
("Rebecca Oneal","(271) 744-6737","Goiás","enim@outlook.com",79,"IWX07FWT2YG"),
("Tamekah Hurst","(522) 259-3767","Pskov Oblast","nullam@google.org",266,"XUZ70TQY6NN"),
("Hiram House","1-688-635-6639","Rogaland","arcu.ac.orci@aol.org",103,"DAH91IMK5IX"),
("Renee Bond","1-419-612-2807","Euskadi","amet@aol.edu",109,"TCX84OJT7UC"),
("Odette Kirkland","1-189-608-2696","Puntarenas","est.nunc@aol.com",46,"GUZ83CRI0DG"),
("Hop Pruitt","1-271-578-6933","Caldas","quis.massa@protonmail.couk",38,"LMY40FUU5DV"),
("Naomi Nunez","(346) 133-2322","null","tempus.non@hotmail.edu",89,"EJF58FCC3JQ"),
("Guy Humphrey","1-617-214-6828","West Kalimantan","nulla.integer.vulputate@yahoo.org",120,"PXJ25QXU8IC"),
("Zelda Palmer","1-713-233-2388","South Island","ut.pellentesque.eget@google.ca",264,"IGB96OSN1WL"),
("Sawyer Whitehead","(485) 654-1814","North Island","aliquet.proin@yahoo.couk",9,"UKJ83QIR5ZJ"),
("Deacon Cantu","1-677-738-8744","Murcia","sem.pellentesque@protonmail.edu",228,"SQQ68WKP3EN"),
("Rina Leblanc","1-228-544-6256","Saskatchewan","nulla@hotmail.net",217,"KNY53WQP8VP"),
("Xanthus Martin","1-745-445-8846","Huáběi","velit.quisque@aol.com",191,"WKH34KRO5ZC"),
("Alexa Horne","1-685-971-5642","Merionethshire","cum@protonmail.org",63,"YZP53KKJ1QB"),
("Beverly Melton","1-587-538-1264","North-East Region","dui.suspendisse.ac@hotmail.couk",180,"IWL55ISR1SU"),
("Vielka Gordon","(434) 235-2381","Los Ríos","congue.elit@yahoo.edu",82,"RGV43JUR0RL"),
("Cassady Sheppard","(105) 303-4228","West Nusa Tenggara","turpis.aliquam.adipiscing@protonmail.ca",134,"XMF46TCU3VV"),
("Zeph Tyler","1-889-851-2466","North Island","luctus.et.ultrices@outlook.couk",122,"KYX75TIC6LC"),
("Imelda Riley","1-752-164-2385","Zuid Holland","duis.cursus@google.couk",259,"KTB43UOV8LH"),
("Melyssa Bird","1-735-238-2887","Azad Kashmir","sem.semper.erat@protonmail.org",240,"GRZ28FHJ7CW"),
("Ciara Weiss","(520) 676-3711","Tyrol","lorem@protonmail.ca",10,"SHS81RCW2JM"),
("Laith Johnson","1-489-506-9417","Rivers","arcu@aol.net",136,"JBB92FGQ6FV"),
("Maya Johnson","1-443-323-6635","Heredia","quam.pellentesque@icloud.edu",245,"UBJ81QSX0HF"),
("Danielle Mcintyre","(518) 362-4876","Paraná","mauris.rhoncus@icloud.couk",246,"SQD34DPA0TL"),
("Mohammad Mcdaniel","(753) 347-2867","Bayern","adipiscing.lacus@aol.couk",17,"WXL24EEV1HX"),
("Harriet Foley","1-257-218-4864","Maule","vulputate.dui.nec@google.ca",117,"UAV24CXX4MZ"),
("Cameran Mccoy","(676) 611-7394","null","commodo.at@hotmail.ca",260,"VUR24PXB5SZ"),
("Drake Mason","1-675-466-2536","Trøndelag","risus@google.edu",218,"XQJ88KFP4BR"),
("Maggy Pittman","1-466-226-7175","Lower Austria","ultricies@protonmail.ca",65,"TYC56TMH8SR"),
("Camilla Mccall","(573) 283-1821","Burgenland","enim@protonmail.org",101,"XAQ47LTW6WX"),
("Hoyt Shannon","(766) 171-1153","Tyumen Oblast","ligula.consectetuer@google.com",82,"AIP96CVA4PC"),
("Benedict O'brien","(307) 527-8602","Galicia","eu.arcu@google.org",273,"BTK92LOZ4PM"),
("Christen Ray","1-772-662-1401","Valparaíso","interdum.nunc@aol.ca",139,"UNG39GIU2JC"),
("Lynn Mack","1-696-712-0426","Bremen","sagittis.placerat@hotmail.ca",119,"THG38ACO1IE"),
("Logan Patterson","1-277-834-6870","Davao Region","iaculis@yahoo.com",240,"JWS67KQD2QO"),
("Neve Woods","1-761-265-5515","Carinthia","placerat.eget@yahoo.couk",238,"GHM64ZLR3GS"),
("Randall Anderson","(246) 895-6562","Zeeland","interdum.feugiat.sed@icloud.edu",283,"OWY11CUD2DE"),
("Eric Lang","(255) 464-5568","null","tincidunt.donec@aol.edu",266,"JYW88PTG1CE"),
("Candice Mercer","1-589-612-3276","Limón","scelerisque.neque@aol.org",294,"UPE14EYT7GP"),
("Selma Ford","1-167-111-2038","Sonora","nec.enim.nunc@yahoo.org",32,"GTG23KRN9WR"),
("Otto Beasley","(588) 533-1835","New South Wales","ante.ipsum@aol.edu",277,"CXD19JVW4ET"),
("Halee Romero","(315) 806-3477","Anambra","egestas.ligula@outlook.ca",261,"PYB89IGI7EO"),
("Brody Mcfarland","(988) 231-0631","Central Region","nam@outlook.org",78,"KEO58KOP6PH"),
("Rhoda Morse","(725) 817-5430","Drenthe","vitae.erat@hotmail.net",55,"KET13TJN1UR"),
("Selma Cooke","(490) 307-7533","Morelos","aliquam.eu.accumsan@yahoo.org",110,"SOS78FNC1PA"),
("Keely Aguirre","1-524-604-4499","North Chungcheong","non.massa@google.com",270,"EOV60DLE1YU"),
("Callum Drake","(576) 615-7688","West Region","duis.dignissim@google.com",181,"OGO48CEL8IB"),
("Keiko Hanson","1-375-569-1799","Tây Ninh","consectetuer.adipiscing.elit@yahoo.ca",285,"LLW34EOB8LC"),
("Cathleen Wong","1-442-879-7334","Bayern","nec.malesuada@icloud.ca",281,"DXM68CBG0NO"),
("Devin Christian","(874) 159-9952","Katsina","penatibus.et.magnis@outlook.ca",197,"XHE74BUV6SH"),
("Orli Noble","(714) 458-7518","Bình Dương","mattis.ornare@icloud.org",68,"IBT53EKB1AW"),
("Hayden Ortiz","(669) 764-8963","Limón","elementum.lorem@protonmail.couk",103,"GHV32CKX3IQ"),
("Kadeem Irwin","(265) 912-9363","Niger","convallis.ligula@outlook.edu",180,"IIV97ORC3HE"),
("Len Horn","(670) 428-4168","Tula Oblast","ut.semper@icloud.couk",294,"PGU76BXW0HV"),
("Claire Parks","(415) 340-8425","Antwerpen","imperdiet@aol.org",0,"LHD54SRB2EJ"),
("Dara Herring","(659) 832-5264","West Nusa Tenggara","enim.commodo@yahoo.ca",166,"GTY44PLK3KX"),
("Vladimir Matthews","1-573-644-3147","Cartago","elit@icloud.net",143,"IFO81VNI1RW"),
("Mona Armstrong","1-226-481-9889","Puntarenas","ac.sem@google.ca",124,"OWH26TRM1QG"),
("Wynter Quinn","1-692-527-3471","Tasmania","sagittis@google.com",273,"BWW86BLQ2JN"),
("Regan Ingram","(464) 856-6425","Jeju","in.condimentum@protonmail.edu",280,"YFM17LLV8XQ"),
("Mariam Wright","1-912-353-8173","Alberta","dapibus@outlook.ca",42,"AEL47HSV4DA"),
("Jane Swanson","(817) 777-2854","Paraná","turpis.egestas@icloud.ca",231,"OVK80ZNV6QF"),
("Gillian Weiss","1-845-549-8663","Lombardia","nascetur.ridiculus@hotmail.com",219,"KGZ27GTI6MH"),
("Ivor Avila","(556) 166-4847","Idaho","facilisis.magna.tellus@icloud.ca",31,"MAN27SQU0RM"),
("Patricia Zamora","(328) 199-8165","Yucatán","neque.vitae.semper@google.edu",147,"IUE69WMA3RB"),
("Rhonda Buckner","(872) 553-4303","Nevada","metus@hotmail.com",172,"UAT17TCT8YE"),
("Jorden Reynolds","(463) 639-0545","Gilgit Baltistan","est.tempor@icloud.org",155,"MHN21SJS5VX"),
("Dalton Bentley","(741) 563-3223","East Java","mauris@protonmail.org",213,"OEF11QXO4BE"),
("Drew Merritt","1-454-578-3478","Cauca","sem.egestas@yahoo.couk",179,"MPY41JDE5NF"),
("Michael Valentine","(242) 731-8298","O'Higgins","leo.morbi.neque@aol.edu",226,"JJQ63KEE2SV"),
("Amanda Houston","1-344-160-2158","Paraíba","risus.in@icloud.couk",209,"BMU47TEL1TH"),
("Preston Farrell","1-268-766-2048","Xīnán","condimentum.eget@yahoo.org",222,"GRB72UGZ9UO");



insert into bookings(Source , Destination , Scheduled_Day , Scheduled_Time) values--change Trip_information to booking
("Tuapukan","Leon","everyday","10:47"),
("Kantemirovka","Lunsar","sunday","5:12"),
("Xinkai","Aboisso","sunday","1:37"),
("Milicz","Maldonado","everyday","10:15"),
("Cihaur","Stockholm","sunday","6:07"),
("Xiaolong","Tenri","everyday","1:40"),
("New York City","Campana","sunday","23:07"),
("Waterbury","Soasio","sunday","8:11"),
("Ōdachō-ōda","Hammam-Lif","sunday","22:21"),
("Sydney","Cimo de Vila","everyday","0:23   "),
("Furong","Hongling","sunday","21:26"),
("Aramecina","Khao Khitchakut","everyday","15:54"),
("Zagreb","Zhangjiang","sunday","14:35"),
("Conde","Wang Thonglang","sunday","6:05"),
("Bizerte","Chencun","everyday","12:23"),
("Baruchowo","Jiutai","everyday","22:53"),
("Sámi","Bilao","everyday","1:10"),
("Tanushimarumachi-toyoki","Zeqin","sunday","12:46"),
("Doong","Hödrögö","everyday","17:34"),
("Qujiang","Taihe","everyday","13:44"),
("Pentaplátano","Duancun","everyday","13:01"),
("Talitsa","Santa Bárbara","everyday","18:30"),
("Palma Soriano","Tete","everyday","3:05"),
("Al ‘Āqir","Wuying","everyday","23:01"),
("Ponoka","Thoen","sunday","19:50"),
("Staropavlovskaya","Jielin","everyday","3:02"),
("Caraballeda","Piraí do Sul","sunday","7:28"),
("Portland","Palmira","everyday","13:29"),
("Moss","Mgachi","everyday","9:16"),
("Foluo","Durrës","everyday","18:21"),
("Parnaíba","Terawas","everyday","11:30"),
("Luopioinen","Villejuif","everyday","3:06"),
("Sŭngho 1-tong","Lianokládhion","sunday","9:43"),
("Leramatang","Västerås","everyday","9:41"),
("Amsterdam Nieuw West","Chipata","everyday","3:25"),
("Dahe","Bor","everyday","1:38"),
("Bulungu","Timrat","sunday","9:54"),
("Dolores","Malibago","sunday","17:33"),
("Sundsvall","Uglegorsk","sunday","20:51"),
("Pantijan No 2","Tripoli","everyday","21:33"),
("San Jose","Sheffield","everyday","22:05"),
("Acul du Nord","Aguadulce","sunday","18:40"),
("Levallois-Perret","Ymittos","sunday","6:42"),
("Utan","Padangguci","sunday","17:13"),
("Sapang Buho","Bayan","sunday","5:54"),
("Bojong","Vale das Mós","everyday","18:36"),
("Sukamulia","Borås","everyday","20:06"),
("Carcassonne","Vsevolozhsk","sunday","6:03"),
("Fredrikstad","Yambrasbamba","sunday","8:00"),
("Mongaguá","Calango","sunday","6:53"),
("Ribafria","Katipunan","everyday","18:20"),
("Bakaran Kulon","Aviá Terai","sunday","23:14"),
("Sanfang","Bojongsarung","sunday","9:39"),
("Tentúgal","Marignane","sunday","8:49"),
("El Copey","Stavanger","everyday","16:46"),
("Ayotupas","Jhumra","everyday","5:18"),
("Zhanghekou","Pilar","sunday","8:36"),
("Matalam","San Diego","sunday","9:14"),
("Qingu","Maying","sunday","19:42"),
("Loivos","Bech","sunday","0:36"),
("Westport","Jiru","sunday","6:55"),
("Aizkraukle","Walce","sunday","12:51"),
("Baiyang","Baculongan","everyday","7:26"),
("Sertolovo","Al Jawādīyah","sunday","9:17"),
("Semey","Trubchevsk","sunday","3:39"),
("Beibei","Iwo","everyday","0:26"),
("Camperdown","Rogowo","sunday","14:01"),
("Izyaslav","Józefów","everyday","18:49"),
("Quatá","Veldhoven","sunday","7:58"),
("Casal Novo","Norman Wells","everyday","13:36"),
("Beizhuang","Santa Teresita","everyday","5:00"),
("Puconci","Sumberejo","everyday","21:31"),
("Sendangkemulian","Pimenta Bueno","sunday","0:46"),
("Nanmuping","Parakanpanjang","sunday","10:15"),
("Debrzno","Abéché","everyday","21:03"),
("Monte Leite","Vanderbijlpark","sunday","9:20"),
("Koryčany","Mae Ramat","everyday","7:22"),
("Riverton","Garden Grove","everyday","8:39"),
("Tulsa","Xiadian","everyday","4:20"),
("Bordeaux","Patulul","everyday","21:18"),
("Idritsa","Kazimierz Dolny","sunday","0:07"),
("Manhuaçu","Shuangta","sunday","8:45"),
("Hînceşti","Agía Varvára","sunday","12:09"),
("Sacramento","Concepción","everyday","2:26"),
("Pobral","Gryazovets","sunday","15:51"),
("Zhenping Chengguanzhen","Narail","sunday","19:49"),
("Otuke","Kupusina","everyday","11:29"),
("Gawanan","Pitai","everyday","13:19"),
("Paclolo","Lijiazui","sunday","7:55"),
("Guangyi","Madur","sunday","15:38"),
("Staroshcherbinovskaya","Sidaraja","sunday","12:49"),
("Yigo Village","Kuteynykove","sunday","4:46"),
("Santa Cruz De Tenerife","Zhukeng","everyday","7:22"),
("Gharyan","San Pedro Sacatepéquez","everyday","15:43"),
("Babao","Sañgay","sunday","21:40"),
("Kuala Lumpur","Banjar Peguyangan","sunday","18:24"),
("Hortolândia","Nato","sunday","18:06"),
("Torre do Pinhão","Agnibilékrou","sunday","2:44"),
("Chai Nat","Kangalassy","sunday","13:58");




-- 4th Deadline
-- SQL Queries

describe table Admin;
describe table Customer;
describe table Driver;
describe table bookings;
describe table Data;

select * from Admin;
select * from Customer;
select * from Driver;
select * from bookings;
select * from Data;

drop table Admin;
drop table Driver;
drop table Customer;
drop table Login;
drop table bookings;
drop table Data;

-- select * from Driver where Driver.Money_Earned >"$5000" and Driver.Money_Earned <= "$7500";
-- select * from Driver where Driver.Hours_Worked > "30" and Driver.Hours_Worked < "35";
-- select * from Customer where Customer.Pending_Charges = "0";
-- select * from Customer where Past_Trips = "null";
-- select * from Admin where Admin.Phone_Number = "087-301-8484";
-- select * from bookings where bookings.Scheduled_Day = "everyday";
-- select * from bookings where bookings.Scheduled_Day = "sunday";
-- update Customer set Pending_Charges = 0 where Past_Trips = "null";
-- update bookings set Scheduled_Day = "Monday" where Scheduled_Day = "everyday";
-- select * from Driver where Driver.Money_Earned >= "$8000";
-- update Driver set Hours_Worked = 0 where Money_Earned > "$8000";


--show driver's information
SELECT Customer.Customer_Name, Driver.Driver_Name, Driver.Phone_Number, Driver.Car_Model, Driver.Car_Condition FROM Customer INNER JOIN Driver ON Customer.PickupID=Driver.driver_id;

--Retrieve all bookings made by a particular customer.

SELECT * FROM bookings WHERE customer_id = [customer_id];

--Show the total revenue generated by a specific taxi driver for a given time period.

SELECT SUM(fare) FROM bookings WHERE driver_id = [driver_id] AND pickup_time BETWEEN [start_date] AND [end_date];

--Find the average rating of a particular driver based on all the ratings given by customers

SELECT AVG(rating) FROM bookings WHERE driver_id = [driver_id] AND status='Completed' AND rating>0;

--Show all active bookings for a particular driver.

SELECT * FROM bookings WHERE driver_id = [driver_id] AND status = 'Active';

--Get the total number of bookings made in a day/week/month.; start_date and end_date should be in the format YYYY-MM-DD HH:MM:SS

SELECT COUNT(*) FROM bookings WHERE pickup_time BETWEEN [start_date] AND [end_date];

--Display the details of a specific booking, including the pickup and drop-off locations, fare, and payment information.

SELECT pickup_location, dropoff_location, fare, payment_method FROM bookings WHERE booking_id = [booking_id];

--Retrieve a list of cancelled bookings for a particular time period.start_date and end_date should be in the format YYYY-MM-DD HH:MM:SS

SELECT * FROM bookings WHERE status = 'Cancelled' AND cancel_time BETWEEN [start_date] AND [end_date];

--Get the total number of completed bookings for a particular taxi driver.

SELECT COUNT(*) FROM bookings WHERE driver_id = [driver_id] AND status = 'Completed';

--Get all the bookings for a specific driver on a specific date.

SELECT * FROM bookings WHERE driver_id = [driver_id] AND DATE(pickup_time) = [date];

-- Get all the drivers who have a rating above a certain value:

SELECT driver_id, AVG(rating) AS average_rating FROM driver_ratings GROUP BY driver_id HAVING AVG(rating) > [rating];
