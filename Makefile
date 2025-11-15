# Perhaps someday if this grows a bit we'll convert to maven or gradle, but let's do that when we actually need to.  A makefile is fine for now.
all: bin/drawlib.jar

clean:
	rm -Rf bin

.PHONY: all clean


# Paths specified relative to src/org/rezrov/drawlib.  We'll fix up the paths later.
JAVA_FILES := Main.java 

JAVA_FILES := $(patsubst %, src/org/rezrov/%, ${JAVA_FILES})

CLASS_FILES := $(patsubst src/org/rezrov/%.java, bin/org/rezrov/%.class, ${JAVA_FILES})

bin/org/rezrov/%.class: src/org/rezrov/%.java
	javac -d bin $<

bin/drawlib.jar: ${CLASS_FILES}
	jar cf $@ $^ 

