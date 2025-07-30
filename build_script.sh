mkdir build
cd build
cmake .. -G Ninja
cmake --build .
cd Windows64
./UNIT_TESTS.exe
# Prevent terminal from closing
read -p "Press Enter to exit..."