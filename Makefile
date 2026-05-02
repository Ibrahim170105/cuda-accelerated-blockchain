EXENAME = main
OBJS = main.o gpu_mining.o

# Compilers
CXX = g++
NVCC = nvcc

# Compiler Flags
CXXFLAGS = -std=c++14 -Wall -O3
NVCCFLAGS = -std=c++14 -O3

# Linker Flags (Libraries)
LDFLAGS = -lssl -lcrypto -lboost_system

# Default target
all: $(EXENAME)

# Link everything together using NVCC to automatically include CUDA runtime libraries
$(EXENAME): $(OBJS)
	$(NVCC) $(OBJS) $(LDFLAGS) -o $(EXENAME)

# Rule to compile standard C++ files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Rule to compile CUDA files
%.o: %.cu
	$(NVCC) $(NVCCFLAGS) -c $< -o $@

# Clean up build files
clean:
	-rm -f *.o $(EXENAME)