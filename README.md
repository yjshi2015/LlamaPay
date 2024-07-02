+ 初始化项目 `forge init LlamaPay`
+ 安装依赖 `forge install OpenZeppelin/openzeppelin-contracts`
+ 配置环境变量 `source .env`
+ 部署合约 `forge script script/LlamaPay.s.sol:LlamaPayScript --rpc-url $BSC_TEST_RPC_URL --etherscan-api-key $BSCSCAN_API_KEY --broadcast --verify -vvvv`


`forge create --rpc-url $TELOS_TEST_RPC_URL --private-key $PRIVATE_KEY src/MyToken.sol:MyToken --legacy`

`forge create --rpc-url $TELOS_TEST_RPC_URL --private-key $PRIVATE_KEY src/LlamaPay.sol:LlamaPay --constructor-args 0x463c8d43995eA2004873F6d083a118A6bAC6C4Cd --legacy`

```

```
+ 查询账户余额
```
source .env
export MyToken=0xF4cE13c5b3Cb1dB0855277991895CCC4cA349583
export LlamaPay=0x8B5977Eb4B204a93fD153216Be4a66fB7Fc71bd8
export MyAccount=0xf2D55aC64536c3E626ADDfb121c7056a7b440901
cast call $MyToken "balanceOf(address)(uint256)" $MyAccount --rpc-url $TELOS_TEST_RPC_URL
```


+ 授权代币 approve, Hash:`0x003f23336af5cb6bb5f044d36fb9d9098d9abbbd8936e3e74245e3063bd3e061`
`cast send --private-key $PRIVATE_KEY $MyToken "approve(address,uint256)" $LlamaPay 100000000000000000000 --rpc-url $TELOS_TEST_RPC_URL --gas-limit 21644000 --legacy`


+ 存入资金 deposit, Hash: `0x0e1281eb383d4cdb67a8d5a2dc55b4faed32a751786718ffedf059fdfa6c61eb`
```
cast send --private-key $PRIVATE_KEY $LlamaPay "deposit(uint256)" 100000000000000000000 --rpc-url $TELOS_TEST_RPC_URL --gas-limit 21644000 --legacy

cast call $MyToken "balanceOf(address)(uint256)" $LlamaPay --rpc-url $TELOS_TEST_RPC_URL
```

+ 创建支付流 createStream
```
export alice=0x52fe15Ab6fCcf6289078221Aaffe3d6182C38677
cast send --private-key $PRIVATE_KEY $LlamaPay "createStream(address,uint216)" $alice 300000000000000000 --rpc-url $TELOS_TEST_RPC_URL --gas-limit 21644000 --legacy

cast call $LlamaPay "getPayerBalance(address)" $MyAccount --rpc-url $TELOS_TEST_RPC_URL
```
+ 取款 withdraw
```
cast send --private-key $PRIVATE_KEY $LlamaPay "withdraw(address,address,uint216)" $MyAccount $alice 300000000000000000 --rpc-url $TELOS_TEST_RPC_URL --gas-limit 21644000 --legacy

```
