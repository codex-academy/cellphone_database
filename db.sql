drop table if exists users;
drop table if exists mobile_providers;
drop table if exists mobile_provider_rates;
drop table if exists rate_types;
drop table if exists phone_numbers;
drop table if exists phone_books;
drop table if exists phone_book_entries;
drop table if exists phone_calls;

create table users(
    id int primary key auto increment,
    first_name varchar(100),
    last_name varchar(100),
    email varchar (200) not null,
    CONSTRAINT uc_email UNIQUE (email)
);

create table mobile_providers(
    id int primary key,
    provider_name varchar(200)
);

create table rate_types(
    id int primary key,
    description varchar(50)
);

create table mobile_provider_rates(
    id int primary key,
    mobile_provider_id int,
    rate_type_id int,
    rate decimal(10,2),
    foreign key (mobile_provider_id) references mobile_providers(id),
    foreign key (rate_type_id) references rate_types(id)
);

create table phone_numbers(
    id int primary key,
    user_id int,
    phone_number varchar(20),
    provider_id int,
    foreign key (user_id) references users(id),
    foreign key (provider_id) references mobile_providers(id)
);

create table phone_books(
    id int primary key,
    user_id int,
    foreign key (user_id) references users(id)
);

create table phone_book_entries(
    id int primary key,
    phone_book_id int,
    entry_name varchar(100),
    phone_number_id int,
    foreign key (phone_book_id) references phone_books(id),
    foreign key (phone_number_id) references phone_numbers(id)
);

create table phone_calls(
    id int primary key,
    from_phone_number_id int,
    to_phone_number_id int,
    rate_id int,
    duration decimal(12,2),
    foreign key (from_phone_number_id) references phone_numbers(id),
    foreign key (to_phone_number_id) references phone_numbers(id),
    foreign key (rate_id) references rate_types(id)
);
