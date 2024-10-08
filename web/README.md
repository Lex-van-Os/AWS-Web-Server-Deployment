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

   If pip is not installed, you can install it by following the instructions on the official pip website.

3. Create a virtual environment (optional): It is recommended to create a virtual environment to isolate the project dependencies. You can create a virtual environment by running the following command in your terminal or command prompt:

   ```
   python -m venv venv
   ```

   This will create a new directory named "venv" which will contain the virtual environment.

4. Activate the virtual environment (optional): If you have created a virtual environment, you need to activate it before installing the project dependencies. You can activate the virtual environment by running the following command in your terminal or command prompt:

   - For Windows:

     ```
     venv\Scripts\activate
     ```

   - For macOS and Linux:

     ```
     source venv/bin/activate
     ```

5. Install project dependencies: The project dependencies are listed in the "requirements.txt" file. You can install them by running the following command in your terminal or command prompt:

   ```
   pip install -r requirements.txt
   ```

   This will install all the necessary packages required to run the Flask application.

6. Run the Flask app locally: Once the dependencies are installed, you can run the Flask application locally by executing the following command in your terminal or command prompt:

   ```
   python app.py
   ```

   This will start the Flask development server, and you can access the application by navigating to http://localhost:5000 in your web browser.

Remember to stop the Flask app by pressing `Ctrl+C` in your terminal or command prompt when you're done.
