# Public Key Cryptography

公钥加密

- 两个密码
  - 发送者用接收者的公钥加密
  - 接收者使用私钥来解密
- 基于**单向陷门函数**
  - “单向”说明从一个方向计算很简单，但是从另一个方向计算很难

## 应用

- 加密 Encryption
- 数字签名 Digital Signature

## 加密

### 超递增背包 Superincreasing Knapsack

1. 生成一个超递增背包SIK
2. 将超递增背包转换成一般背包GK
3. 公钥：GK, 私钥：SIK 加上转化因子

## RSA

1. 找到两个足够大的质数