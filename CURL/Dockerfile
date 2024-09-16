FROM python:3.8-slim

# Create a small Flask application
WORKDIR /app
COPY app.py /app

# Install Flask
RUN pip install flask

# Expose port
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
