# Use latest Python runtime as a parent image
FROM python:3.10.12-slim-buster

# Meta-data
LABEL maintainer="Shuyib" \
      description="Workshop on Genomic Data Science in general"
      
# Set the working directory to /app
WORKDIR /app

# ensures that the python output is sent to the terminal without buffering
ENV PYTHONUNBUFFERED=TRUE

# Copy the current directory contents into the container at /app
COPY . /app

# create a virtual environment, activate it and install the required libraries
RUN pip --no-cache-dir install --upgrade pip &&\
            pip --no-cache-dir install --requirement requirements.txt

# Make port 9090 available to the world outside this container
EXPOSE 9090

# Create mountpoint
VOLUME /app

# Run jupyter when container launches
CMD ["jupyter", "notebook", "--ip='0.0.0.0'", "--port=9090", "--no-browser", "--allow-root"]