dir=$HOME/.steam/steam/steamapps/common/Counter-Strike\ Global\ Offensive/game/csgo/maps
for entry in "$dir"/*
do
    if [[ $entry = *.vpk ]]; then 
        map=`echo "${entry##*/}" | sed -e 's/\.vpk$//'`
        #echo "$map"
        ./Decompiler-linux-x64/Decompiler -f maps/$map/world_physics.vmdl_c -i "$entry" -o ./
        ./Decompiler-linux-x64/Decompiler -i ./maps/$map/world_physics.vmdl_c -b PHYS | sed -e '1,/--- Data for block "PHYS" ---/d' > ./maps/$map.vphys
        rm -R ./maps/$map
    fi
done

cd ./maps
../build/parser
cd ..

for entry in "$dir"/*
do
    if [[ $entry = *.vpk ]]; then 
        map=`echo "${entry##*/}" | sed -e 's/\.vpk$//'`
        rm ./maps/$map.vphys
    fi
done