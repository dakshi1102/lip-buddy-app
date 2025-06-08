from tensorflow.keras.models import load_model
import numpy as np

# Load the model
model = load_model('trained_model.h5')

# View summary
model.summary()

# Dummy input for testing (replace with your actual data)
# Example: if your input shape is (10,)
sample_input = np.random.rand(1, 10)  # 1 sample with 10 features
prediction = model.predict(sample_input)

print("Prediction:", prediction)