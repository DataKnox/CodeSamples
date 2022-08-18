# pip3 install scikit-learn numpy onnxmltools onnxruntime pyodbc setuptools skl2onnx sqlalchemy pandas


import pandas as pd  # doctest: +SKIP
import numpy as np
import pyodbc

from sklearn.datasets import fetch_california_housing
housing = fetch_california_housing()
print(housing)


drivers = pyodbc.drivers()
print(drivers)
