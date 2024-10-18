CXX=g++
BIN_NAME=parser
OUT_DIR=./build

overlay: setup
	$(CXX) -o $(OUT_DIR)/$(BIN_NAME) -g src/*.cpp src/*.hpp
setup:
	if [ ! -d $(OUT_DIR) ]; then mkdir $(OUT_DIR); fi

clean:
	if [ -d $(OUT_DIR) ]; then rm -rf $(OUT_DIR); fi