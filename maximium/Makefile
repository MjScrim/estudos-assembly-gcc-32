GCC=gcc
SRC_DIR=src
BUILD_DIR=build
MAIN=maximium
LD=ld

compile: $(BUILD_DIR)/$(MAIN)

$(BUILD_DIR)/$(MAIN): $(BUILD_DIR)/$(MAIN).o
	$(LD) -o $(BUILD_DIR)/$(MAIN) $(BUILD_DIR)/$(MAIN).o

$(BUILD_DIR)/$(MAIN).o: $(SRC_DIR)/$(MAIN).s
	$(GCC) -c $(SRC_DIR)/$(MAIN).s -o $(BUILD_DIR)/$(MAIN).o

clean:
	rm -f $(BUILD_DIR)/*.o $(BUILD_DIR)/$(MAIN)
