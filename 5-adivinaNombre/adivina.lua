local background = display.newImage("background.png");

local inputText = native.newTextField (10, 150, 300, 36);

inputText.text = "Ingresa un numero"
math.randomseed(os.time())

local guessNumber = math.random (1,100)
print ("guessNumber", guessNumber)

local badSound = audio.loadSound ("wrong_answer.mp3")
local goodSound = audio.loadSound ("correct_answer.mp3")

local text1 = display.newImage("text_adivina.png")
	text1.x = 160	
	text1.y = 250

local text2 = display.newImage("text_alto.png")
	text2.x = 160	
	text2.y = 250
	text2.isVisible = false;

local text3 = display.newImage("text_bajo.png")
	text3.x = 160	
	text3.y = 250
	text3.isVIsible =false;

local text4 = display.newImage("text_lucky.png")
	text4.x = 160
	text4.y = 250
	text4.isVisible = false;

function hideAllTexts( )
	text1.isVisible = false;
	text2.isVisible = false;
	text3.isVisible = false;
	text4.isVisible = false;
end

function guessMyNumber ( )
--body
local userText = inputText.text;

local userNumber =tonumber (userText)
	text1.isVisible = false;
	text2.isVisible = false;
	text3.isVisible = false;
	text4.isVisible = false;

if userNumber then

if userNumber < guessNumber then
	print ("el numero es menor")
	audio.play(badSound)
	text3.isVisible = true;

elseif userNumber > guessNumber then	
	print ("yeiii")
	audio.play(badSound)
	text2.isVisible = true;

else 
	print("yeiii")
	audio.play(goodSound)
	text4.isVisible = true;
end

timer.performWithDelay(1000, hideAllTexts)

end
end

function input_handler ( event )

if event.phase == "submitted" then
	print("enter")
	guessMyNumber();	

end
-- body
end

inputText:addEventListener ("userInput",input_handler);





