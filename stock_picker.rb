def stock_picker(stocks)

	#create an array of potential profits, inserting zero where not applicable
	stock_difference = []
	stocks.each_with_index do |buy, buy_index|
		stocks.each_with_index do |sell, sell_index|
			if sell_index <= buy_index
				stock_difference << 0
			else
				stock_difference << sell - buy
			end
		end
	end

	#find the maximum profit value, and its index
	stock_max = stock_difference.each_with_index.max

	#convert index of max profit back into position of buy and sell stock indexes
	sell_day = (stock_max[1] % stocks.length)
	buy_day = (stock_max[1] / stocks.length)

	print "Buy on day #{buy_day + 1} and sell on day #{sell_day + 1} for a profit of #{stock_max[0]}!"
end 

