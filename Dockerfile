FROM python:3.11-slim
WORKDIR /app

RUN apt-get update && apt-get install -y ffmpeg libsm6 libxext6 && rm -rf /var/lib/apt/lists/*

# 1) Copy code & models
COPY . .

# 2) Copy data folder  
COPY data /app/data

# 3) Symlink /data → /app/data  
RUN ln -s /app/data /data

# 4) Install Python deps  
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8501
CMD ["streamlit", "run", "streamlitapp.py", "--server.port=8501", "--server.address=0.0.0.0"]
