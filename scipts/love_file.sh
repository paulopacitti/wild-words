echo "____________HOLD ON SOLDIER!__________________"

cd ..
rm -rf out
mkdir out
cd out
mkdir assets
cd ..
cp main.lua out/
cp shack.lua out/
cp -r ./assets ./out/
cd out
zip -9 -r ../releases/DeadZ0ne.love .
cd ..
rm -rf out

echo "_______________MISSON COMPLETED!__________________"
exit 0