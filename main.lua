#!/usr/bin/lua
NUMBER = {"一", "二", "三", "四", "五", "六", "七", "八", "九"}
TEN = "十"
HUNDRED = "百"
THOUSAND = "千"
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

    local date = numberToKanji(day) .. DAY .. numberToKanji(month) .. MONTH .. numberToKanji(year) .. YEAR
    
    print(date)
end

-- n is expected to be a string
function numberToKanji(n)
    local i_n = tonumber(n)
    local rev = string.reverse(n)
    local first = string.sub(rev, 1, 1)
    local second = string.sub(rev, 2, 2)
    local third = string.sub(rev, 3, 3)
    local fourth = string.sub(rev, 4, 4)
    local dateString = ""    


    if i_n > 1000 then
        dateString = dateString .. NUMBER[tonumber(fourth)] .. THOUSAND
    end

    if i_n > 100 and tonumber(third) > 0 then
        dateString = dateString .. NUMBER[tonumber(third)] .. HUNDRED
    end

    if i_n > 10 and tonumber(second) > 0 then
        dateString = dateString .. NUMBER[tonumber(second)] .. TEN
    end

    dateString = dateString .. NUMBER[tonumber(first)]
    return dateString 
end

   
main()
