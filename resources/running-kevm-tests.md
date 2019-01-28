
# Running KEVM tests

### Prerequisites

- Installing the required dependencies will need the `JAVA_HOME` environment variable to point to the installed JDK.
- Having the `evm-semantics` git repository cloned locally.

### Instalation

```sh
  $ cd evm-semantics
  $ make deps split-tests -B -j2
  $ make build-java -j2
  $ git submodule update --init
```
Example Usage
-------------

After building the definition, you can run the tests using `./kevm`.
Read the [`./kevm`](https://github.com/kframework/evm-semantics/blob/master/kevm) script for the actual invocations of `krun` that `./kevm` makes.

Here is an example showing how to run the [add0.json](https://github.com/ethereum/tests/blob/725dbc73a54649e22a00330bd0f4d6699a5060e5/VMTests/vmArithmeticTest/add0.json) test file using the `java` backend:

```sh
  $ MODE=VMTESTS SCHEDULE=DEFAULT ./kevm run --backend java tests/ethereum-tests/VMTests/vmArithmeticTest/add0.json
```

NOTE: export `MODE` and `SCHEDULE` as environment variables.

You can run the test using different backends: `ocaml`|`java`|`haskell`|`haskell-perf`. The preferred backend can be choosed using `--backend` argument. By default, `OCaml` is selected.


Run the same file as a test:

```sh
  $ ./kevm test tests/ethereum-tests/VMTests/vmArithmeticTest/add0.json
```

To run proofs, you can similarly use `./kevm`.
For example, to prove the specification `tests/proofs/specs/vyper-erc20/totalSupply-spec.k`:

```sh
  $ ./kevm prove tests/proofs/specs/vyper-erc20/totalSupply-spec.k
```

Finally, if you want to debug a given program (by stepping through its execution), you can use the `debug` option:

```sh
  $ ./kevm debug tests/ethereum-tests/VMTests/vmArithmeticTest/add0.json
  ...
  KDebug> s
  1 Step(s) Taken.
  KDebug> p
  ... Big Configuration Here ...
  KDebug>
```

Run Options
-------------

Normal usage:

```sh
  $ ./kevm run            [--backend <backend>] <pgm>   <K args>*
  $ ./kevm [debug|search]                       <pgm>   <K args>*
  $ ./kevm prove                                <spec>  <K args>*
```

-   `run` &nbsp; &nbsp; Run a single EVM program
-   `debug` &nbsp; Run a single EVM program in the debugger
-   `search` &nbsp;Run a program searching for all execution paths
-   `prove` &nbsp; Attempt to prove the specification using K's RL prover

Notes:
- `<pgm>` &nbsp; &nbsp;represents a path to a Ethereum test program
- `<spec>` &nbsp; represents a path to a specification file
- `<K args>` are any options you want to pass directly to K like:
    - `--debug`: output more debugging information when running/proving.


    These commands are more for devs and CI servers.

```sh
  $ ./kevm interpret           <pgm>
  $ ./kevm [test|test-profile] [--backend <backend>] <pgm> <output>
  $ ./kevm sort-logs
  $ ./kevm get-failing [<count>]
```
-   `interpret` &nbsp; &nbsp; Run a single EVM program (in JSON testing format) using fast interpreter
-   `test` &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Run a single EVM program like it's a test
-   `test-profile` &nbsp;Same as test, but generate list of failing tests and dump timing information
-   `sort-logs` &nbsp; &nbsp; Normalize the test logs for CI servers to use
-   `get-failing` &nbsp; Return a list of failing tests, at most <count>.

Note: `<output>` is the expected output of the given test.