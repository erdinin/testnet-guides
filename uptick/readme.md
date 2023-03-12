### Uptick Hakkında

<p align="left"> <a href="https://www.codepen.io/https://uptick.explorers.guru/" target="_blank" rel="noreferrer"><img src="https://raw.githubusercontent.com/erdinin/testnet-guides/main/utils/website.svg" width="32" height="32" /></a> <a href="https://codesandbox.io/u/https://uptick.explorers.guru/" target="_blank" rel="noreferrer"><img src="https://raw.githubusercontent.com/erdinin/testnet-guides/main/utils/blocks.svg" width="32" height="32" /></a> <a href="https://www.github.com/UptickNetwork" target="_blank" rel="noreferrer"><img src="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/github.svg" width="30" height="30" /></a> <a href="https://www.twitter.com/uptickproject" target="_blank" rel="noreferrer"><img src="https://raw.githubusercontent.com/erdinin/testnet-guides/main/utils/discord.svg" width="34" height="34" /></a> <a href="http://www.medium.com/uptickproject" target="_blank" rel="noreferrer"><img src="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/medium.svg" width="32" height="32" /></a> <a href="https://www.twitter.com/uptickproject" target="_blank" rel="noreferrer"><img src="https://raw.githubusercontent.com/erdinin/testnet-guides/main/utils/twitter.svg" width="35" height="35" /></a> </a></p>

***
<a href="https://www.buymeacoffee.com/test"><img src="https://raw.githubusercontent.com/erdinin/testnet-guides/main/utils/button.svg" width="200" /></a>
# Kurulum
## Minimum Sistem Gereksinimleri

```
3CPU 4RAM 80GB
```

## Önerilen Sistem Gereksinimleri

```
4CPU 8RAM 160GB
```

### Otomatik Kurulum
```
source <(curl -s https://raw.githubusercontent.com/erdinin/testnet-guides/main/uptick/install.sh)
```
### Validator Oluşturma
***
### _Cüzdan Oluşturma_
```
uptickd keys add wallet
```

### _Örnek Çıktı_:
```
- name: wallet
  type: local
  address: uptick1fhxvtld4u6d6a4tvnhyrguvzm53gl3tkkfcfyc
  pubkey: '{"@type":"/cosmos.crypto.secp256k1.PubKey","key":"Auq9WzVEs5pCoZgr2WctjI7fU+lJCH0I3r6GC1oa0tc0"}'
  mnemonic: ""

#!!! seed phrase kısmını mutlaka kayıt edin.
kite upset hip dirt pet winter thunder slice parent flag sand express suffer chest custom pencil mother bargain remember patient other curve cancel sweet
```
#### priv_validator_key.json dosyasını kayıt edin
```
cat $HOME/.uptickd/config/priv_validator_key.json
```
#### false çıktısı alana kadar bekleyin.
```
uptickd status 2>&1 | jq .SyncInfo.catching_up
```
#### [Discord](https://discord.gg/BwQXH3jm7C) #faucet kanalına gidin ve $faucet cüzdan adresinizi yazarak token alın
```
$faucet YOUR_WALLET_ADDRESS
```

# token aldıktan sonra cüzdanımızı kontrol edelim.
```
uptickd q bank balances $(uptickd keys show wallet -a)
```
#### örnek çıktı:
```
balances:
  - amount: "5000000000000000000"
    denom: auptick
```

#### validator oluşturma 
`MONIKER ADI GIRINIZ` `website` ve `details` kısımlarını istediğiniz gibi doldurunuz.
```
uptickd tx staking create-validator \
--amount=4000000000000000000auptick \
--pubkey=$(uptickd tendermint show-validator) \
--moniker="MONIKER ADI GIRINIZ" \
--website="https://xyznodes.xyz" \
--details="node runner 💨 PoS Validator ⚛️ testnet addict 💻" \
--chain-id=uptick_7000-2 \
--commission-rate=0.1 \
--commission-max-rate=0.2 \
--commission-max-change-rate=0.05 \
--min-self-delegation=1 \
--fees=20000auptick \
--gas=auto \
--from=wallet \
-y
```
# validator detaylarınızı aşağıdaki komutla görebilirsiniz. 
```
uptickd q staking validator $(uptickd keys show wallet --bech val -a)
```
