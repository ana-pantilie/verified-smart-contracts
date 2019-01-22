
---- HOW TO RUN KEVM TESTS ----

1. Clone evm-semantics.
2. cd evm-semantics
3. make deps split-tests -B -j2
This might fail if you haven't set up your JAVA_HOME env variable properly
4. make build-java -j2
5. MODE=VMTESTS SCHEDULE=DEFAULT ./kevm run --backend java tests/ethereum-tests/VMTests/vmArithmeticTest/add0.json
If your tests directory is missing then run git submodule update --init and try again.
You can run the test using different backends. The default is the OCaml backend.
