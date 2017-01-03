COMP=idris
SRCS=Main.idr
BIN=Main
LIBS=effects

all: $(BIN)

.PHONY = all clean

Main: $(SRCS)
	$(COMP) $(SRCS) -o $(BIN) -p $(LIBS)

clean:
	rm *.ibc $(BIN)
