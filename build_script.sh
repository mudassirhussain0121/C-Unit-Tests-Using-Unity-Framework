mkdir build
cd build
cmake .. -G Ninja
cmake --build .
cd Windows32/Debug # Application binary/image is created in this directory.
./UNIT_TESTS.exe
# Prevent terminal from closing
read -p "Press Enter to exit..."