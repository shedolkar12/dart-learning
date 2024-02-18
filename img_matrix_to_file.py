import numpy as np

# Suppose img_matrix is your image matrix
img_matrix = np.array([[255, 255, 255], [0, 0, 0], [128, 128, 128]])

# Convert the array into a string representation
matrix_str = '\n'.join([' '.join(map(str, row)) for row in img_matrix])

# Write the string representation to a text file
with open('matrix.txt', 'w') as file:
    file.write(matrix_str)