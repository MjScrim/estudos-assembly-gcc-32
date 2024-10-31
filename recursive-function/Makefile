GCC=gcc
SRC_DIR=src
BUILD_DIR=build
MAIN=factorial
LD=ld

compile: $(BUILD_DIR)/$(MAIN)

$(BUILD_DIR)/$(MAIN): $(BUILD_DIR)/$(MAIN).o
	$(LD) -m elf_i386 -o $(BUILD_DIR)/$(MAIN) $(BUILD_DIR)/$(MAIN).o

$(BUILD_DIR)/$(MAIN).o: $(SRC_DIR)/$(MAIN).s
	$(GCC) -m32 -c $(SRC_DIR)/$(MAIN).s -o $(BUILD_DIR)/$(MAIN).o

clean:
	rm -f $(BUILD_DIR)/*.o $(BUILD_DIR)/$(MAIN)
