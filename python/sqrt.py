from eth_abi import encode_single
import argparse
from math import sqrt

# test sqrt(n)

def main(args):
    # do sth
    n = args.n
    
    res = sqrt(n)
    # print("sqrt of {}: {}".format(n, res))
    print(int(res))
    enc = encode_single('uint256', int(res))
    print("0x" + enc.hex())

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--n", type=int)
    
    return parser.parse_args()

if __name__ == '__main__':
    args = parse_args() 
    main(args)