import numpy as np

# Assuming you already have loaded the image using cv2
# img = cv2.imread('image.jpg')

# Convert the image to a NumPy array
# img_array = np.array(img)

# For demonstration, let's create a random array of similar shape
img_array = np.random.randint(0, 255, size=(1000, 1000, 3), dtype=np.uint8)

# Save the array to a text file
np.savetxt('image_matrix.txt', img_array.flatten(), fmt='%d')

# If you want to preserve the shape information, you can save it as a separate file
np.savetxt('image_shape.txt', img_array.shape, fmt='%d')
# 