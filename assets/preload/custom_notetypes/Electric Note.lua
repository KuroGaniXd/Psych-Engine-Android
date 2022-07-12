function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Electric Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteTypes/ELECTRICNOTE_assets');

			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		
		end
	end
	--debugPrint('Script started!')
	function noteMiss(id, i, noteType, isSustainNote)
		if noteType == 'Electric Note' then
		characterPlayAnim('boyfriend', 'hurt', true);
	end
end
end
-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false


-- Called after the note hit calculations



function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == "Electric Note" then
		playSound('electricShock', 0.7);
		triggerEvent('Play Animation', 'shocked', 'BF') 
		health = getProperty('health')
		setProperty('health', getProperty('health')-0.5);
	end
end