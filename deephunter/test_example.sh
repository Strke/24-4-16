: '
To use the scripts, the output (i.e., -o) of DeepHunter should follow the structure: root_dir/strategy/metrics/id
The strategy and metrics must be the same name with the option, i.e., strategy must be one of [random,uniform,tensorfuzz,deeptest,prob]
metrics must be one of [nbc,snac,tknc,kmnc,nc]. To get the coverage of random strategy in terms of a specific metric, we also need to select the specific metric.
id can be any number.

Before using the new scripts, please install the xxhash by "pip install xxhash"
'

FUZZ_ITERS=200

#python comprehensive_fuzzer.py  -i ../test_seeds/mnist_seeds  -o lenet5_out/random/kmnc/0 -model lenet5 -random 1 -max_iteration $FUZZ_ITERS -criteria kmnc &
#python comprehensive_fuzzer.py  -i ../test_seeds/mnist_seeds  -o lenet5_out/random/nbc/0 -model lenet5 -random 1 -max_iteration $FUZZ_ITERS -criteria nbc &
#python comprehensive_fuzzer.py  -i ../test_seeds/mnist_seeds  -o lenet5_out/uniform/nbc/0 -model lenet5 -criteria nbc -random 0 -select uniform -max_iteration $FUZZ_ITERS &
#python comprehensive_fuzzer.py  -i ../test_seeds/mnist_seeds  -o lenet5_out/uniform/kmnc/0 -model lenet5 -criteria kmnc -random 0 -select uniform -max_iteration $FUZZ_ITERS &
#python comprehensive_fuzzer.py  -i ../test_seeds/mnist_seeds  -o lenet5_out/tensorfuzz/nbc/0 -model lenet5 -criteria nbc -random 0 -select tensorfuzz -max_iteration $FUZZ_ITERS &
#python comprehensive_fuzzer.py  -i ../test_seeds/mnist_seeds  -o lenet5_out/tensorfuzz/kmnc/0 -model lenet5 -criteria kmnc -random 0 -select tensorfuzz -max_iteration $FUZZ_ITERS &
#python comprehensive_fuzzer.py  -i ../test_seeds/mnist_seeds  -o lenet5_out/deeptest/nbc/0 -model lenet5 -criteria nbc -random 0 -select deeptest -max_iteration $FUZZ_ITERS &
#python comprehensive_fuzzer.py  -i ../test_seeds/mnist_seeds  -o lenet5_out/deeptest/kmnc/0 -model lenet5 -criteria kmnc -random 0 -select deeptest -max_iteration $FUZZ_ITERS &
#python comprehensive_fuzzer.py  -i ../test_seeds/mnist_seeds  -o lenet5_out/deeptest/kmnc/0 -model lenet5 -criteria kmnc -random 0 -select deeptest -max_iteration $FUZZ_ITERS &
#python comprehensive_fuzzer.py  -i ../test_seeds/mnist_seeds  -o lenet5_out/deeptest/nbc/0 -model lenet5 -criteria nbc -random 0 -select deeptest -max_iteration $FUZZ_ITERS &
python comprehensive_fuzzer.py  -i ../test_seeds/mnist_seeds  -o lenet5_out/prob/nbc/0 -model lenet5 -criteria nbc -random 0 -select prob -max_iteration $FUZZ_ITERS &
python comprehensive_fuzzer.py  -i ../test_seeds/mnist_seeds  -o lenet5_out/prob/kmnc/0 -model lenet5 -criteria kmnc -random 0 -select prob -max_iteration $FUZZ_ITERS &
wait
python utils/CoveragePlot.py -i lenet5_out -type coverage -iterations $FUZZ_ITERS -o  results/coverage_plot.pdf
python utils/CoveragePlot.py -i lenet5_out -type seedattack -iterations $FUZZ_ITERS -o  results/diverse_plot.pdf
python utils/UniqCrashBar.py -i lenet5_out -iterations $FUZZ_ITERS -o  results/uniq_crash.pdf
echo 'Finish! Please find the results in the results directory.'

