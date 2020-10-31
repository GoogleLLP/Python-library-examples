-- 创建触发器--------------
create table account_table(accnum int, amount decimal(10, 2));

create trigger ins_sum
    before insert on account_table
    for each row set @sum = @sum + New.amount;

set @sum  =0;
insert into account_table values (1, 1.2), (2, 3.2);

select @sum;
select * from account_table;

create trigger insert_new
    after insert on account_table
    for each row
    begin
        insert into t (quantity, price) values (New.accnum, New.amount);
    end;

insert into account_table values (3, 3.3);
-- 查看触发器--------------
show triggers ;
select * from information_schema.TRIGGERS where TRIGGER_NAME = 'no_insert';

-- 删除触发器
drop trigger insert_new;


