RED='\033[0;32m'
NC='\033[0m' # No Color
base=$PWD
for file in `find . -type f -name 04_simulate_with_icarus.sh`
do
	abspath="$(realpath "${file}")"
	echo -e "${RED}${file}${NC}"
	cd "$(dirname "${file}")"
	# sh $abspath

	rm -rf sim
	rm -f program.hex
	java -jar ../../../bin/Mars4_5.jar nc a dump .text HexText program.hex main.S

	rm -rf sim
	mkdir sim
	cd sim

	cp ../*.hex .

	# default simulation params
	SIMULATION_CYCLESS=120

	# read local simulation params
	source ../icarus.cfg

	# compile
	iverilog -g2005 -D SIMULATION -D ICARUS -I ../../../src -I ../../../testbench -s sm_testbench ../../../src/*.v ../../../testbench/*.v > /dev/null

	# simulation
	vvp -la.lst -n a.out -vcd > /dev/null
	sed -n '36,1000p' a.lst > ../../../text/logs/`dirname "${file}"`.txt

	# output
	# gtkwave dump.vcd

	cd $base
	
done
