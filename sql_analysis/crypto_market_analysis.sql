use crypto_db;

-- Query 1: Top 10 coins by market cap
select 	symbol as `Symbol`,name as `Name`, format(market_cap, 0) as `Market Cap (USD)` 
from market_cap
order by market_cap desc
limit 10;

-- Query 2: Coins with negative 24h change
select 	symbol as `Symbol`,name as `Name`, Round(price_change_24h,4) as `24h Price Change (USD)`, 
		Round(price_change_percentage_24h,4) as `24h Price Change Percentage`
from market_cap
where price_change_24h < 0
order by price_change_percentage_24h asc;

-- Query 3: Most trusted crypto exchanges above 9 trust score
select 	name as `Name`, country as `Country`, trust_score as `Trust Score`,
		Format(trade_volume_24h_btc,2)  as `24h Bitcoin Trade Volume (USD)`
from exchanges
where trust_score > 9;

-- Query 4: 5 Exchanges with highest bitcoin trading volume
select 	name as `Name`, country as `Country`, 
		Format(trade_volume_24h_btc,2)  as `24h Bitcoin Trade Volume (USD)`
from exchanges
order by trade_volume_24h_btc desc
limit 5;

-- Query 5: Price trend for specific coin
select id as `ID`, 
date_format(from_unixtime(timestamp/1000),'%d-%m-%y %H:%i') as `DateTime (UTC)`, 
Format(price,2) as `Price (USD)`
from coins_history
where id = 'bitcoin';
