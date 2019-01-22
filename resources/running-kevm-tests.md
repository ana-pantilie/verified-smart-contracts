
#Running KEVM tests

###Prerequisites
Installing the required dependencies will need the `JAVA_HOME` environment variable to point to the installed JDK.

###Instalation
1. We presume that the `evm-semantics` git repository is cloned locally.
2. Install the required dependencies
```sh
cd evm-semantics
make deps split-tests -B -j2
make build-java -j2
git submodule update --init
MODE=VMTESTS SCHEDULE=DEFAULT ./kevm run --backend java
    tests/ethereum-tests/VMTests/vmArithmeticTest/add0.json
```

tip: export `MODE` and `SCHEDULE` as environment variables
You can run the test using different backends: `ocaml`|`java`|`haskell`|`haskell-perf`. The default is the `OCaml` backend.


Example Usage
-------------

After building the definition, you can run the definition using `./kevm`.
Read the `./kevm` script for examples of the actual invocations of `krun` that `./kevm` makes.

Run the file `tests/ethereum-tests/VMTests/vmArithmeticTest/add0.json`:

```sh
./kevm run tests/ethereum-tests/VMTests/vmArithmeticTest/add0.json
```

Run the same file as a test:

```sh
./kevm test tests/ethereum-tests/VMTests/vmArithmeticTest/add0.json
```

To run proofs, you can similarly use `./kevm`.
For example, to prove the specification `tests/proofs/specs/vyper-erc20/totalSupply-spec.k`:

```sh
./kevm prove tests/proofs/specs/vyper-erc20/totalSupply-spec.k
```

Finally, if you want to debug a given program (by stepping through its execution), you can use the `debug` option:

```sh
./kevm debug tests/ethereum-tests/VMTests/vmArithmeticTest/add0.json
...
KDebug> s
1 Step(s) Taken.
KDebug> p
... Big Configuration Here ...
KDebug>
```