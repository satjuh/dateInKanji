#!/usr/bin/lua
NUMBER = {"一", "二", "三", "四", "五", "六", "七", "八", "九"}
TEN = "十"
DAY = "日"
MONTH = "月"
YEAR = "年"

function main()
    dateToKanji()
end


function dateToKanji()
    local day = os.date("%d")
    local month = os.date("%m")
    local year = os.date("%Y")

    local date = numberToKanji(day) .. DAY .. numberToKanji(month) .. MONTH .. year .. YEAR
    
    print(date)
end

-- n is expected to be a string
function numberToKanji(n)
    local first = string.sub(n, 1, 1)
    local second = string.sub(n, 2, 2)
    local dateString = ""    

    if tonumber(n) > 10 then
        dateString = dateString .. NUMBER[tonumber(first)] .. TEN
        
    end

    dateString = dateString .. NUMBER[tonumber(second)]
    return dateString 
end

   
main()
