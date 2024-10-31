if [ -z "$1"]; then
  echo "Por favor, forneça um nome para a pasta."
  exit 1
fi

mkdir "$1"

main_dir="$1"

mkdir -p "$main_dir/src" "$main_dir/build"

cat << 'EOF' > "$main_dir/Makefile"
GCC=gcc
SRC_DIR=src
BUILD_DIR=build
MAIN=
LD=ld

compile: $(BUILD_DIR)/$(MAIN)

$(BUILD_DIR)/$(MAIN): $(BUILD_DIR)/$(MAIN).o
	$(LD) -m elf_i386 -o $(BUILD_DIR)/$(MAIN) $(BUILD_DIR)/$(MAIN).o

$(BUILD_DIR)/$(MAIN).o: $(SRC_DIR)/$(MAIN).s
	$(GCC) -m32 -c $(SRC_DIR)/$(MAIN).s -o $(BUILD_DIR)/$(MAIN).o

clean:
	rm -f $(BUILD_DIR)/*.o $(BUILD_DIR)/$(MAIN)
EOF

cat << 'EOF' > "$main_dir/run.zsh"
./build
EOF

chmod +x "$main_dir/run.zsh"

echo "Estrutura de projeto criada: '$main_dir'"
