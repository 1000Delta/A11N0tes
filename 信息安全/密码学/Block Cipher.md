# Block Cipher 分组密码

> **如何加密多个分组？**
>
> 有多种模式：ECB, CBC, CTR等，见[分组密码加密模式](#分组密码加密模式)

## Feistel Cipher - 费斯妥加密

### Encryption

1. Split **plaintext**(明文) block into left and right halves: $P(L_0, R_0)$

2. Process iterate $i = 1, 2, 3, ..., n$

   $L_{i+1} = R_i$

   $R_{i+1} = L_i \oplus F(R_i, K_i)$

3. The ciphertext: $(L_{i+1}, R_{i+1})$

$F(R_i, K_i)$ 被称为费斯妥函数

## Data Encryption Standard

[资料加密标准](https://zh.wikipedia.org/wiki/%E8%B3%87%E6%96%99%E5%8A%A0%E5%AF%86%E6%A8%99%E6%BA%96)

[DES补充材料](https://zh.wikipedia.org/wiki/DES补充材料)

### 主结构

使用[费斯妥加密](#Feistel Cipher - 费斯妥加密)，每次对64位数据进行加密

### $F(R_i, K_i)$ - 费斯妥函数

- $R_i$ 32 bits
- $K_i$ 56 bits

#### Process $R_i$

1. **Expand** 32 bits to 48 bits

   Each 4 bits repeat last 2 bits

   从重复的No.32开始第一组

   [扩张函数](https://zh.wikipedia.org/wiki/DES%E8%A1%A5%E5%85%85%E6%9D%90%E6%96%99#%E6%89%A9%E5%BC%A0%E5%87%BD%E6%95%B0_(E%E5%87%BD%E6%95%B0))

   ```
   0110 1101 1101 0011
   0101 1100 1011 1101
   
   101101 011011 111010 100110
   101011 111001 010111 111010
   ```

2. **混合密钥**

   将扩张后的数据块和一个48bits的子密钥进行异或，子密钥共有16*48bits个

3. **S-Box**  - 置换盒

   - 非线性组件，增加安全性

   - Each S-box maps 6 bits to 4 bits 每个S盒将6位输入映射到4位输出

   - [置换表](https://zh.wikipedia.org/wiki/DES%E8%A1%A5%E5%85%85%E6%9D%90%E6%96%99#%E7%BD%AE%E6%8D%A2%E7%9B%92_(S%E7%9B%92))

     For each 6 bits:

     - use the **first bit** and the **sixth bit** to select row number;
     - for other total 4 bits use for select column number;

4. **P-Box**

   使用固定置换进行重组，使得S盒的4个输出在下一轮由4个不同的S盒进行处理

   [置换表](https://zh.wikipedia.org/wiki/DES%E8%A1%A5%E5%85%85%E6%9D%90%E6%96%99#P%E7%BD%AE%E6%8D%A2)

#### DES Subkey

- 从64位输入密钥中使用[选择置换1](https://zh.wikipedia.org/wiki/DES%E8%A1%A5%E5%85%85%E6%9D%90%E6%96%99#%E9%80%89%E6%8B%A9%E7%BD%AE%E6%8D%A21(PC-1))选出56位，剩下的8位可以丢弃或者作为奇偶校验位
- 56位密钥分成两个28bit子密钥

- For **rounds** $i = 1, 2, ... 16$
  - let LK and RK ring shift left $r_i$
  - For rounds 1, 2, 9 and 16 the shift $r_i = 1$, and in all other rounds $r_i = 2$ 

  - 使用[选择置换2](https://zh.wikipedia.org/wiki/DES%E8%A1%A5%E5%85%85%E6%9D%90%E6%96%99#%E9%80%89%E6%8B%A9%E7%BD%AE%E6%8D%A22(PC-2))产生48位子密钥

### Triple DES

- $C = E(D(E(P, K_1), K_2), K_1)$
- $P = D(E(D(P, K_1), K_2), K_1)$

## Advanced Encryption Standard

- Block size: 128 bits
- Key Length: 128, 192 or 256 bits
- 10 to 14 rounds ( depends on key length)
- Each round uses 4 dunctions (3 layers)
  - ByteSub (nonlinear layer)
  - ShiftRow (linear mixing layer)
  - MixColumn (nonlinear layer)
  - AddRoundKey (Key addition layer)

### ByteSub

- 将128位块转化成$4 \times 4$字节矩阵
- 使用AES S-box 进行字节替换

### ShiftRow

- 对矩阵进行循环左移：
  - 第二行1位，第三行2位，第四行3位

### MixColumn

- 对每列进行异或。。。

### AddRoundKey

## Other

- Brifly...
  - IDEA
    - 使用**混合模计算**
  - Blowfish
    - 可变密钥长度
    - 类似于费斯妥架构
  - RC6
    - 基于数据的循环移位算法

## Tiny Encryption Algorithm

- 64 bit block
- 128 bit key

### 流程

1. 将密钥分成4*32bit 组

2. 将64位明文分成左右两组各32位

3. 使用常数$\delta=(\sqrt{5}-1) \times 2^{31} $= 0x9E3779B9来进行加密

4. 循环32轮

5. 轮函数：

   ```go
   sum = 0
   for i :+ 0; i < 32; i++ {
       sum = sum + delta
       v0 += ((v1 << 4) + k0) ^ (v1 + sum) ^ ((v1 >> 5) + k1)
       v1 += ((v1 << 4) + k2) ^ (v0 + sum) ^ ((v0 >> 5) + k3)
   }
   ```

   P62

## 分组密码加密模式

### ECB - Electronic Codebook

电子密码本

相同明文加密会出现相同密文，泄露特征

### CBC - Cipher Block Chaining

链加密 

使用一个初始向量$VI$
$$
\begin{aligned}
\text{Encrypt:}& \\
C_0 &= E(IV \oplus P_0, K) \\
C_1 &= E(C_0 \oplus P_1, K) \\
&... \\
C_n &= E(C_{n-1} \oplus P_n, K)
\end{aligned}
\begin{aligned}
\text{Decrypt:}& \\
P_n &= D(C_{n}, K) \oplus C_{n-1} \\
&... \\
P_1 &= D(C_1, K) \oplus C_0 \\
P_0 &= D(C_0, K) \oplus VI
\end{aligned}
$$
一个组的密文传输错误只会影响相邻两个组的解密

- 自动恢复错误

### CTR - Counter Mode

计数器模式

于前一段运算结果无关，可并行计算
$$
\begin{aligned}
\text{Encrypt:}& \\
C_0 &= E(IV \oplus P_0, K) \\
C_1 &= E((IV+1) \oplus P_1, K) \\
&... \\
C_n &= E((IV+n) \oplus P_n, K)
\end{aligned}
\begin{aligned}
\text{Decrypt:}& \\
P_n &= D(C_{n}, K) \oplus (IV+n) \\
&... \\
P_1 &= D(C_1, K) \oplus (IV+1) \\
P_0 &= D(C_0, K) \oplus IV
\end{aligned}
$$
