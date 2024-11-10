FROM python:3.8-slim

# Update pip to the latest version
RUN python -m pip install --upgrade pip

# Install CA certificates
RUN apt-get update && apt-get install -y ca-certificates

# Copy the requirements file
COPY requirements.txt .

# Install the dependencies
RUN pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org -r requirements.txt

# Copy the rest of the application code
COPY . /app

# Set the working directory
WORKDIR /app

# Command to run the application
CMD ["python", "app.py"]
