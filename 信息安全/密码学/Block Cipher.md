## Feistel Cipher

### Encryption

1. Split **plaintext**(明文) block into left and right halves: $P(L_0, R_0)​$

2. Process iterate $i = 1, 2, 3, ..., n​$

   $L_{i+1} = R_i​$

   $R_{i+1} = L_i \oplus F(R_i, K_i)​$

3. The ciphertext: $(L_{i+1}, R_{i+1})​$



## Data Encryption Standard

### $F(R_i, K_i)$

- $R_i​$ 32 bits
- $K_i$ 56 bits

#### Process $R_i$

1. **Expand** 32 bits to 48 bits

   Each 4 bits repeat last 2 bits

   ```
   0110 1101 1101 0011
   0101 1100 1011 1101
   
   0101 0110 1011 0101
   1101 01
   ```

   

2. **S-Box**

   - Each S-box maps 6 bits to 4 bits

   For each 6 bits:

   - use the **first bit** and the **sixth bit** to select row number;
   - for other total 4 bits use for select column number;

3. **P-Box**

#### DES Subkey

- numbered $0, 1, ..., 55$ of 56 bits
- 
- For rounds $i = 1, 2, ... 16$
  - let LK and RK ring shift left $r_i
- For rounds 1, 2, 9 and 16 the shift $r_i = 1$, and in all other rounds $r_i = 2$ 
  - Bits 8, 17, 

### Triple DES

- $C = E(D(E(P, K_1), K_2), K_1)$
- $P = D(E(D(P, K_1), K_2), K_1)​$

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

- Brifly
- ...