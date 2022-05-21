-include .env

CONTRACT_ADDRESS="0xe5d298470ae329f1b6bad59f76bdfe64584f0910"
CONTRACT_PATH="src/StakeContract.sol:StakeContract"
CHAIN_ID="4"
OPTIMIZER_RUNS="500"
COMPILER_VERSION="v0.8.13+commit.abaa5c0e"

clean:
	forge clean

install:
	forge install openzeppelin/openzeppelin-contracts
	forge install foundry-rs/forge-std

update:
	forge update

build: clean
	forge build

setup-yarn:
	yarn

local-node: setup-yarn

deploy:
	forge create ${CONTRACT_PATH} --private-key ${PRIVATE_KEY} --rpc-url ${RPC_URL}

deploy-with-args:
	forge create ${CONTRACT_PATH} --private-key ${PRIVATE_KEY} --rpc-url ${RPC_URL} --constructor-args "" "" ""

verify:
	forge verify-contract --chain-id ${CHAIN_ID} --num-of-optimizations ${OPTIMIZER_RUNS} \
		--compiler-version ${COMPILER_VERSION} ${CONTRACT_ADDRESS} ${CONTRACT_PATH} ${ETHERSCAN_API_KEY}