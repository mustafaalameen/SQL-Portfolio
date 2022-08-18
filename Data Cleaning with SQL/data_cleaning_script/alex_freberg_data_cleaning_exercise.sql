SELECT * FROM datacleaning_db.nashville_data;
use datacleaning_db;

-- 1. Understanding the Data

select column_name, data_type 
from information_schema.columns 
where table_schema = 'datacleaning_db' and table_name = 'nashville_data'; #check data types in a table. 

desc nashville_data;

-- 2. modifying the saleDate column

select Year, cast(year as date)
from nashville_data;

alter table nashville_data
add column Years varchar(255) after Months;

alter table nashville_data
add column Months varchar(255) after Days;

alter table nashville_data
add column Days varchar(255) after saleDate;

update nashville_data
set Years = substring_index(SaleDate,',', -1);

update nashville_data
set Months = substring_index(SaleDate,' ', 1);

update nashville_data
set Days = substring_index(substring_index(SaleDate,',', 1),' ', -1);

select SaleDate, substring_index(substring_index(SaleDate,',', 1),' ', -1)
from nashville_data;

update nashville_data
set Months =  case
	when months = 'January' then 1
    when months = 'February' then 2
    when months = 'March' then 3
    when months = 'April' then '4'
    when months = 'May' then '5'
    when months = 'June' then '6'
	when months = 'July' then '7'
	when months = 'August' then '8'
	when months = 'September' then '9'
	when months = 'October' then '10'
	when months = 'November' then '11'
	when months = 'December' then '12'
    end;

select days, months, years, concat( trim(days),'-',months,'-',trim(years)) addition
from nashville_data;

alter table nashville_data
add column Sale_date_init varchar(255) after Years;

update nashville_data
set Sale_date_init = concat( trim(days),'-',months,'-',trim(years));

alter table nashville_data
add column SalesDate Date after SaleDate;

update nashville_data
set SalesDate = str_to_date(Sale_date_init, '%d-%m-%Y');

-- 3. Splitting the Property Address Column into 2 columns - AddressSlitCity and AdressSplitAddress

select substring(PropertyAddress, 1 , locate(',', PropertyAddress)-1) as Address,
substring(PropertyAddress,locate(',', PropertyAddress)+1, length(PropertyAddress)) as Address
from nashville_data;

alter table nashville_data # created AddressSlitCity column
add column AddressSplitCity varchar(255) after PropertyAddress;

update nashville_data 
set AddressSplitCity = substring(PropertyAddress,locate(',', PropertyAddress)+1, length(PropertyAddress));

alter table nashville_data # created AdressSplitAddress column
add column AddressSplitAddress varchar(255) after PropertyAddress;

update nashville_data
set AddressSplitAddress =substring(PropertyAddress, 1 , locate(',', PropertyAddress)-1);

-- 4. Splitting the Owner Address Column into 3 columns - OwnerAddressSlitAddress, OwnerAdressSplitCity and OwnerAddressSplitState
select OwnerAddress, 
substring_index(OwnerAddress,',',-1) State,
substring_index(substring_index(OwnerAddress,',',-2),',',1) City,
substring_index(OwnerAddress,',',1) Address
from nashville_data;

alter table nashville_data 												# created OwnerAddressSlitAddress column
add column OwnerAddressSplitAddress varchar(255) after OwnerAddress;

update nashville_data
set OwnerAddressSplitAddress = substring_index(OwnerAddress,',',1);

alter table nashville_data 												# created OwnerAddressSlitCity column
add column OwnerAddressSplitCity varchar(255) after OwnerAddressSplitAddress;

update nashville_data
set OwnerAddressSplitCity = substring_index(substring_index(OwnerAddress,',',-2),',',1);

alter table nashville_data												 # created OwnerAddressSplitState column
add column OwnerAddressSplitState varchar(255) after OwnerAddressSplitCity;

update nashville_data
set OwnerAddressSplitState = substring_index(OwnerAddress,',',-1);

alter table nashville_data
drop column OwnerAddressSplitSate;

-- 5. Replaced 'Y' with 'Yes' and 'N' with 'No'
select distinct(SoldAsVacant), count(SoldAsvacant)
from nashville_data
group by 1
order by 2 desc;

select 
case
when SoldAsVacant= 'Y' then 'Yes'
when SoldAsVacant= 'N' then 'No'
else SoldAsVacant
end chn
from nashville_data;

update nashville_data
set SoldAsVacant = case
when SoldAsVacant= 'Y' then 'Yes'
when SoldAsVacant= 'N' then 'No'
else SoldAsVacant
end;

-- 6. removing duplicates from the dataset
with ROWNUMCTE as
(select *, row_number( ) over(partition by
						Parcelid, SalePrice,
                        SaleDate, LegalReference
                        order by UniqueID
                        ) rownum
from nashville_data) 

delete from ROWNUMCTE
WHERE rownum>1; -- nothing can be deleted from this table because no rows fitting that condition are available.


-- 7. delete Unused columnns
 
alter table nashville_data
drop OwnerAddress;

alter table nashville_data
drop PropertyAddress;

alter table nashville_data
drop TaxDistrict;

alter table nashville_data
drop days;

alter table nashville_data
drop Months;

alter table nashville_data
drop years;

alter table nashville_data
drop sale_date_init;


