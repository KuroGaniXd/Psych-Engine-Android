
function onCreate()

	setProperty('cameraSpeed', 0.6)
	
	-- background shit
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx_bf'); --put in mods/sounds/

	makeLuaSprite('boob', 'newYork/NYCBuildings', -740, -530);
        scaleObject('boob', 2, 2)
	setScrollFactor('boob', 0.5, 0.5);
	addLuaSprite('boob', false);

	makeLuaSprite('floor', 'newYork/NYCfloor', -700, 600);
        scaleObject('floor', 2, 2)
	setScrollFactor('floor', 0.95, 0.95);
	addLuaSprite('floor', false);

	makeAnimatedLuaSprite('daPeeps', 'newYork/NYCFGBOPS', -340,-70)
	addAnimationByPrefix('daPeeps', 'fgbops', 'nycFGBOPS',12,true)
	addLuaSprite('daPeeps',false)
	objectPlayAnimation('daPeeps', 'fgbops',false)
	setScrollFactor('daPeeps', 0.95, 0.95);
	
	if not lowQuality then
		makeLuaSprite('haze', 'newYork/groundHaze', -600, 200);
                scaleObject('haze', 4, 4)
		setScrollFactor('haze', 0.8, 0.95);
		addLuaSprite('haze', true);

		makeAnimatedLuaSprite('snowy', 'newYork/snow', -300,100)
		addAnimationByPrefix('snowy', 'fall', 'daSnow',16,true)
                scaleObject('snowy', 4, 4)
		addLuaSprite('snowy',true)
		objectPlayAnimation('snowy', 'fall',false)
		setScrollFactor('snowy', 0.7, 1.6);

		makeAnimatedLuaSprite('bopscreen', 'newYork/NYCSCREENBOPS', -400,650)
		addAnimationByPrefix('bopscreen', 'screenbop', 'nycScreenBops',24,true)
		addLuaSprite('bopscreen',true)
		objectPlayAnimation('bopscreen', 'screenbop',false)
		setScrollFactor('bopscreen', 1.2, 1.1);

		makeLuaSprite('action', 'tunnel/movie bars', -500, -200);
		setScrollFactor('action', 0, 0);
                scaleObject('action', 10, 10)
		addLuaSprite('action', true);
		setObjectCamera('action', 'hud')
		setObjectOrder('action',  2)
	end

	makeAnimatedLuaSprite('rate', 'ratings', 300,200)
	addAnimationByPrefix('rate', 'sick', 'sickRating',24,false)
	
	
	setScrollFactor('rate', 0, 0);
	setObjectCamera('rate', 'hud')
	
	

end

function onUpdate()

	setProperty('gf.scrollFactor.x', 0.95);
	setProperty('gf.scrollFactor.y', 0.95);

end

function onBeatHit()
	objectPlayAnimation('bopscreen', 'screenbop',true)
	objectPlayAnimation('stuff', 'bgbops',true)
	objectPlayAnimation('daPeeps', 'fgbops',true)
	
	
	if getProperty('dad.animation.curAnim.name') == 'idle' then
		characterPlayAnim('dad','idle',true)
	end

	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
		characterPlayAnim('boyfriend','idle',true)
	end
end

stepHitFuncs = {
	
	[680] = function()
		if rating > 0.95  then
			addLuaSprite('rate',true)
			objectPlayAnimation('rate', 'sick',false)
			runTimer('daRating', 1.6, 1);
			playSound('rate', 1);
		end
	end
}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'daRating' then
		removeLuaSprite('rate'); --removing her to make the game run slightly better
	end
end