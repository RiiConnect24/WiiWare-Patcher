echo "Automatic WAD Patcher for Wiimmfi."
echo "Patcher by PokeAcer and Larsenv."
echo "This will patch any WiiWare games in this folder to be installed using a WAD Manager."

echo "\n"

if ! [ -x "$(command -v mono)" ]
then
	echo "Mono not found! Please learn how to install it at:\nhttps://www.mono-project.com/download/stable/#download-lin"
	exit
fi

mkdir "wiimmfi-wads"
mkdir "backup-wads"

for f in *.wad
do
	echo "Processing $f..."
	echo "Making backup..."
	cp "$f" "backup-wads"
	echo "Patching... This might take a second."
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
echo "The original WADs are in backup-wads."