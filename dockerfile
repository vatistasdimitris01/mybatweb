# Use a lightweight Python image
FROM python:3.11-slim

# Set the working directory
WORKDIR /usr/src/app

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Command to run the application
CMD ["gunicorn", "-b", "0.0.0.0:8000", "searxng.wsgi:application"]
