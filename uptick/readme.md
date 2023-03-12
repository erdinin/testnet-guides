### Uptick Hakkında

>[Twitter](https://breakdance.github.io/breakdance/) (https://breakdance.github.io/breakdance/) (https://breakdance.github.io/breakdance/) (https://breakdance.github.io/breakdance/)

<p align="left"> <a href="https://uptick.network/" target="_blank" rel="noreferrer"><img src="https://raw.githubusercontent.com/erdinin/testnet-guides/main/utils/website.svg" width="32" height="32" /></a> <a href="https://uptick.explorers.guru/" target="_blank" rel="noreferrer"><img src="https://raw.githubusercontent.com/erdinin/testnet-guides/main/utils/blocks.svg" width="32" height="32" /></a> <a href="https://www.github.com/UptickNetwork" target="_blank" rel="noreferrer"><img src="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/github.svg" width="30" height="30" /></a> <a href="https://discord.gg/BwQXH3jm7C" target="_blank" rel="noreferrer"><img src="https://raw.githubusercontent.com/erdinin/testnet-guides/main/utils/discord.svg" width="34" height="34" /></a> <a href="https://uptickproject.medium.com/" target="_blank" rel="noreferrer"><img src="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/medium.svg" width="32" height="32" /></a> <a href="https://www.twitter.com/uptickproject" target="_blank" rel="noreferrer"><img src="https://raw.githubusercontent.com/erdinin/testnet-guides/main/utils/twitter.svg" width="35" height="35" /></a> </a></p>

***
<a href="https://uptick.explorers.guru/validator/uptickvaloper1xf30vm6xw9s5ulfgfxjcnj8yv6704nwq3jrjau"><img src="https://raw.githubusercontent.com/erdinin/testnet-guides/main/utils/button.svg" width="200" /></a>
## Kurulum
### Minimum Sistem Gereksinimleri

```
3CPU 4RAM 80GB
```

### Önerilen Sistem Gereksinimleri

```
4CPU 8RAM 160GB
```
#### Eğer [Manual Kurulum](https://github.com/erdinin/testnet-guides/blob/main/uptick/manual-guide.md) yapacaksanız. Yaptıktan sonra Validator Oluşturma kısımından devam ediniz.
### Otomatik Kurulum
```
source <(curl -s https://raw.githubusercontent.com/erdinin/testnet-guides/main/uptick/install.sh)
```
### Validator Oluşturma
***
#### _Cüzdan Oluşturma_
```
uptickd keys add wallet
```

#### _Örnek Çıktı_:
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

#### token aldıktan sonra cüzdanımızı kontrol edelim.
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
### validator detaylarınızı aşağıdaki komutla görebilirsiniz. 
```
uptickd q staking validator $(uptickd keys show wallet --bech val -a)
```
### Kullanışlı Komutlar

### Cüzdan/Key
***
#### yeni cüzdan ekleme
```
uptickd keys add cüzdan-adi
```
#### mevcut cüzdanı kurtarma
```
uptickd keys add cüzdan-adi --recover
```
#### cüzdanları listeleme
```
uptickd keys list
```
#### cüzdan silme
```
uptickd keys delete cüzdan-adi
```
#### cüzdan dışa aktarma (cüzdan-adi.backup şeklinde kayıt edin)
```
uptickd keys export cüzdan-adi
```
#### cüzdan içe aktarma
```
uptickd keys import cüzdan-adi cüzdan-adi.backup
```
#### cüzdan bakiye öğrenme
```
uptickd q bank balances $(uptickd keys show cüzdan-adi -a)
```
### Validator/Moniker
***
#### yeni validator oluşturma (gerekli yerler doldurunuz.)
```
uptickd tx staking create-validator \
--amount=1000000auptick \
--pubkey=$(uptickd tendermint show-validator) \
--moniker="validator-adi" \
--identity=F287570B99E59F81 (keybase) \
--details="https://xyznodes.xyz" \
--chain-id=uptick_7000-2 \
--commission-rate=0.10  \
--commission-max-rate=0.20 \
--commission-max-change-rate=0.01 \
--min-self-delegation=1 \
--from=cüzdan-adi \
--gas-prices=0.1auptick \
--gas-adjustment=1.5 \
--gas=auto \
-y 
```
#### validator düzenleme
```
uptickd tx staking edit-validator \
--new-moniker="validator-adi" \
--identity=F287570B99E59F81 (keybase) \
--details="https://xyznodes.xyz" \
--chain-id=uptick_7000-2 \
--commission-rate=0.1 \
--from=cüzdan-adi \
--gas-prices=0.1auptick \
--gas-adjustment=1.5 \
--gas=auto \
-y 
```
#### validator unjail
```
uptickd tx slashing unjail --from cüzdan-adi --chain-id uptick_7000-2 --gas-prices 0.1auptick --gas-adjustment 1.5 --gas auto -y 
```
#### signing info
```
uptickd query slashing signing-info $(uptickd tendermint show-validator)  
```
#### aktif validatorleri listele
```
uptickd q staking validators -oj --limit=3000 | jq '.validators[] | select(.status=="BOND_STATUS_BONDED")' | jq -r '(.tokens|tonumber/pow(10; 6)|floor|tostring) + " \t " + .description.moniker' | sort -gr | nl  
```
#### inaktif validatorleri listele
```
uptickd q staking validators -oj --limit=3000 | jq '.validators[] | select(.status=="BOND_STATUS_UNBONDED") or .status=="BOND_STATUS_UNBONDING")' | jq -r '(.tokens|tonumber/pow(10; 6)|floor|tostring) + " \t " + .description.moniker' | sort -gr | nl  
```
#### validator detaylarını görüntüle
```
uptickd q staking validator $(uptickd keys show cüzdan-adi --bech val -a)  
```
### Token
***
#### bütün validatorlerin ödüllerini çek
```
uptickd tx distribution withdraw-all-rewards --from cüzdan-adi --chain-id uptick_7000-2 --gas-prices 0.1auptick --gas-adjustment 1.5 --gas auto -y 
```
#### validatorunuzun komisyon ve ödüllerini çekin
```
uptickd tx distribution withdraw-rewards $(uptickd keys show cüzdan-adi --bech val -a) --commission --from cüzdan-adi --chain-id uptick_7000-2 --gas-prices 0.1auptick --gas-adjustment 1.5 --gas auto -y  
```
#### kendinize delege etme
```
uptickd tx staking delegate $(uptickd keys show cüzdan-adi --bech val -a) 4000000000000000000auptick --from cüzdan-adi --chain-id uptick_7000-2 --gas-prices 0.1auptick --gas-adjustment 1.5 --gas auto -y  
```
#### delegate
```
uptickd tx staking delegate valoper adresi 4000000000000000000auptick --from cüzdan-adi --chain-id uptick_7000-2 --gas-prices 0.1auptick --gas-adjustment 1.5 --gas auto -y  
```
#### redelegate
```
uptickd tx staking redelegate $(uptickd keys show cüzdan-adi --bech val -a) valoper adresi 4000000000000000000auptick --from cüzdan-adi --chain-id uptick_7000-2 --gas-prices 0.1auptick --gas-adjustment 1.5 --gas auto -y   
```
#### unbound
```
uptickd tx staking unbond $(uptickd keys show cüzdan-adi --bech val -a) 4000000000000000000auptick --from cüzdan-adi --chain-id uptick_7000-2 --gas-prices 0.1auptick --gas-adjustment 1.5 --gas auto -y  
```
#### token gönderme
```
uptickd tx bank send cüzdan-adi alici-adresi 4000000000000000000auptick --from cüzdan-adi --chain-id uptick_7000-2 --gas-prices 0.1auptick --gas-adjustment 1.5 --gas auto -y  
```
### Governance
***
#### yeni teklif oluşturma
```
uptickd tx gov submit-proposal \
--title="Başlık" \
--description="Açıklama" \
--deposit=1000000auptick \
--type="Text" \
--from=cüzdan-adi \
--gas-prices=0.1auptick \
--gas-adjustment=1.5 \
--gas=auto \
-y   
```
#### tüm proposal/teklifleri görüntüle
```
uptickd query gov proposals  
```
#### id'e göre proposal görüntüleme. örnek: 1.
```
uptickd query gov proposal 1  
```
#### evet oyu verme
```
uptickd tx gov vote 1 yes --from cüzdan-adi --chain-id uptick_7000-2 --gas-prices 0.1auptick --gas-adjustment 1.5 --gas auto -y  
```
#### hayır oyu verme 
```
uptickd tx gov vote 1 no --from cüzdan-adi --chain-id uptick_7000-2 --gas-prices 0.1auptick --gas-adjustment 1.5 --gas auto -y   
```
#### no_with_veto oyu verme
```
uptickd tx gov vote 1 no_with_veto --from cüzdan-adi --chain-id uptick_7000-2 --gas-prices 0.1auptick --gas-adjustment 1.5 --gas auto -y   
```
#### ABSTAIN oyu verme
```
uptickd tx gov vote 1 abstain --from cüzdan-adi --chain-id uptick_7000-2 --gas-prices 0.1auptick --gas-adjustment 1.5 --gas auto -y   
```

### Çeşitli Komutlar
***
#### validator bilgileri
```
uptickd status 2>&1 | jq .ValidatorInfo  
```
#### ip adresi öğrenme
```
 wget -qO- eth0.me 
```
#### servisleri yeniden yükleme
```
sudo systemctl daemon-reload 
```
#### servis etkinleştirme
```
sudo systemctl enable uptickd 
```
#### servis devre dışı bırakma
```
sudo systemctl disable uptickd 
```
#### servis çalıştırma
```
sudo systemctl start uptickd  
```
#### restart service
```
sudo systemctl restart uptickd 
```
#### servis durumu kontrol etme
```
sudo systemctl status uptickd 
```
#### servis logları
```
sudo journalctl -u uptickd -f --no-hostname -o cat
```

