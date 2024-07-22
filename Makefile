
# target
TARGET = C_CODE_BUILD_TEST

# optimization
OPT = -Ofast

# Build path
BUILD_DIR = build_test

# C sources
C_SOURCES =  \
src/test.c


# binaries
PREFIX =
# GCC_PATH = C:/w64devkit/bin/
GCC_PATH =

CC = $(GCC_PATH)$(PREFIX)gcc

# C defines
C_DEFS =  \
-DTYJ_TEST

# C includes
C_INCLUDES =  \
# -Iinc\
# -ITiCode/include\

# C flags
CFLAGS = $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -Wextra -Wno-unknown-pragmas

# libraries
LIBS = -lc -lm
LIBDIR = 
LDFLAGS = 

# default action: build all
all: $(BUILD_DIR)/$(TARGET).exe


# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
	$(CC) -c $(CFLAGS) $< -o $@

$(BUILD_DIR):
	@mkdir $@

$(BUILD_DIR)/$(TARGET).exe: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	@echo -e '\n'
	@echo '  run app for test!    '
	@echo '-----------------------'
	@./$(BUILD_DIR)/$(TARGET).exe
	@echo -e '\n'
	@echo '-----------------------'
	@echo '  test end!            '
	@rm -rf $(BUILD_DIR)

# clean up
clean:
	rm -rf $(BUILD_DIR)


# *** EOF ***
