--Random initialize
math.randomseed(os.time())
--Warming up
math.random(); math.random(); math.random()
--List setting chance
listTarget = {1.02;1.03;1.04;1.05};listChanceTarget = {97.05;96.11;95.19;94.28}
--Default value
highProfit = 0;lowProfit = 0
tinyBet = 0.00000001;maxSleep = balance/200000
oldBalance = balance;sleepBet = math.random(tinyBet*100000000,maxSleep*100000000)/100000000
chance = 49.5;nextbet = sleepBet;wager = 0;e = 0;seedRandomizerX=0;hiloRandomizerX=0
--For without Stake--
--highProfit = 0;lowProfit = 0
--oldBalance = balance;maxSleep = balance/200000;sleepBet = math.random(0.00000001*100000000,maxSleep*100000000)/100000000
--chance = 49.5;nextbet = sleepBet
--
chanceBase = 49.5
divedeToBet1 = 865
bet1 = balance/divedeToBet1
betBack1 = bet1
countStreak1 = 0
chance2 = 66
multiplierToBet2 = 40
bet2 = bet1*multiplierToBet2
loseStreakS = 0
minTakeProfitPerRoll = 15; maxTakeProfitPerRoll = 30
takeProfitPerRoll = math.random(minTakeProfitPerRoll, maxTakeProfitPerRoll)
typeSleep3 = true
--
diveWager_4 = 27
chanceWager_4 = 98
chanceBack_4 = 66
wagerBet_4 = balance/diveWager_4
endDice = false
--Sleep setting
timeToRun = math.floor(99/chance*math.random(1, 3)+0.5)
time = 1800;maintime = os.clock();timeStart = os.clock();curTime=0;timeRun = 0;midTime = 0;backTime=0;toBig=true;timeSleepStop=0;countBack=10
countTo4 = 0
--Bet setting
divBalanceToBig = 16
bigBig = oldBalance*0.9998/divBalanceToBig
mainBigBig = bigBig
multiplierBig = 5
minMultiplyProfit = 0.05;maxMultiplyProfit = 0.2
multiplyProfit = math.random(minMultiplyProfit*100,maxMultiplyProfit*100)/100
resMain = balance + bigBig
takeProfitPerTime = balance + bigBig*multiplyProfit;raseProfitPerTime = takeProfitPerTime - balance
--Type bet setting
typeBet = math.random(1, 4)
if(typeBet ==1)then
    timeToRun = math.floor(99/chance*math.random(1, 3)+0.5)
elseif(typeBet == 2)then
    timeToRun = math.floor(99/chance*math.random(2, 4)+0.5)+1
elseif(typeBet == 3)then
    chance = chanceBase
    takeProfitPerRoll = math.random(minTakeProfitPerRoll, maxTakeProfitPerRoll)
    takeProfitPerTime = balance + bet1*takeProfitPerRoll
    raseProfitPerTime = takeProfitPerTime - balance
elseif(typeBet == 4)then
    typeBet = 4
    nextbet = wagerBet_4
    chance = chanceWager_4
    time = math.random(3,5)
    x = os.clock()
end
if(typeBet >= 1 and typeBet <= 3)then
    countTo4 = countTo4 + 1
    randomChance()
end
--Joke value
joker = math.random(1, 200)
divedeJoke = math.random(200, 300)
joke = bigBig/divedeJoke;countJoke = 0
--Stop take profit
multiplyStopProfit = 1.2
takeProfit = balance*multiplyStopProfit
resetseed()

function genNewSleep()
    sleepBet = math.random(tinyBet*100000000,maxSleep*100000000)/100000000
end
function jokeDealer()
    joker = math.random(1, 200)
    if(joker == 99)then
        divedeJoke = math.random(50000, 100000)
        joke = balance/divedeJoke
        nextbet = joke
        countJoke = countJoke + 1
        print("SEND JOKES...")
    end
end

function seedRandomizer()
    seedRandomizerX = math.random(0, 2)
    while (seedRandomizerX >= 1) do 
        resetseed()
        seedRandomizerX = seedRandomizerX - 1
    end
end

function hiloRandomizer()
    hiloRandomizerX = math.random(0, 1)
    if (hiloRandomizerX == 1) then 
        bethigh = true
    else 
        bethigh = false
    end
end

function randomChance()
    CHANCE_RANDOMIZER = math.random(3300,9800)
    chance = CHANCE_RANDOMIZER/100
    payout = 99/chance
    if(typeBet == 1)then
        timeToRun = math.floor(99/chance*math.random(1, 3)+0.5)
    elseif(typeBet == 2)then
        timeToRun = math.floor(99/chance*math.random(2, 4)+0.5)
        if(payout >= 1.5)then
            timeToRun = math.floor(99/chance*math.random(2, 4)+0.5) + 1
        end
    else
        timeToRun = math.floor(99/chance*2+0.5)
    end
    genNewSleep()
    nextbet = sleepBet
end

function sleepToNext()
    typeBet = math.random(1, 2)
    if(os.clock() - x <= time )then
        newtime = time - (os.clock() - x)
        genNewSleep()
        nextbet = sleepBet
        jokeDealer()
        print("[Wait]     [" ..string.format("%.2d:%.2d", math.floor(newtime/60), math.floor(newtime%60)).. "] for next session...")
        toBig = false
    else
        print("Back to bet...")
        toBig = true
        maintime = os.clock() 
        backTime = midTime
        typeBet = math.random(1, 4)
        if(typeBet == 1 or typeBet == 2) then
            multiplyProfit = math.random(minMultiplyProfit*100,maxMultiplyProfit*100)/100
            takeProfitPerTime = balance + bigBig*multiplyProfit
            raseProfitPerTime = takeProfitPerTime - balance
        elseif(typeBet == 3)then
            takeProfitPerRoll = math.random(minTakeProfitPerRoll, maxTakeProfitPerRoll)
            takeProfitPerTime = balance + bet1*takeProfitPerRoll
            raseProfitPerTime = takeProfitPerTime - balance
        end
        if(typeBet == 4 or countTo4 >= 1)then
            countTo4 = 0
            typeBet = 4
            nextbet = wagerBet_4
            chance = chanceWager_4
            time = math.random(3,5)
            x = os.clock()
        elseif(typeBet >= 1 and typeBet <= 3)then
            countTo4 = countTo4 + 1
            randomChance()
        end
        hiloRandomizer()
        seedRandomizer()
    end
end

function sleepToNextBet3()
    if(os.clock() - x <= time)then
        typeBet = math.random(1, 2)
        newtime = time - (os.clock() - x)
        jokeDealer()
        print("[Wait]     [" ..string.format("%.2d:%.2d", math.floor(newtime/60), math.floor(newtime%60)).. "] for next session...")
        genNewSleep()
        nextbet = sleepBet
        toBig = false
        typeSleep3 = true
    else
        print("Back to bet...")
        toBig = true
        maintime = os.clock()
        backTime = midTime
        randomChance()
        typeBet = 3
        loseStreakS = 0
    end
end

function sleepToNextBet4()
    if(os.clock() - x <= time)then
        newtime = time - (os.clock() - x)
        print("[Bet in]   [" ..string.format("%.2d:%.2d", math.floor(newtime/60), math.floor(newtime%60)).. "] left...")
        typeSleep3 = true
        endDice = false
    else
        print("Go to sleep...")
        endDice = true
        randomChance()
    end
end

function randomChanceReal()
    CHANCE_RANDOMIZER = math.random(1, #listChanceTarget)
    chance = listChanceTarget[CHANCE_RANDOMIZER]
    nextbet = bigBig
    if(bigBig > balance)then
        nextbet = balance*0.999
    end
end


function randomTime()
    TIME_RANDOMIZER = math.random(1, 8)
    if(TIME_RANDOMIZER >= 1 and TIME_RANDOMIZER <= 5 )then
        time = math.random(0, 300)
    elseif(TIME_RANDOMIZER >= 6 or TIME_RANDOMIZER <= 7)then
        time = math.random(300, 600)
    elseif(TIME_RANDOMIZER == 8)then
        time = math.random(600, 900)
    end
end

function renewWhenLoss()
    bigBig = bigBig*multiplierBig
    resMain = oldBalance+highProfit
    multiplyProfit = math.random(minMultiplyProfit*100,maxMultiplyProfit*100)/100
    takeProfitPerTime = balance + bigBig*multiplyProfit
    raseProfitPerTime = takeProfitPerTime - balance
    randomTime()
    x = os.clock()
    sleepToNext()
    randomChance()
    bet1 = balance/divedeToBet1
    betBack1 = bet1
    countStreak1 = 0
    bet2 = bet1*multiplierToBet2
    countTo4 = 1
end

function dobet1()
    e = currentstreak - timeToRun
    if win then
        if(nextbet ~= sleepBet)then
            randomChance()
            seedRandomizer()
        elseif(toBig == true)then
            if(e == 0 and nextbet == sleepBet)then
                randomChanceReal()
            else
                jokeDealer()
            end
        end
    else
        if(toBig == true)then
            if(nextbet >= mainBigBig*0.9)then
                renewWhenLoss()
            else
                randomChance()
            end
        else
            randomChance()
        end
        
    end
end
function dobet2()
    e = currentstreak + timeToRun
    if win then
        if(nextbet ~= sleepBet)then
            seedRandomizer()
        end
        randomChance()   
    else
        if(toBig == true)then
            if(nextbet >= mainBigBig*0.9)then
                renewWhenLoss()
            elseif(e == 0)then
                randomChanceReal()
            else
                jokeDealer()
            end
        end
    end
end
function dobet3()
    if win then
        if(toBig == true)then
            if(nextbet > sleepBet)then
                betBack1 = bet1
                randomChance()
                if(nextbet >= bet2)then
                    seedRandomizer()
                end
                hiloRandomizer()
                if(betBack1 < bet2)then
                    x = os.clock()
                    time = math.random(1,30)
                    typeSleep3 = true
                    sleepToNextBet3()
                    randomChance()
                end
                countStreak1 = 0
            else
                randomChance()
            end
            genNewSleep()
            nextbet = sleepBet
        else
            randomChance()
        end
        e = timeToRun
        loseStreakS = 0
    else
        if(toBig == true)then
            loseStreakS = loseStreakS - 1
            e = loseStreakS + timeToRun
            if(nextbet > sleepBet and countStreak1 < 3)then
                countStreak1 = countStreak1 + 1
                if(countStreak1 < 3)then
                    betBack1 = betBack1*4
                    genNewSleep()
                    nextbet = sleepBet
                    loseStreakS = 0
                    x = os.clock()
                    time = math.random(1,60)
                    typeSleep3 = true
                    sleepToNextBet3()
                end
            end
            if(e == 0)then
                chance = chanceBase
                nextbet = betBack1
                if(countStreak1 + 1 < 3)then
                    loseStreakS = 0
                end
            elseif(e == -1)then
                betBack1 = bet2
                nextbet = betBack1
                chance = chance2
            elseif(e < -1 and e > -4)then
                betBack1 = betBack1*4
                nextbet = betBack1
                if(nextbet > balance)then
                    nextbet = balance*0.999
                end
            elseif(e <= -4)then
                stop()
            end
        end
    end
end

function dobet4()
    if win then
        if(toBig == true and endDice == false)then   
            sleepToNextBet4()  
            --wagerBet_4 = balance/diveWager_4   
            if(nextbet >= wagerBet_4*6*0.8)then
                seedRandomizer()
                hiloRandomizer()
            end
            nextbet = wagerBet_4
            chance = chanceWager_4
        end
    else
        if(toBig == true and endDice == false)then  
            if(currentstreak == -1)then
                nextbet = wagerBet_4*2
                chance = chanceBack_4
            elseif(currentstreak == -2)then
                nextbet = wagerBet_4*6
            elseif(currentstreak == -3)then
                nextbet = wagerBet_4*18
                if(nextbet > balance)then 
                    nextbet = balance*0.999
                end
            elseif(currentstreak == -4)then
                stop()
            end
        end
    end
end


function dobet()
    wager = wager + nextbet
    print("\n\n\n\n\n")
    if(typeBet == 1)then
        dobet1()
    elseif(typeBet == 2)then
        dobet2()
    elseif(typeBet == 3)then
        dobet3()
    elseif(typeBet == 4)then
        dobet4()
    end

    if(profit > highProfit)then
        highProfit = profit
    elseif(profit < lowProfit)then
        lowProfit = profit
    end
    if(toBig == true)then
        print("<==========Bet view========================>")
        midTime = math.floor(os.clock() - maintime)+backTime
        print("[Time]:    ["..string.format("%.2d:%.2d", math.floor(midTime/60), math.floor(midTime%60)).."]")
        print("[Type]:    ["..string.format("%d",typeBet).."]")  
        print("[Bets]:    ["..string.format("%d",bets).."]")  
        if(typeBet == 1 or typeBet == 2)then
            print("[Tobet]:   ["..string.format("%d",e).."]")  
            print("[Big Bet]: ["..string.format("%.8f",bigBig).."]  ["..string.format("%.4f",bigBig/oldBalance*100).."]%")
        else
            print("[Tobet]:   ["..string.format("%d",e).."]")  
            print("[Next Bet]:["..string.format("%.8f",nextbet).."]  ["..string.format("%.4f",nextbet/(balance)*100).."]%")
        end
        print("[Chance]:  ["..string.format("%.2f",chance).."]")  
        print("[Payout]:  ["..string.format("%.2f",99/chance).."]")
    else
        if(typeSleep3 == true)then
            sleepToNextBet3()
        else
            sleepToNext()
        end
    end
    print("<==========Profit view=====================>")
    print("[Profit]:  ["..string.format("%.8f",profit).."]  ["..string.format("%.4f",profit/(oldBalance)*100).."]%")
    print("[Session]: ["..string.format("%.8f",raseProfitPerTime).."]  ["..string.format("%.4f",(raseProfitPerTime)/oldBalance*100).."]%")
    print("[Big Bet]: ["..string.format("%.8f",bigBig).."]  ["..string.format("%.4f",bigBig/oldBalance*100).."]%")
    print("[Bet Back]:["..string.format("%.8f",betBack1).."]  ["..string.format("%.4f",betBack1/oldBalance*100).."]%")
    print("[High PF]: ["..string.format("%.8f",highProfit).."]  ["..string.format("%.4f",highProfit/(oldBalance)*100).."]%")
    print("[Low PF]:  ["..string.format("%.8f",lowProfit).."]  ["..string.format("%.4f",lowProfit/(oldBalance)*100).."]%")
    print("[Jokes ]:   ["..string.format("%d",countJoke).."]  ["..string.format("%d",countTo4).."]+")  
    timeRun = math.floor(os.clock() - timeStart)
    if(timeRun > 0)then
        print("<==========Wager view======================>")
        print("[Wager]:   ["..string.format("%.8f",wager).."]  ["..string.format("%.4f",wager/(oldBalance)*100).."]%")
        print("[Per hour]:["..string.format("%.8f",wager/timeRun*3600).."]  ["..string.format("%.4f",wager/timeRun*3600/oldBalance*100).."]%")
        print("[Per day]: ["..string.format("%.8f",wager/timeRun*86400).."]  ["..string.format("%.4f",wager/timeRun*86400/oldBalance*100).."]%")
    end
    if((balance >= takeProfitPerTime and toBig == true and typeBet >= 1 and typeBet <= 3) or (endDice == true and typeBet == 4)) then
        typeSleep3 = false
        endDice = false
        if(bigBig*0.9 <= mainBigBig or balance >= resMain*0.999)then
            bigBig = balance*0.9998/divBalanceToBig
            mainBigBig = bigBig
            bet1 = balance/divedeToBet1
            betBack1 = bet1
            countStreak1 = 0
            bet2 = bet1*multiplierToBet2
        end
        x = os.clock()
        sleepToNext()
        randomTime()
        randomChance()
    end
    if(balance >= takeProfit)then
        print("GET RICK...")
        takeProfit = balance*multiplyStopProfit
        timeSleepStop = math.random(3600,7200)
        typeSleep3 = false
        bigBig = balance*0.9998/divBalanceToBig
        mainBigBig = bigBig
        bet1 = balance/divedeToBet1
        betBack1 = bet1
        countStreak1 = 0
        bet2 = bet1*multiplierToBet2
        toBig = true
        loseStreakS = 0
        wagerBet_4 = balance/diveWager_4
        curTime = os.time()
        print("[Time Stop]:    ["..os.date('%Y-%m-%d-%H:%M:%S', curTime).."]")
        print("[Time Sleep]:   ["..os.date('%Y-%m-%d-%H:%M:%S', curTime+timeSleepStop).."]")
        sleep(timeSleepStop)
        countBack = 10
        while (countBack > 0) do
            stop()
            continuebet() 
            sleep(1)
            countBack = countBack -1
            print("Back to bet...")
        end 
    end
end