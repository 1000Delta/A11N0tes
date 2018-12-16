$$
\begin{aligned}
V_{b1} &= V_{CC}·\frac{R_{b12}}{R_{b11}+R_{b12}}=3V \\
V_{e1} &= V_{b1}-0.7V = 2.3V \\
I_{c1} &= I_{e1} = \frac{V_e}{R_{e1}+R_{e2}} = 2.09mA \\
V_{c1} &= V_{CC} - I_{c1}R_{c1} = 7.82V \\
V_{ce1} &= V_{c1}-V_{e1} = 5.52V \\
\\
V_{b2} &= V_{CC}·\frac{R_{b22}}{R_{b21}+R_{b22}}=1.5V \\
V_{e2} &= V_{b2}-0.7V = 0.8V \\
I_{c2} &= I_{e2} = \frac{V_{e2}}{R_{e2}} = 0.73mA \\
V_{c2} &= V_{CC} - I_{c2}R_{c2} = 10.54V \\
V_{ce2} &= V_c-V_e = 9.74V
\end{aligned}
$$

$$
\begin{aligned}
A_{v1} &= \frac{V_{o1}}{V_{i1}} = \frac{-\beta R_{c1}}{r_{be1}+(1+\beta)R_{e11}} = -17.48 \\
R_{i1} &= R_{s}+{R_{b11}||R_{b12}||[r_{be1}+(1+\beta)R_{e1}]} = 9243.83\Omega \\
R_{o1} &= R_{c1} = 2000\Omega \\
A_{v2} &= \frac{V_{o2}}{V_{i2}} = \frac{-\beta R_{c2}}{r_{be2}+(1+\beta)R_{e21}} = -14.52 \\
R_{i2} &= (R_{b1} || R_{b2}) + r_{be2} + (1+\beta)R_{e2} = 30605\Omega \\
R_{o2} &= R_{c2} || R_{L2} = 1437\Omega \\
\\
A_{v} &= A_{v1} · A_{v2} = 253.8096 \\
R_{i} &= R_{i1} = 9243.83\Omega \\
R_{o} &= R_{o1} = 1437\Omega \\
\\
F_{v} &= \frac{v_{f}}{v_{o}} = \frac{}{} \\
\\
f(u_{i1}, u_{i2}) = 10(u_{i1}+u_{i2})
\end{aligned}
$$

