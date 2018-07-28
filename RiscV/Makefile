ASMS := $(patsubst %.decaf,%.s,$(wildcard *.decaf))
DECAF_JAR := ../result/decaf.jar

all: asm

asm: $(ASMS)

exe: $(EXES)

clean:
	rm $(ASMS) $(EXES)

%.s: %.decaf $(DECAF_JAR)
	java -jar $(DECAF_JAR) -l 4 $< > $@

.PHONY: all asm clean
