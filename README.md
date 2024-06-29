+ 初始化项目 `forge init LlamaPay`
+ 配置环境变量 `source .env`
+ 部署合约 `forge script script/LlamaPay.s.sol:LlamaPayScript --rpc-url $BSC_TEST_RPC_URL --etherscan-api-key $BSCSCAN_API_KEY --broadcast --verify -vvvv`

```
MyToken@0xF4cE13c5b3Cb1dB0855277991895CCC4cA349583
LlamaPay=0xa3E74D05798E3fED4A7127F8E8B7A0ae1E0cA2E8
MyAccount=0xf2D55aC64536c3E626ADDfb121c7056a7b440901
```
+ 查询账户余额
```
source .env
export MyToken=0xF4cE13c5b3Cb1dB0855277991895CCC4cA349583
export MyAccount=0xf2D55aC64536c3E626ADDfb121c7056a7b440901
cast call $MyToken "balanceOf(address)(uint256)" $MyAccount --rpc-url $BSC_TEST_RPC_URL
```


+ 授权代币 approve, Hash:`0x003f23336af5cb6bb5f044d36fb9d9098d9abbbd8936e3e74245e3063bd3e061`
`cast send --private-key $PRIVATE_KEY 0xF4cE13c5b3Cb1dB0855277991895CCC4cA349583 "approve(address,uint256)" 0xa3E74D05798E3fED4A7127F8E8B7A0ae1E0cA2E8 100000000000000000000 --rpc-url $BSC_TEST_RPC_URL --gas-limit 21644000`


+ 存入资金 deposit, Hash: `0x0e1281eb383d4cdb67a8d5a2dc55b4faed32a751786718ffedf059fdfa6c61eb`
```
cast send --private-key $PRIVATE_KEY $LlamaPay "deposit(uint256)" 100000000000000000000 --rpc-url $BSC_TEST_RPC_URL --gas-limit 21644000

cast call $MyToken "balanceOf(address)(uint256)" $LlamaPay --rpc-url $BSC_TEST_RPC_URL
```

+ 创建支付流 createStream
```
export alice=0x52fe15Ab6fCcf6289078221Aaffe3d6182C38677
cast send --private-key $PRIVATE_KEY $LlamaPay "createStream(address,uint216)" $alice 300000000000000000 --rpc-url $BSC_TEST_RPC_URL --gas-limit 21644000

cast call $LlamaPay "getPayerBalance(address)" $MyAccount --rpc-url $BSC_TEST_RPC_URL
```
+ 取款 withdraw
```
cast send --private-key $PRIVATE_KEY $LlamaPay "withdraw(address,address,uint216)" $MyAccount $alice 300000000000000000 --rpc-url $BSC_TEST_RPC_URL --gas-limit 21644000

```
