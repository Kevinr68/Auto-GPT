<<<<<<< HEAD
# Use an official Python base image from the Docker Hub
FROM python:3.11-slim

# Install git
RUN apt-get -y update
RUN apt-get -y install git chromium-driver

# Set environment variables
ENV PIP_NO_CACHE_DIR=yes \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Create a non-root user and set permissions
RUN useradd --create-home appuser
WORKDIR /home/appuser
RUN chown appuser:appuser /home/appuser
USER appuser

# Copy the requirements.txt file and install the requirements
COPY --chown=appuser:appuser requirements-docker.txt .
RUN pip install --no-cache-dir --user -r requirements-docker.txt

# Copy the application files
COPY --chown=appuser:appuser autogpt/ ./autogpt

# Set the entrypoint
ENTRYPOINT ["python", "-m", "autogpt"]
=======
FROM python:3.11

WORKDIR /app
COPY scripts/ /app
COPY requirements.txt /app

RUN pip install -r requirements.txt

CMD ["python", "main.py"]
>>>>>>> 10976b6dfc231a8331ce6d05d89536642c047c0a
