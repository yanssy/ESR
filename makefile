#compiler
CC = g++

#compiling flag
INCLUDE_PATH = /usr/local/include
CCFLAG = -c -Wall -std=c++11 -O3  -I $(INCLUDE_PATH)

#linking flag
LIB_OPENCV =  -L/usr/local/lib -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_objdetect
CLFlAG =  $(LIB_OPENCV)

all: ESRTest ESRTrain

ESRTest: ESRTest.o ESRRegressor.o ESRUtils.o ESRCascadedFerns.o ESRFern.o ESRBbox.o
	$(CC) $(CLFlAG) -o ESRTest ESRTest.o ESRRegressor.o ESRUtils.o ESRCascadedFerns.o ESRFern.o ESRBbox.o

ESRTrain: ESRTrain.o ESRRegressor.o ESRUtils.o ESRCascadedFerns.o ESRFern.o ESRBbox.o
	$(CC) $(CLFlAG) -o ESRTrain ESRTrain.o ESRRegressor.o ESRUtils.o ESRCascadedFerns.o ESRFern.o ESRBbox.o

ESRTest.o: ESRTest.cpp
	$(CC) $(CCFLAG) ESRTest.cpp

ESRTrain.o: ESRTrain.cpp
	$(CC) $(CCFLAG) ESRTrain.cpp

ESRRegressor.o: ESRRegressor.cpp ESRRegressor.hpp
	$(CC) $(CCFLAG) ESRRegressor.cpp 

ESRUtils.o: ESRUtils.cpp ESRUtils.hpp
	$(CC) $(CCFLAG) ESRUtils.cpp

ESRCascadedFerns.o: ESRCascadedFerns.cpp ESRCascadedFerns.hpp 
	$(CC) $(CCFLAG) ESRCascadedFerns.cpp

ESRFern.o: ESRFern.cpp ESRFern.hpp
	$(CC) $(CCFLAG) ESRFern.cpp

ESRBbox.o: ESRBbox.cpp ESRBbox.hpp
	$(CC) $(CCFLAG) ESRBbox.cpp

clean: 
	rm -f *.o
	rm -f ESRTest
	rm -f ESRTrain
