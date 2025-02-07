# Numerical Computation Project (Finite Difference Method)

This project is a MATLAB implementation for solving a **numerical computation problem** using the **finite difference method**. The problem involves computing the horizontal displacement of a **fixed-end bar under uniform axial loading**, given its varying cross-sectional area.

## 📌 Problem Description
The project requires solving the **differential equation of a bar** with a fixed end under uniform axial load `q(x)`, using the finite difference method. The bar has a cross-sectional area that changes along its length, given by:

\[
A(x) = ax^2 + bx + c
\]

The differential equation governing the displacement `u(x)` is:

\[
\frac{d}{dx} \left( E A(x) \frac{du}{dx} \right) + q(x) = 0
\]

where:
- \( E \) = Elastic modulus of the material (assumed for steel)
- \( A(x) \) = Cross-sectional area of the bar
- \( q(x) \) = Applied axial load (can be constant or function of `x`)

### 📌 Additional Requirements
1. The **LU decomposition** method must be implemented **without using MATLAB’s built-in functions**.
2. The **Gauss-Jordan method** should be implemented as an alternative solution.
3. The program should be capable of handling:
   - **Variable load** `q(x) = sin(x)`
   - **Point load** at `x = 10` with `10,000 kg` force.

---

## 📂 Project Structure
- `main.m` → The main MATLAB script for solving the problem.
- `Project.pdf` → The project report detailing methodology and implementation.

---

## 🚀 How to Run
1. Open MATLAB.
2. Run `main.m` script.
3. Input required parameters when prompted.
4. The program will compute and display the displacement results.

---

## 📜 Report Submission Requirements
- A well-documented **typed report** explaining the methodology and results.
- All MATLAB scripts must be included.
- Final submission should be a **compressed file (.zip or .rar)** named as:
  
  ```
  StudentName_StudentID.rar
  ```
- Any **plagiarism** will result in a **zero grade**.

---

## 🏗️ Future Improvements
- Extend the program for **non-uniform material properties**.
- Implement **higher-order finite difference schemes** for better accuracy.
- Develop a **GUI for visualization** of the displacement profile.

---

## 📧 Contact
For any questions, feel free to reach out.

---

📌 **Created for the Numerical Computation Course (1403-1402, Civil Engineering Department)**