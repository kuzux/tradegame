COMP=idris
SRCS=Main.idr 
BIN=Main

all: $(BIN)

.PHONY = all clean

Main: $(SRCS)
	$(COMP) $(SRCS) -o $(BIN)

clean:
	rm *.ibc $(BIN)
