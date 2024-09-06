FROM python:3.9-alpine

# Create a non-root user and group
RUN addgroup -S saleor && adduser -S saleor -G saleor

# Set the working directory
WORKDIR /app

# Copy the application code
COPY --chown=saleor:saleor . .

# Install dependencies
RUN pip install -r requirements.txt

# Switch to the non-root user
USER saleor

# Set the command to run the application
CMD ["python", "app.py"]

