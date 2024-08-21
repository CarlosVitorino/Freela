
# Freela

Freela is a web application designed to help freelancers manage their work efficiently. The app provides tools for session management, financial tracking, and client organization. It's aimed at professionals who work on a per-session basis, such as teachers, beauty professionals, psychologists, therapists, personal trainers, and more.

## Features

- **Session Management:** Register and manage sessions with details like client, date, duration, price, session type, and subtype.
- **Financial Tracking:** Generate invoices from sessions, mark them as paid, and export them to PDF.
- **Dashboard:** View statistics and graphs about your sessions, revenue, and client performance.
- **Client Management:** Organize your clients and keep track of their sessions and payments.

## Project Structure

The project is divided into the following main directories:

- **config**: Configuration files for the project.
- **db**: Database scripts and migrations.
- **docs**: Documentation related to the project.
- **public**: Public assets for the client-side application.
- **public_html**: Public-facing web directory.
- **server**: Backend server code built with the Netuno framework.
- **storage**: Storage for uploads and other files.
- **ui**: User interface components.
- **website**: Client-side React application.

### Inside the `website` Directory (Client-side)

- **src**: Contains the React application source code.
- **public**: Public assets for the React app.
- **package.json**: Lists dependencies and scripts for the React app.
- **build.sh**: Shell script for building the React app.
- **fastBuild.sh**: Shell script for a quicker build process.
- **config-overrides.js**: Customizes the Create React App configuration using `react-app-rewired`.
- **node_modules**: Contains npm dependencies.
- **yarn.lock / package-lock.json**: Lock files for managing dependencies.

### Inside the `server` Directory (Backend)

- **actions**: Custom action scripts for the backend.
- **components**: Reusable backend components.
- **core**: Core functionality and configurations for the Netuno framework.
- **services**: Contains various service endpoints:
  - `_schema`: Database schema services.
  - `client`: Client management services.
  - `company`: Company-related services.
  - `dashboard`: Dashboard data services.
  - `finance`: Financial management services.
  - `invoice`: Invoice services.
  - `provider`: Service provider management.
  - `recovery`: Account recovery services.
  - `session`: Session management services.
  - `sessionType`: Session type management.
  - `sessionSubType`: Session subtype management.
  - `settings`: Application settings services.
  - `supplier`: Supplier management services.
  - `user`: User management services.

## Getting Started

### Prerequisites

- **Node.js** and **npm** (or **yarn**) for the frontend.
- **Netuno** framework for the backend.
- **Java 17** and **GraalVM** for running the backend services.

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/freela.git
   cd freela
   ```

2. **Install Frontend Dependencies:**

   Navigate to the `website` directory and install the dependencies:

   ```bash
   cd website
   npm install
   # or
   yarn install
   ```

3. **Install Backend Dependencies:**

   - Navigate to the `server` directory and install the dependencies:

   ```bash
   cd ../server
   npm install
   ```

  - Install netuno and create a symlink to our app
  
  ```bash
  ln -s /<path_to_app>/Freela /<path_to_netuno>/netuno/apps/Freela
  ```

### Running the Application

#### Frontend

To start the React application:

```bash
cd website
npm start
# or
yarn start
```

This will start the development server and open the app in your default web browser.

#### Backend

To start the Netuno backend server:

```bash
cd /<path_to_netuno>/netuno
./netuno server app=freela
```

For server configuration and running, please check the Netuno documentation available here: [Netuno Documentation](https://doc.netuno.org/docs/en/installation/).

Make sure you have Netuno and GraalVM properly configured on your machine.

### Building for Production

To build the React application for production:

```bash
cd website
npm run build
# or
yarn build
```

This will create an optimized build of the frontend in the `build` directory.

### Deployment

Deploy the contents of the `build` directory and the `server` directory to your production server.

## Contributing

If you wish to contribute to the project, please fork the repository and submit a pull request. We welcome all improvements, whether they're code, documentation, or other enhancements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions or support, please reach out to [Carlos](mailto:cvitorino@me.com).
