# Flask web application

This part of the project serves as the interface that the user sees on the EC2 server. This project serves as a simple Flask application, that will display a simple interface to the user, for validation that the user has succesfully connected to the provisioned EC2 instance.

## Install guide

### Prerequisites

To run this project locally, a few installations are required to have been done:

1. Install Python: Python is required to run the Flask application. You can download and install Python from the official Python website. You can validate your Python install by running the following command:

   ```
   python3 --version
   ```

2. Install pip: Pip is a package manager for Python that allows you to easily install and manage Python packages. After installing Python, pip should be installed automatically. You can verify the installation by running the following command in your terminal or command prompt:

   ```
   pip --version
   ```

### Installation

If pip is not installed, you can install it by following the instructions on the official pip website.

1. Create a virtual environment (optional): It is recommended to create a virtual environment to isolate the project dependencies. You can create a virtual environment by running the following command in your terminal or command prompt:

   ```
   python -m venv venv
   ```

   This will create a new directory named "venv" which will contain the virtual environment.

2. Activate the virtual environment (optional): If you have created a virtual environment, you need to activate it before installing the project dependencies. You can activate the virtual environment by running the following command in your terminal or command prompt:

   - For Windows:

     ```
     venv\Scripts\activate
     ```

   - For macOS and Linux:

     ```
     source venv/bin/activate
     ```

3. Install project dependencies: The project dependencies are listed in the "requirements.txt" file. You can install them by running the following command in your terminal or command prompt:

   ```
   pip install -r requirements.txt
   ```

   This will install all the necessary packages required to run the Flask application.

4. Run the Flask app locally: Once the dependencies are installed, you can run the Flask application locally by executing the following command in your terminal or command prompt:

   ```
   python app.py
   ```

   This will start the Flask development server, and you can access the application by navigating to http://localhost:5000 in your web browser.

Remember to stop the Flask app by pressing `Ctrl+C` in your terminal or command prompt when you're done.

## Used technologies

Besides the Python logic for the Flask application, this part of the project also contains different definitions and technologies for the deployment of the Flask application on an EC2 instance.

### Flask

Flask is a popular Python web framework used for building web applications. It provides a simple and flexible way to create web services and APIs.

### WSGI

WSGI stands for Web Server Gateway Interface. It is a specification that defines how web servers communicate with web applications written in Python. Flask uses WSGI to interact with web servers and handle HTTP requests and responses.

### NGINX

NGINX is a high-performance web server and reverse proxy server. It is commonly used to serve static files, handle load balancing, and act as a reverse proxy for Flask applications. NGINX can improve the performance and scalability of your Flask application.

### Supervisor

Supervisor is a process control system for Unix-like operating systems. It is used to manage and monitor processes, including Flask applications. Supervisor ensures that your Flask application is always running and can automatically restart it if it crashes or stops for any reason.
