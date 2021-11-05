.PHONY: build
build:
	docker build -t shogi-gui .

.PHONY: run/socat
run/socat:
	socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"

.PHONY: run/xquartz
run/xquartz:
	open -a xquartz