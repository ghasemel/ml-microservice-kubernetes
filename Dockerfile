FROM python:3.7.9

## Step 1:
# Create a working directory
WORKDIR /opt/flask

## Step 2:
# Copy source code to working directory
COPY app.py .
COPY requirements.txt .
COPY model_data model_data/


## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN /bin/bash -c 'pip install --upgrade pip &&\
		pip install -r requirements.txt'


## Step 4:
# Expose port 80
EXPOSE 80/tcp


## Step 5:
# Run app.py at container launch
CMD ["python",  "app.py"]