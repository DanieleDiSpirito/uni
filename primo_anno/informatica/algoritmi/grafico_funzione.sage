import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(-5, 5, 100)
y = x^3 + 3*x + 4

plt.axhline(y=0, color="green", linestyle="--")
plt.axhline(y=0.5, color="black", linestyle=":")
plt.axhline(y=1.0, color="red", linestyle="--")
plt.axvline(color="grey")
plt.plot(x, y, linewidth=2, label=r"$f(x) = x^2 + 3x + 3$")
plt.xlim(-5, 5)
plt.xlabel("x")
plt.legend(fontsize=12)
plt.show()