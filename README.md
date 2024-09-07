# SIH'24 Project: Gradsy 🎓✨

![Project Gradsy](https://i.ibb.co/93GHmt4/icon.png) 

### 📜 Problem Statement
- **🆔 ID:** 1609
- **📝 Title:** Implementation of Alumni Association Platform for the University/Institute
- **🏷️ Theme:** Smart Education
- **💻 Category:** Software
- **👥 Team Name:** Orbit Tech

---

## 🚀 Project Overview

Gradsy is an innovative platform aimed at creating a unified Alumni Association for Government Engineering College, accessible via both web and mobile applications. The platform is designed to streamline alumni registration, enhance networking opportunities, facilitate donations, manage job postings, and organize events efficiently. In addition to these core functionalities, Gradsy integrates advanced features such as AI-driven career services and a start-up incubator, making it a one-stop solution for alumni engagement and professional development.

### 🎯 Key Goals:
- 🤝 Boost alumni engagement and connections with the college and among peers.
- 🖥️ Provide a user-friendly interface for managing alumni-related activities.
- 🚀 Support career growth through job postings, networking, and AI-driven career guidance.
- 💡 Foster entrepreneurial initiatives with a dedicated start-up incubator.

![Platform Preview](https://media.giphy.com/media/3o7aD2saalBwwftBIY/giphy.gif) <!-- Add a relevant GIF or image of your platform -->

---

## ✨ Features

- 📚 **Alumni Directory:** Easily search and connect with alumni based on graduation year, department, or current industry.
- 📅 **Event Management:** Create, manage, and RSVP to events, reunions, and webinars.
- 💼 **Job Board:** Post and apply for job opportunities within the alumni network.
- 💰 **Donation Portal:** Securely donate to college initiatives or specific projects.
- 🤖 **AI-driven Career Services:** Personalized career advice, resume reviews, and interview preparation.
- 🚀 **Start-up Incubator:** Support for budding entrepreneurs with mentorship, resources, and networking opportunities.
- 📱 **Mobile and Web Accessibility:** Seamless experience across desktop, tablet, and mobile devices.
- 🔒 **Secure Authentication:** Ensures data privacy and secure access for all users.

---

## 🛠️ Technology Stack

### 🌐 Frontend

#### Website
- 🧩 **Framework:** SvelteKit
- 🎨 **Styling:** Tailwind CSS

#### Desktop
- 🖥️ **Platform:** Electron (wrapping the web application for desktop use)

#### Mobile (Android & iOS)
- 📱 **Language:** Dart 3.0
- 📲 **Framework:** Flutter 3.10

### 🖥️ Backend

#### Database
- 🗄️ **Database:** PostgreSQL

#### Server
- 🌐 **Backend Framework:** Express.js

---

## 🏁 Getting Started

Follow these steps to set up the project on your local machine.

### ✅ Prerequisites

Ensure you have the following software installed:
- [🌐 Node.js](https://nodejs.org/)
- [🛠️ Flutter](https://flutter.dev/)
- [🐘 PostgreSQL](https://www.postgresql.org/)
- [🔗 Git](https://git-scm.com/)

### 🔧 Frontend Setup

#### 🌍 Website

1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the development server:
   ```bash
   npm run dev
   ```

#### 📱 Mobile Application

1. Navigate to the mobile app directory:
   ```bash
   cd app
   cd gradsy
   ```
2. Check Flutter setup:
   ```bash
   flutter doctor
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

### 🔧 Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```
2. Install backend dependencies:
   ```bash
   npm install
   ```
3. Start the server:
   ```bash
   node .
   ```

### 🗄️ Database Setup

1. Connect to PostgreSQL and set up the database:
   ```bash
   psql -U postgres -d gradsy
   ```
2. Import the database schema:
   ```sql
   \i address/SIH24/backend/schema.sql
   ```

---

## 🤝 Contribution Guidelines

We welcome contributions to Gradsy! Please follow these steps:

1. 🍴 Fork the repository.
2. 🌿 Create a new branch (`git checkout -b feature/your-feature-name`).
3. 📝 Commit your changes (`git commit -m 'Add some feature'`).
4. 🚀 Push to the branch (`git push origin feature/your-feature-name`).
5. 📬 Open a pull request.

---

## 📜 License

Gradsy is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

---

## 📞 Contact

For any questions or suggestions, please contact our team at:
- ✉️ **Email:** tanishqbakka1@gmail.com
- 👨‍💻 **Team Lead:** Tanishq Dhote

Stay connected with us on [LinkedIn](https://www.linkedin.com/in/tanishqdhote) and [Discord](https://discord.gg/XNmx5SAYwq).

![Contact Us](https://media.giphy.com/media/3oEduITy6r2okDmfBe/giphy.gif) 