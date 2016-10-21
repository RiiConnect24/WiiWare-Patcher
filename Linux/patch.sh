echo "Automatic WAD Patcher for Wiimmfi."
echo "Patcher by PokeAcer and Larsenv."
echo "This will patch any WiiWare games in this folder to be installed using a WAD Manager."

echo "\n"

mkdir wiimmfi-wads

for f in *.wad
do
	echo "Patching $f..."
	mono Sharpii.exe WAD -u "$f" "temp"
	mv ./temp/00000001.app 00000001.app
	./WiiWarePatcher
	mv 00000001.app ./temp/00000001.app
	rm "$f"
	mono Sharpii.exe WAD -p "temp" "./wiimmfi-wads/$f"
	rm -r temp
done

echo "\n"

echo "Done patching the WADs. They're in the folder named wiimmfi-wads."