COMP=idris
SRCS=Main.idr Model.idr Generate.idr Update.idr Init.idr
ENTRY=Main.idr
BIN=Main
LIBS=effects

all: $(BIN)

.PHONY = all clean

Main: $(SRCS)
	$(COMP) $(ENTRY) -o $(BIN) -p $(LIBS)

clean:
	rm *.ibc $(BIN)
