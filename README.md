# ECE2112_PA5
# ECE 2112 – Experiment 5: Introduction to MATLAB Programming

**Name:** Managat, Jazmine Vernize S.
**Block:** 2ECE-A
**Course:** ECE 2112 – Advanced Computer Programming and Algorithms
**School:** University of Santo Tomas – Faculty of Engineering, Electronics Engineering Department

---

## 📌 Overview

This experiment introduces basic MATLAB programming through matrix operations. It covers creating real and complex matrices, comparing the different transpose operators, and solving a system of simultaneous linear equations using two methods: the inverse method and Cramer's Rule. The solutions are then verified with numerical checks.

## 🎯 Goals

By the end of this activity, the following should be achieved:

1. Create real and complex matrices in MATLAB.
2. Distinguish the transpose from the complex-conjugate transpose.
3. Express a simultaneous linear system in matrix form.
4. Solve and check a linear system using the inverse method and Cramer's Rule.

---

## 🔹 Problem A: Transpose Operations

**Description:**
A real matrix `R` (3×4) and a complex matrix `Z` (2×3) are defined. For each one, three expressions are computed and displayed: `transpose(A)`, `A'`, and `A.'`. The outputs are compared to see how the operators behave on real versus complex data.

**Code:**

```matlab
%% A. TRANSPOSE OPERATIONS
R = [5 -2  0  7;
    1  3 -4  2;
    6  0  8 -1];

Z = [2+3*i, -1+4*i,  5-2*i;
    -3+i,     6,     2+5*i];

transpose(R)
R'
R.'

transpose(Z)
Z'
Z.'

%% Answers to Guide Questions:
% a. Which operations give identical results for the real matrix R?
%     > All three of them have identical results; transpose(R), R', and R.'
%
% b. Which two operations give identical results for the complex matrix Z?
%     > transpose(Z) and Z.' have identical results.
%
% c. What additional operation is performed by the apostrophe operator ' when the matrix contains complex entries?
%     > The Z' is a complex-conjugate transpose, where it swaps the rows and columns and takes the complex conjugate of the entries.
```

**Answers to guide questions:**

- **a.** For the real matrix `R`, all three operations give identical results.
- **b.** For the complex matrix `Z`, `transpose(Z)` and `Z.'` give identical results.
- **c.** The apostrophe operator `'` also takes the complex conjugate of each entry (complex-conjugate transpose).

---

## 🔹 Problem B: Two Methods for a Linear System

**Description:**
The following system is solved:

```
 2x1 -  x2 + 3x3 + 2x4 = 16
  x1 + 4x2 - 2x3 +  x4 = -7
 3x1 + 2x2 +  x3 -  x4 =  6
-2x1 + 3x2 + 4x3 + 2x4 =  7
```

The coefficient matrix `A` and the right-hand-side vector `b` are created, and the system is solved in two ways:

1. **Inverse method:** `x_inv = inv(A) * b`
2. **Cramer's Rule:** each column of `A` is replaced by `b` in turn, and determinants are used to get `x_cramer`.

MATLAB's left-division operator (`\`) is not used. The results are verified with `det(A)` (which must be nonzero), `norm(x_inv - x_cramer)`, and `norm(A*x_inv - b)`. Both norms should be approximately zero.

**Code:**

```matlab
%% B. TWO METHODS FOR A LINEAR SYSTEM
A = [ 2 -1  3  2;
    1  4 -2  1;
    3  2  1 -1;
    -2  3  4  2];

b = [16; -7; 6; 7];

x_inv = inv(A) * b

x_cramer = arrayfun(@(i) det([A(:,1:i-1), b, A(:,i+1:end)]) / det(A), 1:4)'

det_A = det(A)

norm_diff = norm(x_inv - x_cramer)

norm_residual = norm(A * x_inv - b)
```
